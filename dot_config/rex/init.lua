--
-- Initialisation file for Rex.
--
-- @author Chris Walker.
--

require('projects')
require('containers')
local float = require('float')

--
-- Pane/splits.
--

-- Zoom.
rex.bind("alt+m", "pane.zoom")

-- Create splits.
rex.bind("alt+\\", "pane.split", { direction = "right" })
rex.bind("alt+-", "pane.split", { direction = "down" })

-- Move between splits.
rex.bind("alt+h", "pane.focus.left", { wrap = true })
rex.bind("alt+j", "pane.focus.down", { wrap = true })
rex.bind("alt+k", "pane.focus.up", { wrap = true })
rex.bind("alt+l", "pane.focus.right", { wrap = true })

-- Resize splits.
rex.mode("resize", { exclusive = true })
rex.bind("alt+r", "client.mode.enter", { name = "resize" })

rex.bind("resize/h", "pane.resize", { direction = "left", amount = 2 })
rex.bind("resize/j", "pane.resize", { direction = "down", amount = 2 })
rex.bind("resize/k", "pane.resize", { direction = "up", amount = 2 })
rex.bind("resize/l", "pane.resize", { direction = "right", amount = 2 })

-- Contextual floating panes (currently opens a new floating pane in
-- the current pane's cwd).
float.action {
    name = "float_shell",
    title = "Float: shell here",
    key = "alt+=",
    prepare = function(ctx)
        return { cwd = float.cwd(ctx) }
    end,
}

rex.bind("alt+q", "pane.close")

--
-- Sessions.
--
rex.bind("alt+s", "session.switch")
