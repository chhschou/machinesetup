

## anaconda home
export anaconda_home=/opt/anaconda/bin

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
## export android paths
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_TOOLS=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

## export development paths
export dev_path=$ANDROID_TOOLS:$anaconda_home
export PATH="$dev_path:$PATH"

alias vim='/Applications/MacVim.app/Contents/MacOS/vim'
