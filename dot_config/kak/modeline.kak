# -----------------------------------------------------------------------------
# modeline.kak - formatting the status line
# -----------------------------------------------------------------------------

declare-option -docstring "VCS information (Jujutsu or Git) for the current buffer" \
    str modeline_vcs_info
    
hook global WinCreate .* %{
    hook window NormalIdle .* %{
        evaluate-commands %sh{
            vcs_info=""
            if jj root --quiet &>/dev/null; then
              # In a Jujutsu repository - get the current Change ID
              # and any bookmark.
              working_copy=$(jj log --no-graph -r "@" -T "change_id.short()")
              bookmarks=$(jj log --no-graph -r "bookmarks() & @" -T "bookmarks.join(' ')")
              if [ -n "${bookmarks}" ]; then
                  vcs_info="${working_copy}|${bookmarks}"
              else
                  vcs_info="${working_copy}"
              fi
            else
              # Check if we're in a Git repo.
              git_info=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
              if [ -n "${git_info}" ]; then
                vcs_info="${git_info}"
              fi
            fi

            if [ -n "${vcs_info}" ]; then
                printf 'set window modeline_vcs_info %%{%s}' "[${vcs_info}]"
            fi
        }
    }
}

hook global WinCreate .* %{
    evaluate-commands %sh{
        is_vcs_tree=$(cd "$(dirname "${kak_buffile}")" && git rev-parse --is-inside-work-tree 2>/dev/null) || $(cd "$(dirname "${kak_buffile}")" && jj root --quiet @>/dev/null)
        if [ "${is_vcs_tree}" = 'true' ]; then
            printf 'set-option window modelinefmt %%{%s}' "%opt{modeline_vcs_info} ${kak_opt_modelinefmt}"
        fi
    }
}
