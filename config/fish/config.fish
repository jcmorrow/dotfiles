set -gx PATH /Users/josh/.cargo/bin $PATH
set -gx PATH /opt/homebrew/Cellar/babashka/1.3.184/bin/ $PATH
set -gx PATH /usr/local/bin $PATH

set -gx AWS_DEFAULT_PROFILE ReplayProdDev

set -gx EARTHLY_SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

set -g fish_greeting
set -gx __fish_git_prompt_char_cleanstate ''

# Wow, you sure do like vim.
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

set -x EDITOR nvim
set -x LESS '-iMSx4 -RSFX -e'

set -gx PATH /Applications/j903/bin $PATH
set -x J_BIN_FOLDER /Applications/j903/bin
set -x J_INSTALLATION_FOLDER /Applications/j903/

fish_vi_key_bindings

bind -M insert \cr history-pager

alias g git

alias code 'cd ~/code'
alias dotfiles 'cd ~/dotfiles'
alias bac 'cd ~/code/replay/backend'
alias devtools 'cd ~/code/replay/devtools/'

# Always use modern regexes with sed
alias sed 'sed -E'

if command -v rbenv > /dev/null
  status --is-interactive; and source (rbenv init -|psub)
end

if command -v direnv > /dev/null
  eval (direnv hook fish)
end

set --universal nvm_default_version v18.16.1

# E.g. kill_server 3000 will kill anything listening on 3000 other than firefox
# or chrome
function kill_server
  kill -9 (lsof -i tcp:$argv[1] -t -c^Google -c^firefox)
end

set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH

# opam configuration
source /Users/joshuamorrow/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
