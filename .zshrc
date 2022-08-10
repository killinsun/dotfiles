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
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source ~/.bash_tools

if [[ ! -n $TMUX ]]; then
  tmux new-session
fi
