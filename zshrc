# include this repo's bin
export PATH="/jcmorrow-dotfiles/bin:${PATH}"

# include this repo's functions
for function in ~/.zsh/functions/*; do
  source $function
done

# oh my zsh stuff
export ZSH=~/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git rbenv)
source $ZSH/oh-my-zsh.sh

# Prefered editors for local and remote
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Shorten prompt
export DEFAULT_USER="josh"

alias lsd="ls | lolcat"
alias gpg=gpg2
eval $(thefuck --alias)

# make zsh line editing act like vim
bindkey -v

eval "$(direnv hook zsh)"

# rbenv
eval "$(rbenv init -)"

#direnv
eval "$(direnv hook zsh)"

export FZF_DEFAULT_COMMAND='ag -g ""'
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Wonderful reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward