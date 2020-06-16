
# Alias settings

# ls(in color)
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'


# Prompt setting
PS1='\[\e[34m\]\w \[\e[37m\]\$\[\e[0m\] '

export EDITOR=vim

set -o vi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
