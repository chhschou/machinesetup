

## anaconda home
export anaconda_home=/opt/anaconda/bin

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
export GOPATH="/usr/local/Cellar/go/1.7.4"
export APPENGINEPATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/platform/google_appengine"
## export android paths
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_TOOLS=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

## export python paths
export PYTHONPATH=$APPENGINEPATH:$APPENGINEPATH/lib:$PYTHONPATH
## export development paths
export dev_path=$ANDROID_TOOLS:$anaconda_home
export PATH="$dev_path:$PATH"
