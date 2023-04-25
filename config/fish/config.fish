set -gx PATH /Users/josh/.cargo/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /usr/local/bin $PATH

set -gx AWS_DEFAULT_PROFILE ReplayProdDev
set -gx PATH ~/google-cloud-sdk/bin $PATH

set -gx GOPATH $HOME/go
set -gx GOROOT $HOME/.go
set -gx PATH $GOPATH/bin $PATH

set -gx EARTHLY_SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

alias gvm="$GOPATH/bin/g"

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

if command -v direnv > /dev/null
  pyenv init - | source
end

if command -v nvm > /dev/null
  nvm use 18
end

# E.g. kill_server 3000 will kill anything listening on 3000 other than firefox
# or chrome
function kill_server
  kill -9 (lsof -i tcp:$argv[1] -t -c^Google -c^firefox)
end

