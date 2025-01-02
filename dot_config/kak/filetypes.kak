# -----------------------------------------------------------------------------
# Filetypes configuration.
# -----------------------------------------------------------------------------

# Config for Go filetypes.
hook global WinSetOption filetype=go %{
    # Use golangci-lint for linting.
    set window formatcmd 'goimports'
    set window lintcmd 'golangci-lint run'

    # LSP-related config.
    set-option buffer lsp_servers %{
        [gopls]
        root_globs = ["Gopkg.toml", "go.mod", ".git", ".hg"]
        settings_section = "gopls"
    }
    lsp-enable-window
	lsp-inlay-diagnostics-enable buffer
    set-option global lsp_auto_highlight_references true

    # Some additional LSP functionality to the goto/user mappings.
    map -docstring 'implementations' global goto I '<esc>:lsp-implementation<ret>' 

    # Show hover info for the symbol under the cursor.
    map -docstring "Show hover info for symbol" global user i ':lsp-hover<ret>'
    # Jump to prev/next functions.
    map -docstring "previous function" global goto [ '<esc>:lsp-previous-function<ret>'
    map -docstring "next function" global goto ] '<esc>:lsp-next-function<ret>'
    # Fuzzy-find document symbols and jump to selection.
    map -docstring "document symbol" global goto s '<esc>:lsp-goto-document-symbol<ret>'

    # Provide easy-access to LSP user mode.
    map -docstring "LSP - Enter LSP user mode" global user l :enter-user-mode<space>lsp<ret>
    
    # Run goimports for formatting.
    hook buffer BufWritePre .* %{
		format-buffer
        lint
    }

    # Override some plugin colours.
    set-face global Uninstrumented black
}

# Go module files.
hook global BufCreate .*go\.(mod|sum) %{
    set-face global Dependency black
    set-face global Hash green
    set-face global Version blue
}

# Shell scripts.
hook global WinSetOption filetype=sh %{
    # Use shellcheck for linting.
    set window lintcmd 'shellcheck -fgcc -Cnever'
    set window formatcmd 'shfmt -ci -i 2'

    # Format and lint on save.
    hook buffer BufWritePre .* %{
        format
        lint
    }
}

# JSON.
hook global WinSetOption filetype=json %{
    set window formatcmd 'jsonfmt'

    # No formatting on save; don't always want
    # to do this.
}

# WebAssembly Text files (just highlight as Lisp).
hook global BufCreate .*\.wat %{
   set buffer filetype lisp 
}
