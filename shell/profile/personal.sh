# qubes
export QT_QPA_PLATFORMTHEME="gnome"
export QUBES_GPG_DOMAIN="vault"
# misc
export FZF_DEFAULT_OPTS="--border --color=16"
# default apps
export PAGER="less -R"
export EDITOR="nvim"
# app paths
export CARGO_HOME="${HOME}/.cargo"
export CHROME_BIN="chromium-freeworld" # for `ng test`
export NPM_PACKAGES="${HOME}/.npm-packages"
export PYTHONPATH_USER="${HOME}/.local/bin"
export PYENV_ROOT="${HOME}/.pyenv"
export PGPASSFILE="${HOME}/.pgpass"
# my paths
export MY_SCRIPTS="/usr/scripts"
# PATH
NEW_PATH=""
[[ `command -v go` ]] && NEW_PATH+="$(go env GOPATH)/bin"
NEW_PATH+=":${NPM_PACKAGES}/pnpm-bin"
NEW_PATH+=":${HOME}/.npm-packages/bin"
NEW_PATH+=":${MY_SCRIPTS}"
NEW_PATH+=":${HOME}/.pyenv/bin"
NEW_PATH+=":${PYENV_ROOT}"
NEW_PATH+=":${CARGO_HOME}/bin"
NEW_PATH+=":${PYTHONPATH_USER}"
NEW_PATH+=":${HOME}/bin"
NEW_PATH+=":${HOME}/.emacs.d/bin"
NEW_PATH+=":${HOME}/.luarocks/bin"
NEW_PATH+=":${HOME}/WIP"
export PATH="${NEW_PATH}:${PATH}"

black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`

bold=`tput bold`
reset=`tput sgr0`

# kitty
alias kf="kitty +kitten kyperlinked_grep"
alias kd="kitty +kitten diff"
# kitty requires difftool, for git diffs. you must also set
#  kitty as the difftool in .gitconfig (see kitty docs)
alias d="git difftool --no-symlinks --dir-diff"
# git
alias gsf="git ls-tree --full-tree -r HEAD";  #  show all repo files
# common spelling mistakes
alias ha="ga"; # git plugin
# services
alias start="sudo systemctl start";
alias stop="sudo systemctl stop";
alias restart="sudo systemctl restart";
alias status="sudo systemctl status";
alias show="sudo systemctl | grep -i";
# pyenv
alias pc="pyenv virtualenv";
# alias pl="pyenv virtualenvs";
alias ph="pyenv help";
alias pv="pyenv versions";
alias pa="pyenv activate";
alias pd="pyenv deactivate";
# npm
alias p="pnpm";
alias pr="pnpm run";
alias pt="reset && pnpm run test --";
alias pl="reset && pnpm run check:lint --";
alias pad="pnpm add --save-dev";
alias pa="pnpm add";
alias y="\yarn";
alias yarn="echo 'no; use y or p'";
# gh
alias gil="gh issue list -L 1000";
alias gill="gh issue list -L 1000 -l";
alias gicr="gh issue create";
alias gico="gh issue comment --editor"
alias gicl="gh issue close"
alias gie="gh issue edit";
alias gn="gh notify";
alias grf="gh repo fork --clone --remote"
alias giv="gh issue view --comments"
# exa
export TIME_STYLE=long-iso
export EXA_STRICT=true
alias exa="exa --color=always --classify --icons --created"
alias ls="exa"
alias lsa="exa --long --git"
alias lst="exa --long --git --sort created"
# common
alias vim="nvim" # some kitty kittens target vim
alias ranger="ranger --confdir=/etc/ranger/config"

# FUNCTIONS
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

# pyenv - add a number of paths, also this modified PATH,
#  so needs to be at the end of this file
if [[ -n "`command -v pyenv`" ]]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
