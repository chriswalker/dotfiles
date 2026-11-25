--
-- Pick a running container (Docker or Apple) and open a shell in it in a
-- floating pane.
--

local float = require("float")

-- The Rex server runs with a minimal PATH, without Homebrew's or Docker's
-- directories.
local tool_path = "/opt/homebrew/bin:/usr/local/bin:" .. (os.getenv("PATH") or "")

-- Runs bash if the container has it, otherwise sh.
local shell = "command -v bash >/dev/null && exec bash || exec sh"

-- Runs a 'list containers' command, returning its output, or nil if the tool isn't
-- installed or fails (e.g. Docker or Apple's container service isn't running).
local function list(argv)
    local r = rex.exec(argv, { env = { PATH = tool_path }, timeout = 5 })
    if not r or not r.ok then
        return nil
    end
    return r.stdout
end

-- Each source lists its running containers as picker items, and builds the
-- command that opens a shell in one.
local sources = {
    docker = {
        items = function()
            local out = list({
                "docker", "ps", "--format", "{{.Names}}\t{{.Image}}\t{{.Status}}",
            })
            local items = {}
            for line in (out or ""):gmatch("[^\n]+") do
                local name, image, status = line:match("^([^\t]*)\t([^\t]*)\t(.*)$")
                if name then
                    items[#items + 1] = {
                        id = "docker:" .. name,
                        title = name,
                        subtitle = image,
                        detail = "docker · " .. status,
                    }
                end
            end
            return items
        end,
        command = function(id)
            return { "docker", "exec", "-it", id, "sh", "-c", shell }
        end,
    },

    apple = {
        items = function()
            local out = list({ "container", "list", "--format", "json" })
            local items = {}
            for _, c in ipairs(out and rex.json.decode(out) or {}) do
                local cfg = c.configuration or {}
                if cfg.id then
                    items[#items + 1] = {
                        id = "apple:" .. cfg.id,
                        title = cfg.id,
                        subtitle = cfg.image and cfg.image.reference,
                        detail = "apple · " .. tostring(c.status and c.status.state or c.status),
                    }
                end
            end
            return items
        end,
        command = function(id)
            return { "container", "exec", "-it", id, "sh", "-c", shell }
        end,
    },
}

float.action {
    name = "container_shell",
    title = "Containers: Open Shell…",
    key = "alt+c",
    prepare = function(ctx, args)
        local items = {}
        for _, source in pairs(sources) do
            for _, item in ipairs(source.items()) do
                item.icon = "package"
                items[#items + 1] = item
            end
        end
        table.sort(items, function(a, b)
            return a.title:lower() < b.title:lower()
        end)

        local choice, why = rex.ui.pick {
            title = #items > 0 and "Open container shell" or "No running containers",
            placeholder = "Filter containers",
            items = items,
        }
        if choice == nil then
            if why ~= "cancelled" then
                rex.log("warn", "container_shell: " .. why)
            end
            return nil
        end

        local kind, id = choice:match("^(%w+):(.+)$")
        return { command = sources[kind].command(id), label = id }
    end,
}
