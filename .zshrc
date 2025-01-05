# ---------------------
# Aliases
# ---------------------
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -lag'
alias eq-docker='docker-compose up mysql redis redis_slave mongodb elasticsearch'
alias tmux-4pane='source ~/bin/tmux-alias.sh'
alias ngrok8000='ngrok http --domain oddly-tender-rooster.ngrok-free.app 8000'
alias ngrok5173='ngrok http --domain oddly-tender-rooster.ngrok-free.app 5173'

# ---------------------
# PATH Settings
# ---------------------
export GOPATH=$HOME
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
# HomeBrew 
# ---------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---------------------
# Each Language settings
# ---------------------
# Node.js - NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Python - pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Python - Poetry
export PATH="/Users/ryota.takeuchi/.local/bin:$PATH"

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
				echo "Hey"
    fi
fi


export PATH=$PATH:/Users/ryota/Library/Application\ Support/JetBrains/Toolbox/scripts

. "$HOME/.cargo/env"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
