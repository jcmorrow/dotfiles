# PATH setup

# Add a directory to PATH if it exists and isn't already on it
# (bash's answer to fish_add_path).
_add_path() {
  [ -d "$1" ] || return
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}

_add_path "$HOME/.bin"
_add_path "/opt/homebrew/bin"
_add_path "/opt/homebrew/sbin"
_add_path "$HOME/.local/bin"
_add_path "$HOME/.deno/bin"
_add_path "/usr/local/bin"
if command -v go &>/dev/null; then
  _add_path "$(go env GOROOT)/bin"
  _add_path "$(go env GOPATH)/bin"
fi
export PATH

# Environment variables
export EDITOR=nvim
export LESS='-iMSx4 -RSFX -e'

# Aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias g="git"
alias code="cd ~/code"
alias dotfiles="cd ~/dotfiles"

# Functions
kill_server() {
  local pids
  if command -v lsof &> /dev/null; then
    pids=$(lsof -t -nP -iTCP:"$1" -sTCP:LISTEN)
  else
    pids=$(ss -Htlnp "sport = :$1" | grep -oP 'pid=\K\d+' | sort -u)
  fi
  if [ -n "$pids" ]; then
    kill $pids
  else
    echo "Nothing listening on $1"
  fi
}

# Optional: Source external configs if they exist
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.opam/opam-init/init.sh" ] && source "$HOME/.opam/opam-init/init.sh" 2>/dev/null || true

# direnv hook (if installed)
if command -v direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
_add_path "$BUN_INSTALL/bin"
export PATH

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
_add_path "$PNPM_HOME/bin"
export PATH

# Prompt (mirrors fish_prompt.fish)
__bash_prompt() {
    local last_status=$?

    # Colors — wrapped in \001..\002 so readline counts them as zero-width
    local reset=$'\001\e[0m\002'
    local red=$'\001\e[31m\002'
    local green=$'\001\e[32m\002'
    local yellow=$'\001\e[33m\002'
    local blue=$'\001\e[34m\002'
    local cyan=$'\001\e[36m\002'
    local gray=$'\001\e[90m\002'
    local brgreen=$'\001\e[92m\002'
    local brblue=$'\001\e[94m\002'
    local magenta=$'\001\e[35m\002'
    local teal=$'\001\e[38;2;142;173;175m\002'

    # Exit code
    local exit_code=""
    if [[ $last_status -ne 0 ]]; then
        exit_code="<${red}${last_status}${reset}> "
    fi

    # Background job count
    local jobs_num=""
    local njobs
    njobs=$(jobs -p 2>/dev/null | wc -l | tr -d ' ')
    if [[ $njobs -gt 0 ]]; then
        jobs_num="[${gray}${njobs}${reset}] "
    fi

    # CWD (replace $HOME with ~)
    local cwd="${PWD/#$HOME/\~}"
    local cwd_str="${cyan}${cwd}${reset}"

    # User prefix: SSH session or Docker machine
    local user_prefix=""
    if [[ -n "$SSH_CLIENT" ]]; then
        user_prefix="${USER} "
    fi
    if [[ -n "$DOCKER_MACHINE_NAME" ]]; then
        user_prefix="${blue}${DOCKER_MACHINE_NAME}${reset} "
    fi

    # Override user prefix from ~/.prompt_prefix if it exists
    if [[ -f "$HOME/.prompt_prefix" ]]; then
        user_prefix="$(tr -d '\n' < "$HOME/.prompt_prefix") "
    fi

    # Prompt suffix
    local suffix=">"
    if [[ "$USER" == "root" || "$USER" == "toor" ]]; then
        suffix="#"
    fi

    # Git branch with status color
    local git_branch=""
    if git status &>/dev/null; then
        local branch_color="$green"
        local git_status
        git_status=$(git status 2>/dev/null)

        if echo "$git_status" | grep -q 'Changes not staged for commit:\|Untracked files:'; then
            branch_color="$red"
        elif echo "$git_status" | grep -q 'Changes to be committed:'; then
            branch_color="$yellow"
        fi

        local cur_branch
        cur_branch=$(git branch 2>/dev/null | grep '^\* ' | sed 's/^\* //')

        if [[ "$cur_branch" == "(HEAD detached"* ]]; then
            cur_branch="detached"
        fi

        if [[ -n "$cur_branch" ]]; then
            if [[ ${#cur_branch} -gt 21 ]]; then
                cur_branch="${cur_branch:0:18}..."
            fi
            if echo "$git_status" | grep -q 'Your branch is ahead of'; then
                cur_branch="${cur_branch}↥"
            elif echo "$git_status" | grep -q 'Your branch is behind'; then
                cur_branch="${cur_branch}↧"
            fi
            git_branch=" on ${branch_color}${cur_branch}${reset}"
        fi
    fi

    # Tool versions (shown when relevant project files are present)
    local tool_versions=""

    if { [[ -e ./go.mod ]] || [[ -e ./Gopkg.toml ]]; } && command -v go &>/dev/null; then
        local ver
        ver=$(go version 2>/dev/null | grep -oE 'go[0-9]+\.[0-9]+\.?[0-9]*')
        [[ -n "$ver" ]] && tool_versions+=" with ${teal}${ver}${reset}"
    fi

    if [[ -e ./mix.exs ]] && command -v elixir &>/dev/null; then
        local ver
        ver=$(elixir -v 2>/dev/null | grep -oE 'Elixir [0-9]+\.[0-9]+\.?[0-9]*' | sed 's/Elixir //')
        [[ -n "$ver" ]] && tool_versions+=" with ${magenta}ex${ver}${reset}"
    fi

    if [[ -e ./package.json ]] && command -v node &>/dev/null; then
        local ver
        ver=$(node -v 2>/dev/null | sed 's/^v//')
        if [[ -n "$ver" ]]; then
            tool_versions+=" with ${brgreen}node${ver}${reset}"
            if [[ -e ./tsconfig.json ]] && command -v tsc &>/dev/null; then
                local ts_ver
                ts_ver=$(tsc -v 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.?[0-9]*')
                [[ -n "$ts_ver" ]] && tool_versions+=" and ${cyan}ts${ts_ver}${reset}"
            fi
        fi
    fi

    if [[ -e ./pubspec.yaml ]] && command -v dart &>/dev/null; then
        local ver
        ver=$(dart --version 2>&1 | grep -oE '[0-9]+\.[0-9]+\.?[0-9]*' | head -1)
        [[ -n "$ver" ]] && tool_versions+=" with ${brblue}dart${ver}${reset}"
    fi

    if [[ -e ./Dockerfile ]] && command -v docker &>/dev/null; then
        local ver
        ver=$(docker --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.?[0-9]*' | head -1)
        [[ -n "$ver" ]] && tool_versions+=" on ${blue}docker${ver}${reset}"
    fi

    if [[ -n "$VIRTUAL_ENV" ]]; then
        local venv_name
        venv_name=$(basename "$VIRTUAL_ENV")
        tool_versions+=" via ${yellow}(${venv_name})${reset}"
    fi

    # Assemble prompt (two lines when there's git/tool info, one line otherwise)
    local top="${cwd_str}${git_branch}${tool_versions}"
    local bottom="${user_prefix}${jobs_num}${exit_code}${suffix} "

    if [[ -z "$git_branch" && -z "$tool_versions" ]]; then
        PS1="${top} ${bottom}"
    else
        PS1="${top}\n${bottom}"
    fi
}

PROMPT_COMMAND='__bash_prompt'
