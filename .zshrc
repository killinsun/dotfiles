# ---------------------
# Aliases
# ---------------------
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -lag'
alias eq-docker='docker-compose up mysql redis redis_slave mongodb elasticsearch'
alias tmux-4pane='source ~/bin/tmux-alias.sh'



# ---------------------
# PATH Settings
# ---------------------
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/Users/ryota/.local/bin:$PATH"
export PATH="$PATH:$HOME/.rd/bin"

# ---------------------
# Peco settings
# ---------------------
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER") 
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src


# ---------------------
# Each Language settings
# ---------------------
# Node.js - NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Ruby
eval "$(rbenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ---------------------
# Other tools
# ---------------------

# Tmux
#
#if [[ ! -n $TMUX ]]; then
#  tmux new-session
#fi
if [[ "$TERM_PROGRAM" = "iTerm.app" ]]; then
    if [[ -z "$TMUX" ]]; then
        tmux attach || tmux new-session
    fi
fi



export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=$PATH:/Users/ryota/Library/Application\ Support/JetBrains/Toolbox/scripts

. "$HOME/.cargo/env"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
