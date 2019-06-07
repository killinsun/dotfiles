alias ls='gls --color=auto'
#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

# Java Open-JDK 11.01(Java 11)
#export JAVA_HOME=$(/usr/libexec/java_home -v 11.01)

# Java JDK 1.8(Java 8)
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0)

# Android SDK tools
#if [ -d "/usr/local/opt/android-sdk/tools/bin" ]; then
#	export PATH=$PATH:/usr/local/opt/android-sdk/tools/bin
#fi

# SDKMAN
if [ -f ~/.bashrc ] ; then
	. ~/.bashrc
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ryouta/.sdkman"
[[ -s "/Users/ryouta/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ryouta/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.pyenv/shims:$PATH"
