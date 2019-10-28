set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /Users/josh/.cargo/bin $PATH
set -g -x PATH /usr/local/Cellar/rabbitmq/3.7.7_1/sbin/ $PATH
set -x EDITOR vim
set -x LESS '-iMSx4 -RSFX -e'

alias __fzfcmd fzf
alias fix_postgres 'rm /usr/local/var/postgres/postmaster.pid'
alias fix_vs_code_key_repeat 'defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false'
alias undo_fix_vs_code_key_repeat 'defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool true'
alias g git
alias python3.6 python
alias sed 'sed -E'

status --is-interactive; and source (rbenv init -|psub)
eval (direnv hook fish)
fish_vi_key_bindings

function kill_server
  kill -9 (lsof -i tcp:$argv[1] -t -c^Google -c^firefox)
end

function postgres_log
  tail -f /usr/local/var/log/postgres.log
end

function copy
  kitty +kitten clipboard
end

# set -x NVM_DIR /home/josh/.nvm
# $NVM_DIR/nvm.sh && $NVM_DIR/nvm.sh

# export PATH="/home/josh/.pyenv/bin:$PATH"
# eval "(pyenv init)"
# eval "(pyenv virtualenv-init)"
