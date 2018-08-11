set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /Users/josh/.cargo/bin $PATH

set -x LESS '-iMSx4 -RSFX -e'

fish_vi_key_bindings

alias g git
alias __fzfcmd fzf
# Always use modern regexes with sed
alias sed 'sed -E'

# Sometimes this file gets stuck on Mac
alias fix_postgres 'rm /usr/local/var/postgres/postmaster.pid'
alias postgres_log 'tail -f /usr/local/var/log/postgres.log'

status --is-interactive; and source (rbenv init -|psub)
eval (direnv hook fish)

# E.g. kill_server 3000 will kill anything listening on 3000 other than firefox
# or chrome
function kill_server
  kill -9 (lsof -i tcp:$argv[1] -t -c^Google -c^firefox)
end

# Python things
pyenv init - | source
source $HOME/.poetry/env
