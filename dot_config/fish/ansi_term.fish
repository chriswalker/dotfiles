#
# ansi_term.fish - General theming of Fish based on the
# terminal's ANSI colour settings.
#
# @author Chris Walker
#

set fish_color_error brred --underline
set fish_color_comment brblack
set fish_color_quote green
set fish_color_match bryellow
set fish_color_command brblue
set fish_color_param brwhite
set fish_color_autosuggestion brblack
set fish_color_redirection magenta
set fish_color_end white
set fish_color_operator magenta
set fish_color_escape magenta

set fish_pager_color_description blue
set fish_pager_color_prefix brwhite --bold
set fish_pager_color_completion blue

set fish_pager_color_selected_description black
set fish_pager_color_selected_prefix white --bold
set fish_pager_color_selected_completion white --bold
set fish_pager_color_selected_background --background=blue

set fish_pager_color_progress bryellow --bold
