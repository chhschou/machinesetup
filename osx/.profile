
## ironpython home
export ironpython_home=~/cchou/dev/dependencies/ironpython/2.7.3

## anaconda home
export anaconda_home=/opt/anaconda/bin

## export node paths
export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules:/usr/local/bin"

## export android dev tools
export android_platform_tools_home=~/cchou/dev/dependencies/android-sdk-macosx/platform-tools
## export development paths
export dev_path=$ironpython_home:$anaconda_home:$NODE_PATH:$android_platform_tools_home
export PATH="$dev_path:$PATH"


## home brew paths
export homebrew_home=/usr/local/bin
export PATH="$homebrew_home:$PATH"

alias vim='/Applications/MacVim.app/Contents/MacOS/vim'
