#
# Neodark theming
# -----------------------------------------------------------------------------

# General colours
set -g status-fg colour0
set -g status-bg colour13

# Active pane foreground
set -g status-fg colour0
set -g status-bg colour13

# Left 
set -g status-left-length 30
set -g status-left "  " 

# Window list
set -g status-justify left
set -g window-status-separator " "
setw -g window-status-style bold

setw -g window-status-format "#[bg=colour13 fg=colour15]  #I #[bg=colour13 fg=colour15]#W #F  "
setw -g window-status-current-format "#[bg=black fg=colour15]  #I #[bg=black fg=colour15]#W #F  "

setw -g window-status-activity-style "fg=colour1,bg=colour240"

# Right side
set -g status-right-length 50
set -g status-right-style bold
set -g status-right "#[bg=black fg=colour15] %a %H:%M %d/%m/%Y #[fg=colour15]#S@#h "
