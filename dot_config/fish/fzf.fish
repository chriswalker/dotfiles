#
# fzf.fish - fzf configuration
#
# @author Chris Walker
#

# Use ripgrep in searches
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'

# Set theming.
set -x FZF_DEFAULT_OPTS '
    --color=16
    --color=gutter:bright-white
    --color=prompt:black
    --color=fg+:black
    --color=bg+:white
    --color=hl:#2A8DC5:bold:underline
    --color=hl+:#2A8DC5:bold:reverse
    --color=pointer:black:bold
    --color=info:#98CE8F:bold:reverse
    --color=preview-bg:#FFFFC7
    --pointer=">"
    --no-scrollbar
    --no-separator
    --layout=reverse
    --info=inline
    --border
    '
    # --color=16,prompt:black,info:green,fg+:black:bold,bg+:bright-white
    # --color=hl+:red,hl:black:reverse,hl+:black:reverse
    # --color=pointer:black:bold,info:blue:reverse
    # --pointer=">"
    # --no-scrollbar
    # --no-separator
# '

# cat command for use in  previews.
set -l cat_cmd '/bin/cat'

# Set preview command.
set -x FZF_PREVIEW_COMMAND "$cat_cmd"

# Show tree of selection in directory matching.
set -x FZF_ALT_C_OPTS "--preview 'tree {}'"

# Ctrl-T options.
set -x FZF_CTRL_T_OPTS "--preview '$cat_cmd {}'"

