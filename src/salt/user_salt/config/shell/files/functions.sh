function sa() {
  local key="`\ls ${HOME}/.ssh/*.priv | fzf`"
  [[ -n "$key" ]] && ssh-add "${key}"
}

# find-in-file - usage: fif <SEARCH_TERM>
function fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  rg --files-with-matches --no-messages "$1" \
     | fzf $FZF_PREVIEW_WINDOW \
       --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}
