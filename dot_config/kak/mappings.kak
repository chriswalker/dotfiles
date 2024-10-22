# -----------------------------------------------------------------------------
# Keyboard mappings - general
# See plugins.kak for plugin-specific mappings
# -----------------------------------------------------------------------------

# General mappings
# -----------------------------------------------------------------------------

# Comment out lines
map -docstring "Comment/uncomment selection (#)" global normal '#' ':comment-line<ret>'

# jj to escape
hook global InsertChar j %{ 
    try %{
        exec -draft hH <a-k>jj<ret> d
        exec <esc>
    }
}

# Use tab/shift-tab to cycle through completion results
hook global InsertCompletionShow .* %{
    map window insert <tab> <c-n>; map window insert <s-tab> <c-p>
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>; unmap window insert <s-tab> <c-p>
} 

# See:
# https://github.com/mawww/kakoune/wiki/Selections#how-to-make-x-select-lines-downward-and-x-select-lines-upward
define-command -params 1 extend-line-down %{
    exec "<a-:>%arg{1}x"
}
define-command -params 1 extend-line-up %{
    exec "<a-:><a-;>%arg{1}K<a-;>"
    try %{
        exec -draft ';<a-K>\n<ret>'
        exec X
    }
    exec '<a-;><a-X>'
}
# nx selected n lines down
map global normal x ':extend-line-down %val{count}<ret>'
# nX select n lines above
map global normal X ':extend-line-up %val{count}<ret>'

# Invoke fuzzy-finder
map -docstring "Fuzzy-find files" global user f ':fz '

# Open a new pane with the same Kakoune session
map -docstring "Wezterm - Split right" global normal <c-l> ':wezterm-terminal-horizontal kak -c %val{session}<ret>'
