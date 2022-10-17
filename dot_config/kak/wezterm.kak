# -----------------------------------------------------------------------------
# wezterm.kak
#
# This module provides very basic pane-splitting functionality 
# -----------------------------------------------------------------------------

provide-module wezterm %{

    # Ensure we're running inside wezterm
	# evaluate-commands %sh{
	# 	[ -z "${WEZTERM_EXECUTABLE}" ] || echo "fail 'wezterm' not detected"
	# }


    # Create a new Wezterm pane in the given direction, and run any command
	# supplied in the new pane.
	# ----------------------------------------------------------------------------
	define-command wezterm-split -params ..2 -docstring "Creates a new Wezterm pane in the given direction, executing any supplied program" %{
		evaluate-commands nop %sh{
			cmd_str=""
			if [ -n "${1}" ]; then
				cmd_str="--${1}"
			fi
			if [ -n "${2}" ]; then
				cmd_str="$cmd_str -- ${2}"
			fi
			# TODO - hard-coded for the moment
			/Applications/WezTerm.app/Contents/MacOS/wezterm cli split-pane $cmd_str
        }	
	}
}

require-module wezterm
