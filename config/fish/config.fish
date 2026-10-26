
fish_add_path ~/.bin
fish_add_path ~/.deno/bin
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/nvim/site
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/bin
fish_add_path (go env GOROOT)/bin
fish_add_path (go env GOPATH)/bin
fish_add_path --path -a /usr/sbin /sbin

fish_vi_key_bindings

set -g fish_greeting
set -gx __fish_git_prompt_char_cleanstate ''

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

set -x EDITOR nvim
set -x LESS '-iMSx4 -RSFX -e'

# Map Ctrl-R to reverse search
bind -M insert \cr history-pager

alias g git

alias code 'cd ~/code'
alias dotfiles 'cd ~/dotfiles'

if command -v direnv > /dev/null
  eval (direnv hook fish)
end

function kill_server
  set -l pids (lsof -t -nP -iTCP:$argv[1] -sTCP:LISTEN)
  if test -n "$pids"
    kill $pids
  else
    echo "Nothing listening on $argv[1]"
  end
end

# opam configuration
source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# atuin
# atuin init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# rust
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

source ~/.config/fish/functions/fish_prompt.fish

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# uv
fish_add_path "$HOME/.local/bin"

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path "$PNPM_HOME/bin"
# pnpm end

# opencode
fish_add_path /Users/jcmorrow/.opencode/bin

# Provided by the Jomik/fish-gruvbox Fisher plugin
if functions -q theme_gruvbox
    theme_gruvbox dark hard
end
