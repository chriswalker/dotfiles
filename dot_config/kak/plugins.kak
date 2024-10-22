# -----------------------------------------------------------------------------
# Plugin configuration.
# -----------------------------------------------------------------------------

# Already sourced in kakrc
plug "andreyorst/plug.kak" noload

# golang.kak - additional Go-related functionality
# -----------------------------------------------------------------------------
plug "chriswalker/golang.kak" ensure %{
    map -docstring "Go - Switch to alternate file" global user a :go-alternate<ret>
    map -docstring "Go - Run tests in current package" global user t :go-test<ret>
    map -docstring "Go - Display godoc for symbol under cursor" global user d :go-doc-info<ret>
    map -docstring "Go - Display coverage for current file" global user c :go-coverage<ret>
    map -docstring "Go - Add JSON tags to struct" global user j :go-add-tags<space>json<ret>
}

