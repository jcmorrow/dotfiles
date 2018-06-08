# include this repo's bin
export PATH="$HOME/dotfiles/bin:${PATH}"

# include this repo's functions
for function in ~/.zsh/functions/*; do
  source $function
done

# oh my zsh stuff
export ZSH=~/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git)
# faster rbenv
eval "$(rbenv init - --no-rehash)"
# faster pyenv
eval "$(pyenv init - --no-rehash)"
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Shorten prompt
export DEFAULT_USER="josh"

alias ctags="`brew --prefix`/Cellar/ctags/5.8_1/bin/ctags"
alias gpg=gpg2
alias lsd="ls | lolcat"
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"

# make zsh line editing act like vim
bindkey -v

#direnv
eval "$(direnv hook zsh)"

export FZF_DEFAULT_COMMAND='ag -g ""'

# Wonderful reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH="/usr/local/opt/openssl/bin:$PATH"
DISABLE_AUTO_UPDATE="true"
