function jj_prompt
  # make sure jj is installed
  if ! command -sq jj
    return 1
  end
  # check if we're in a jj repo
  if ! jj root --quiet &>/dev/null
    return 1
  end

  if test -n "$__fish_jj_prompt_bookmark_revset"
    set prompt_bookmark_revset "$__fish_jj_prompt_bookmark_revset"
  else
    set prompt_bookmark_revset "@ | @-"
  end

  set working_copy (jj log --no-graph \
    -r "@" -T "change_id.short()")
  set bookmark (jj log --no-graph \
    -r "latest(($prompt_bookmark_revset) & bookmarks())" \
    -T "bookmarks.join(' ')")
  if test -n "$bookmark"
    echo " ($working_copy|$bookmark)"
  else
    echo " ($working_copy)"
  end
end
