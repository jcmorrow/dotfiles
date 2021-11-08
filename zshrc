[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

for function in ~/.zsh/functions/*; do
  source $function
done

export PATH="/Applications/j901/bin:$PATH"
export PATH="/Users/josh/.cargo/bin:$PATH"
export PATH="/Users/josh/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/Users/josh/Library/Android/sdk/platform-tools:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/n:$PATH"
export PATH="~/google-cloud-sdk/bin:$PATH"

export GOPATH="$HOME/go"
export GOROOT="$HOME/.go"

export PATH="$GOPATH/bin:$PATH"

alias g=git
alias __fzfcmd=fzf

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(direnv hook zsh)"
eval "$(rbenv init - zsh)"

# Just trying this for Postgres M1 comatibility reasons
export PATH="${HOMEBREW_PREFIX}/opt/postgresql@14/bin:$PATH"
export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/postgresql@14/lib"
export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/postgresql@14/include"
export PKG_CONFIG_PATH="${HOMEBREW_PREFIX}/opt/postgresql@14/lib/pkgconfig"

export EDITOR="vim"
