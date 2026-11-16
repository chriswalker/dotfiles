# -----------------------------------------------------------------------------
# Plugin configuration.
# -----------------------------------------------------------------------------

# Already sourced in kakrc.
plug "andreyorst/plug.kak" noload

# golang.kak - additional Go-related functionality.
# -----------------------------------------------------------------------------
plug "https://tangled.org/chrismwalker.net/golang.kak" ensure %{
    map -docstring "Go - Switch to alternate file" global user a :go-alternate<ret>
    map -docstring "Go - Run tests in current package" global user t :go-test<ret>
    map -docstring "Go - Display godoc for symbol under cursor" global user d :go-doc-info<ret>
    map -docstring "Go - Display coverage for current file" global user c :go-coverage<ret>
    map -docstring "Go - Add JSON tags to struct" global user j :go-add-tags<space>json<ret>
}

# rex.kak - makes Kakoune Rex-aware, if Kakoune is running within Rex.
# -----------------------------------------------------------------------------
try %{
    evaluate-commands %sh{ [ -n "$REX_SESSION" ] || echo fail }
    
    plug "https://tangled.org/chrismwalker.net/rex.kak" ensure %{
        hook global ModuleLoaded rex %{
            try %{
                declare-user-mode rex
            }
            map -docstring "Rex - Enter Rex user mode" global user r ":enter-user-mode rex<ret>"

            # REPL.
            map -docstring "Send selection to REPL" global rex s ':repl-send-text<ret>'
            map -docstring "Open a new REPL pane" global rex n ':repl-new<space>'
            map -docstring "Use existing pane as REPL target" global rex p ':rex-repl-set-pane<space>'

            # Named run panes.
            map -docstring "Run in a named pane" global rex r ':rex-run<space>'
            map -docstring "Re-run last" global rex . ':rex-rerun<ret>'
            map -docstring "Stop a named pane" global rex k ':rex-stop<ret>'

            # Split-and-run.
            map -docstring "Split right and run" global rex '\' ':rex-terminal-horizontal<space>'
            map -docstring "Split down and run" global rex <minus> ':rex-terminal-vertical<space>'
            # Open a new pane with the same Kakoune session
            map -docstring "New client - split right" global normal <c-l> ':evaluate-commands %{ set-option local windowing_placement horizontal; new }<ret>'
        } 
    }
}
