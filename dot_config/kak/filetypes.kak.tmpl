# -----------------------------------------------------------------------------
# Filetypes configuration.
# -----------------------------------------------------------------------------

# Config for Go filetypes
hook global WinSetOption filetype=go %{
    # Use golangci-lint for linting
    set window formatcmd 'goimports'
    set window lintcmd 'golangci-lint run'

    # LSP-related config
    lsp-enable-window
	lsp-inlay-diagnostics-enable buffer
    set window lsp_auto_highlight_references true

    # Run goimports for formatting
    hook buffer BufWritePre .* %{
		format-buffer
        lint
    }

    # Override some plugin colours
    set-face global Uninstrumented black
}

# Shell scripts
hook global WinSetOption filetype=sh %{
    # Use shellcheck for linting
    set window lintcmd 'shellcheck -fgcc -Cnever'
    set window formatcmd 'shfmt -ci -i 2'

    # Format and lint on save
    hook buffer BufWritePre .* %{
        format
        lint
    }
}

# JSON
hook global WinSetOption filetype=json %{
    set window formatcmd 'jsonfmt'

    # No formatting on save; don't always want
    # to do this.
}

# WebAssembly Text files (just highlight as Lisp)
hook global BufCreate .*\.wat %{
   set buffer filetype lisp 
}
