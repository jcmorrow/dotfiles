set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /Users/josh/.cargo/bin $PATH
set -x LESS '-iMSx4 -RSFX -e'

alias g git

status --is-interactive; and source (rbenv init -|psub)
eval (direnv hook fish)
fish_vi_key_bindings

alias __fzfcmd fzf

function kill_server
  # This doesn't work for some reason and I'm not sure why.
  kill -9 (lsof -i tcp:$argv[0] -tc^Google)
end
