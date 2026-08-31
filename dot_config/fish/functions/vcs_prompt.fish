function vcs_prompt \
    --description 'Print all customised vcs prompts'
    # This is used in place of Fish's built-in fish_vcs_prompt, and
    # saves us having to edit it manually. We'll always be adding our
    # own custom functions.

	# If a prompt succeeded, we assume that it printed the correct info.
    jj_prompt $argv
    or fish_git_prompt $argv
end
