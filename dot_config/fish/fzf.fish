#
# fzf.fish - fzf configuration
#
# @author Chris Walker
#

# Use ripgrep in searches.
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'

# Set theming.
set -x FZF_DEFAULT_OPTS '
    --color=16
    --color=gutter:bright-white
    --color=prompt:black
    --color=fg+:black
    --color=bg+:bright-yellow
    --color=hl:yellow:bold:reverse
    --color=hl+:yellow:bold:reverse
    --color=pointer:black:bold
    --color=info:blue:bold:reverse
    --color=preview-fg:blue
    
    --pointer=">"
    --no-scrollbar
    --no-separator
    --layout=reverse
    --info=inline
    --border=top
    --preview-window border-line
    '

# cat command for use in  previews.
set -l cat_cmd '/bin/cat'

# Set preview command.
set -x FZF_PREVIEW_COMMAND "$cat_cmd"

# Ctrl-T/History searching.
set -x FZF_CTRL_R_OPTS "--border-label=\" History \" --border-label-pos=2"

# Alt-C/Directories options - show tree of selected directory.
set -x FZF_ALT_C_OPTS "--border-label=\" Directories \" --border-label-pos=2 --preview 'tree {}'"

# Ctrl-T/File matching  options.
set -x FZF_CTRL_T_OPTS "--border-label=\" Files \" --border-label-pos=2 --preview '$cat_cmd {}'"

