# -----------------------------------------------------------------------------
# Filetypes configuration.
# -----------------------------------------------------------------------------

# Config for Go filetypes.
hook global WinSetOption filetype=go %{
    # Use golangci-lint for linting.
    set window formatcmd 'goimports'
    set window lintcmd 'golangci-lint run'

    # LSP-related config.
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

    # Add in previously defaulted mappings in kak-lsp
    map global goto d <esc>:lsp-definition<ret> -docstring 'LSP definition'
    map global goto r <esc>:lsp-references<ret> -docstring 'LSP references'
    map global goto y <esc>:lsp-type-definition<ret> -docstring 'LSP type definition'

    # Provide easy-access to LSP user mode.
    map -docstring "LSP - Enter LSP user mode" global user l :enter-user-mode<space>lsp<ret>
    
    # Run goimports for formatting.
    hook buffer BufWritePre .* %{
		format-buffer
        lint
    }

    # Override some plugin colours.
    set-face global Uninstrumented black
    set-face global Covered rgb:57864E,rgb:EFFEEC
    set-face global NotCovered rgb:B85C57,rgb:F8E7E7
}

# Go module files.
hook global BufCreate .*go\.(mod|sum) %{
    set-face global Dependency black
    set-face global Hash rgb:57864E,rgb:EFFEEC
    set-face global Version rgb:2A8DC5,rgb:E2F1F8
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

# Protobufs.
hook global WinSetOption filetype=protobuf %{
    # LSP-related config.
    set-option buffer lsp_servers %{
        [buf]
        filetypes = ["protobuf"]
        root_globs = [".git", ".hg"]
        command = "buf"
        args = ["lsp", "serve"]
        settings_section = "buf"
    }
    lsp-enable-window
	lsp-inlay-diagnostics-enable buffer
    set-option global lsp_auto_highlight_references true

    set window lintcmd 'buf lint'
    set window formatcmd 'buf format'

    # Format and lint on save.
    hook buffer BufWritePre .* %{
        format
        lint
    }
}
