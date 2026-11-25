--
-- Pick a project under ~/Projects/Go and open it in a new tab.
--

local projects_root = os.getenv("HOME") .. "/Projects/Go"

-- Returns the current branch of a git checkout, or nil if dir isn't one.
-- TODO: Make this Jujutsu-aware.
local function git_branch(dir)
    local f = io.open(dir .. "/.git/HEAD")
    if not f then
        return nil
    end
    local head = f:read("*l") or ""
    f:close()
    return head:match("^ref: refs/heads/(.+)$") or "detached"
end

rex.action {
    name = "project_open",
    title = "Projects: Open…",
    run = function(ctx, args)
        local r, err = rex.exec({
            "find", projects_root, "-mindepth", "1", "-maxdepth", "1",
            "-type", "d", "!", "-name", ".*",
        })
        if not r then
            rex.log("warn", "project_open: " .. err)
            return
        end

        local items = {}
        for dir in r.stdout:gmatch("[^\n]+") do
            local name = dir:match("[^/]+$")
            items[#items + 1] = {
                id = dir,
                title = name,
                icon = "folder",
                detail = git_branch(dir),
            }
        end
        table.sort(items, function(a, b)
            return a.title:lower() < b.title:lower()
        end)

        local dir, why = rex.ui.pick {
            title = "Open project",
            placeholder = "Filter projects",
            items = items,
        }
        if dir == nil then
            if why ~= "cancelled" then
                rex.log("warn", "project_open: " .. why)
            end
            return
        end

        rex.session.new_window {
            window_label = dir:match("[^/]+$"),
            layout = rex.layout.block {
                flavor = "com.superlogical.terminal.shell",
                options = { cwd = dir },
            },
        }
    end,
}
rex.bind("alt+p", "project_open")
