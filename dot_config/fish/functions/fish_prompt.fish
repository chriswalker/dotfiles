function fish_prompt \
  --description 'Write out the prompt'

    set -l cmd_status $status

    # No limit to pwd output.
    set -g fish_prompt_pwd_dir_length 0

    # Set up some colour variables.
    set -l normal (set_color normal)
    set -l ssh_hostname (set_color --bold blue)
    set -l error (set_color --background brred red)

	# If logged in vi SSH, emit hostname.
    if test -n "$SSH_TTY"
        printf '%s[%s]%s ' $ssh_hostname (prompt_hostname) $normal
    end

    # PWD.
    if test $cmd_status -eq 0
        printf '%s%s%s' $normal (prompt_pwd) (fish_git_prompt)
    else
        printf '%s%s%s' $error (prompt_pwd) (fish_git_prompt)
    end

    # Second line.
    printf '%s\n> ' $normal
end
