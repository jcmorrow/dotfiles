# include this repo's bin
export PATH="$HOME/dotfiles/bin:${PATH}"

# include this repo's functions
for function in ~/.zsh/functions/*; do
  source $function
done

eval "$(rbenv init -)"
eval "$(pyenv init -)"

export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias ctags="`brew --prefix`/Cellar/ctags/5.8_1/bin/ctags"
alias gpg=gpg2
alias lsd="ls | lolcat"
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias g=git

# make zsh line editing act like vim
bindkey -v

#direnv
eval "$(direnv hook zsh)"

export FZF_DEFAULT_COMMAND='ag -g ""'

# Wonderful reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH="/usr/local/opt/openssl/bin:$PATH"

# Prompt {{{

# Prompt colors {{{
#-------------------

typeset -AHg fg
typeset -Hg reset_color
fg=(
  green 158
  magenta 218
  purple 146
  red 197
  cyan 159
  blue 031
  yellow 222
)

# Add escape codes to the hex codes above
for k in ${(k)fg}; do
  # "\e[38;5;" means "set the following color as the foreground color"
  fg[$k]="\e[38;5;${fg[$k]}m"
done
# This is always defined as the "default foreground color", which might be white
# on a dark background or black on a white background.
reset_color="\e[39m"

prompt_color()  { print "%{$fg[$2]%}$1%{$reset_color%}" }
prompt_green()  { prompt_color "$1" green }
prompt_magenta(){ prompt_color "$1" magenta }
prompt_purple() { prompt_color "$1" purple }
prompt_red()    { prompt_color "$1" red }
prompt_cyan()   { prompt_color "$1" cyan }
prompt_blue()   { prompt_color "$1" blue }
prompt_yellow() { prompt_color "$1" yellow }
prompt_spaced() { [[ -n "$1" ]] && print " $@" }
# }}}

# Helper functions: path and Ruby version {{{
#--------------------------------------------
# %2~ means "show the last two components of the path, and show the home
# directory as ~".
#
# Examples:
#
# ~/foo/bar is shown as "foo/bar"
# ~/foo is shown as ~/foo (not /Users/gabe/foo)
prompt_shortened_path(){ prompt_purple "%2~" }
# }}}

# Git-related prompt stuff {{{
#-----------------------------

# vcs_info docs: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats $(prompt_blue "%b")
zstyle ':vcs_info:git*' actionformats $(prompt_red "%b|%a")

prompt_git_status_symbol(){
  local symbol
  local clean=$(prompt_green ✔)
  local dirty=$(prompt_red ✘)
  local untracked=$(prompt_cyan '?')
  local staged=$(prompt_yellow ⭑)
  local conflicts=$(prompt_red '!')

  case $(prompt_git_status) in
    changed) symbol=$dirty;;
    staged) symbol=$staged;;
    untracked) symbol=$untracked;;
    unchanged) symbol=$clean;;
    conflicts) symbol=$conflicts;;
    *) symbol=ugh;;
  esac

  print "$symbol"
}

# Is this branch ahead/behind its remote tracking branch?
prompt_git_relative_branch_status_symbol(){
  local symbol;
  local downwards_arrow=$(prompt_cyan ↓)
  local upwards_arrow=$(prompt_cyan ↑)
  local sideways_arrow=$(prompt_red ⇔)
  local good=$(prompt_green ✔)
  local question_mark=$(prompt_yellow \?)

  case $(prompt_git_relative_branch_status) in
    not_tracking) symbol=$question_mark;;
    up_to_date) symbol=$good;;
    ahead_behind) symbol=$sideways_arrow;;
    behind) symbol=$downwards_arrow;;
    ahead) symbol=$upwards_arrow;;
    upstream_gone) symbol="[upstream gone]";;
    *) symbol=ugh
  esac

  prompt_spaced "$symbol"
}

prompt_git_status() {
  local git_status=$(cat "/tmp/git-status-$$")
  case "$git_status" in
  *"Changes not staged"*) print "changed";;
  *"Changes to be committed"*) print "staged";;
  *"Untracked files"*) print "untracked";;
  *"working tree clean"*) print "unchanged";;
  *"Unmerged paths"*) print "conflicts";;
  esac
}

prompt_git_relative_branch_status(){
  local git_status=$(cat "/tmp/git-status-$$")
  local branch_name=$(git rev-parse --abbrev-ref HEAD)

  if ! git config --get "branch.${branch_name}.merge" > /dev/null; then
    print "not_tracking"
  else
    case "$git_status" in
      *up?to?date*) print "up_to_date";;
      *"have diverged"*) print "ahead_behind";;
      *"Your branch is behind"*) print "behind";;
      *"Your branch is ahead"*) print "ahead";;
      *"upstream is gone") print "upstream_gone";;
    esac
  fi
}

prompt_git_branch() {
  # vcs_info_msg_0_ is set by the `zstyle vcs_info` directives
  # It is the colored branch name.
  print "$vcs_info_msg_0_"
}

# This shows everything about the current git branch:
# * branch name
# * check mark/x mark/letter etc depending on whether branch is dirty, clean,
#   has staged changes, etc
# * Up arrow if local branch is ahead of remote branch, or down arrow if local
#   branch is behind remote branch
prompt_full_git_status(){
  if [[ -n "$vcs_info_msg_0_" ]]; then
    prompt_spaced "$(prompt_git_branch) $(prompt_git_status_symbol)$(prompt_git_relative_branch_status_symbol)"
  fi
}

# `precmd` is a magic function that's run right before the prompt is evaluated
# on each line.
# Here, it's used to capture the git status to show in the prompt.
function precmd {
  vcs_info
  if [[ -n "$vcs_info_msg_0_" ]]; then
    git status 2> /dev/null >! "/tmp/git-status-$$"
  fi
}

# prompt_subst allows `$(function)` inside the PROMPT
# Escape the `$()` like `\$()` so it's not immediately evaluated when this file
# is sourced but is evaluated every time we need the prompt.
setopt prompt_subst

PROMPT='$(prompt_shortened_path)$(prompt_full_git_status) $ '
# }}}
