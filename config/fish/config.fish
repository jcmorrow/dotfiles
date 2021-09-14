set -gx PATH /Applications/j901/bin $PATH
set -gx PATH /Users/josh/.cargo/bin $PATH
set -gx PATH /Users/josh/.local/share/solana/install/active_release/bin $PATH
set -gx PATH /Users/josh/Library/Android/sdk/platform-tools $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /usr/local/n/ $PATH

set -x EDITOR vim
set -x LESS '-iMSx4 -RSFX -e'

set -x J_BIN_FOLDER /Applications/j901/bin
set -x J_INSTALLATION_FOLDER /Applications/j901/

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

pyenv init - | source

# E.g. kill_server 3000 will kill anything listening on 3000 other than firefox
# or chrome
function kill_server
  kill -9 (lsof -i tcp:$argv[1] -t -c^Google -c^firefox)
end

# opam configuration
source /Users/josh/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
