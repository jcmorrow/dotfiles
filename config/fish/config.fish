set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH
set -gx PATH /opt/homebrew/Cellar/babashka/1.3.184/bin/ $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.deno/bin/ $PATH
set -gx PATH /usr/local/bin $PATH

set -gx AWS_DEFAULT_PROFILE ReplayProdDev

set -gx EARTHLY_SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

set -g fish_greeting
set -gx __fish_git_prompt_char_cleanstate ''
set -gx  RECORD_REPLAY_ENABLE_ASSERTS 1

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

# Always use modern regexes with sed
alias sed 'sed -E'

if command -v rbenv > /dev/null
  status --is-interactive; and source (rbenv init -|psub)
end

if command -v direnv > /dev/null
  eval (direnv hook fish)
end

if command -v pyenv > /dev/null
  set -x PYENV_ROOT_HOME $HOME/.pyenv
  set -gx PATH $PYENV_ROOT_HOME/bin $PATH
  pyenv init - | source
end

set --universal nvm_default_version v18.16.1

# E.g. kill_server 3000 will kill anything listening on 3000 other than firefox
# or chrome
function kill_server
  kill -9 (lsof -i tcp:$argv[1] -t -c^Google -c^firefox)
end

# opam configuration
source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# atuin
atuin init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/josh/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# rust
source "$HOME/.cargo/env.fish"
