# -----------------------------------------------------------------------------
# Plugin configuration.
# -----------------------------------------------------------------------------

# Already sourced in kakrc
plug "andreyorst/plug.kak" noload

# kak-lsp (Language Server Protocol client)
# -----------------------------------------------------------------------------
plug "kak-lsp/kak-lsp" ensure %{
    # TODO debug - uncomment if diagnosing LSP issues
    # eval %sh{echo ${kak_opt_lsp_cmd} >> /tmp/kak-lsp.log}
    # set global lsp_cmd "kak-lsp -s %val{session} -vvv --log /tmp/kak-lsp.log"
    # TODO debug

    # set global lsp_diagnostic_line_error_sign '▶'
    # set global lsp_diagnostic_line_warning_sign '▶'

    # TODO - Switch off logging to debug buffer

    hook global KakEnd .* lsp-exit

    # Make the hover stuff suck less; supress the "no object found" info box
    define-command -override -hidden lsp-show-error -params 1 -docstring "Render error (suppress useless gopls errors)" %{
        evaluate-commands %sh{
            if [ "$1" = "go language server error: 'no object found'" ]; then
                exit 0
            fi
            echo 'info %arg{1}'
        }
    }

    # Show implementations
    map -docstring "LSP - Show implementations" global user i :lsp-implementation<ret>
    # Show references
    map -docstring "LSP - Show references" global user r :lsp-references<ret>
    # Switch to LSP user mode
    map -docstring "LSP - Enter LSP user mode" global user l :enter-user-mode<space>lsp<ret>
    # Prev function - 9 = (
    map -docstring "LSP - Previous function" global normal ( :lsp-previous-function<ret>
    # Next function - 0 = )
    map -docstring "LSP - Next function" global normal ) :lsp-next-function<ret>
}

# golang.kak - additional Go-related functionality
# -----------------------------------------------------------------------------
plug "chriswalker/golang.kak" ensure %{
    map -docstring "Go - Switch to alternate file" global user a :go-alternate<ret>
    map -docstring "Go - Run tests in current package" global user t :go-test<ret>
    map -docstring "Go - Display godoc for symbol under cursor" global user d :go-doc-info<ret>
    map -docstring "Go - Display coverage for current file" global user c :go-coverage<ret>
    map -docstring "Go - Add JSON tags to struct" global user j :go-add-tags<space>json<ret>
}

