set -gx PATH /Users/josh/.cargo/bin $PATH
set -gx PATH /usr/local/bin $PATH

set -gx AWS_DEFAULT_PROFILE ReplayProdDev

set -gx EARTHLY_SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

alias vim="nvim"
alias vi="nvim"

set -x EDITOR nvim
set -x LESS '-iMSx4 -RSFX -e'

set -gx PATH /Applications/j903/bin $PATH
set -x J_BIN_FOLDER /Applications/j903/bin
set -x J_INSTALLATION_FOLDER /Applications/j903/

fish_vi_key_bindings

bind -M insert \cr history-pager

alias g git

# Always use modern regexes with sed
alias sed 'sed -E'

if command -v rbenv > /dev/null
  status --is-interactive; and source (rbenv init -|psub)
end

if command -v direnv > /dev/null
  eval (direnv hook fish)
end

# E.g. kill_server 3000 will kill anything listening on 3000 other than firefox
# or chrome
function kill_server
  kill -9 (lsof -i tcp:$argv[1] -t -c^Google -c^firefox)
end

fish_config theme choose "Rosé Pine Dawn"

set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH
