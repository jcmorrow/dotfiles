# PATH setup
export PATH="$HOME/.bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/nvim/bin:$PATH"
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
alias modal="cd ~/code/modal"
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ec2-user/google-cloud-sdk/path.bash.inc' ]; then . '/home/ec2-user/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ec2-user/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ec2-user/google-cloud-sdk/completion.bash.inc'; fi
