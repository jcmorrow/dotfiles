# PATH setup
export PATH="$HOME/.bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/Cellar/babashka/1.3.184/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/Applications/j903/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="/Users/josh/Library/pnpm:$PATH"

# Environment variables
export EDITOR=nvim
export LESS='-iMSx4 -RSFX -e'
export EARTHLY_SSH_AUTH_SOCK="$SSH_AUTH_SOCK"
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
export RECORD_REPLAY_ENABLE_ASSERTS=1
export J_BIN_FOLDER="/Applications/j903/bin"
export J_INSTALLATION_FOLDER="/Applications/j903/"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="/Users/josh/Library/pnpm"

# Aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias g="git"
alias code="cd ~/code"
alias dotfiles="cd ~/dotfiles"
alias nbs="cd ~/code/whitecap/nbs-adapts"
alias sed="sed -E"

# Functions
kill_server() {
  kill -9 $(lsof -i tcp:$1 -t -c^Google -c^firefox)
}

# Optional: Source external configs if they exist
[ -f "$HOME/.config/secrets" ] && source "$HOME/.config/secrets"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.opam/opam-init/init.sh" ] && source "$HOME/.opam/opam-init/init.sh" 2>/dev/null || true

# direnv hook (if installed)
if command -v direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi

# atuin (if installed)
if command -v atuin &> /dev/null; then
  eval "$(atuin init bash)"
fi

eval "$(fzf --bash)"
