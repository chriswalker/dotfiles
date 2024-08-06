#
# fzf.fish - fzf configuration
#
# @author Chris Walker
#

# Use ripgrep in searches
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'

# Set ANSI theming - defaults to colours terminal is set to.
set -x FZF_DEFAULT_OPTS '
    --color=16,prompt:black,info:green,fg+:black:bold,bg+:bright-white
    --color=hl+:red,hl:black:reverse,hl+:black:reverse
    --color=pointer:black:bold,info:blue:reverse
    --pointer=">"
    --no-scrollbar
    --no-separator
'

# bat command for use in  previews
set -l bat_cmd 'bat --style=snip --theme=ansi --color=always'

# Set preview command
set -x FZF_PREVIEW_COMMAND "$bat_cmd"

# Show tree of selection in directory matching
set -x FZF_ALT_C_OPTS "--preview 'tree {}'"

# Ctrl-T options
set -x FZF_CTRL_T_OPTS "--preview '$bat_cmd {}'"
