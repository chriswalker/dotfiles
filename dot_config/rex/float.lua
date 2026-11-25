--
-- Display contextual floating panes - at the moment, just opens a floating window
-- in the same cwd as the pane that had focus when the command was invoked.
-- Over time will add to this to do different things based on the the context.
--

local M = {}

-- Opens a centred floating terminal. spec has command (optional; a shell
-- without one), cwd, label and size (a fraction of the window, default 0.5).
function M.open(spec)
    local size = spec.size or 0.5
    return rex.session.new_layer {
        bounds = { (1 - size) / 2, (1 - size) / 2, size, size },
        focus = true,
        layout = {
            block = {
                flavor = "com.superlogical.terminal.shell",
                label = spec.label,
                options = { command = spec.command, cwd = spec.cwd },
            },
        },
    }
end

-- Defines an action that opens a floating pane. def.prepare(ctx, args) looks
-- at the context and returns a spec for open, or nil to do nothing.
function M.action(def)
    rex.action {
        name = def.name,
        title = def.title,
        run = function(ctx, args)
            local spec = def.prepare(ctx, args)
            if spec then
                M.open(spec)
            end
        end,
    }
    if def.key then
        rex.bind(def.key, def.name)
    end
end

-- Returns the working directory the focused pane last reported, or nil if it
-- hasn't reported one. Shells such as fish report it as a file:// URL.
function M.cwd(ctx)
    local r = rex.block.call("com.superlogical.terminal", "pwd", { block_id = ctx.block_id })
    local pwd = r and r.pwd
    if not pwd then
        return nil
    end
    -- Rex reports pwd as a file URL, so need to convert.
    pwd = pwd:gsub("^file://[^/]*", "")
    return (pwd:gsub("%%(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
    end))
end

return M
