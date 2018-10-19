# sudo alias to fix the alias not effect when using sudo command
alias sudo="sudo "
alias vim="/Applications/MacVim.app/Contents/bin/vim"

# function alias
alias ll="ls -Alh"
alias vi="vim"
alias cd..="cd .."
alias h="history"
alias grep="grep --color=auto"
alias cls="clear"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias dupdr="sudo dnf upgrade --exclude=kernel* --refresh"
alias lsp="lsof -n -P -i TCP -s TCP:LISTEN"

# ssh alias
alias opensshd="sudo systemctl start sshd"
alias closesshd="sudo systemctl stop sshd"

# mysql alias
alias mysqlr="mycli -u root -p root"
alias openmysql="sudo systemctl start mariadb"
alias closemysql="sudo systemctl stop mariadb"

# performance alias
alias flushcache="echo 3 > /proc/sys/vm/drop_caches"
alias reswap="sudo swapoff -a;sudo swapon -a"
alias showscheduler="cat /sys/block/sda/queue/scheduler;"

# docker alias
#alias docker="sudo docker"

# brew args
alias brup="brew upgrade --force-bottle"

# close ctrls hangout terminal
#stty -ixon

# unlimit open fd count
ulimit -S -n 1024

#export
#echo "BP: $PATH"

export VISUAL=vim
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
#export MUTTER_ALLOW_HYBRID_GPUS=0

export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/

export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

export JAVA_HOME=/Library/Java/Home
export ANDROID_JAVA_HOME=$JAVA_HOME
export CLASS_PATH=.:$JAVA_HOME/lib/tool.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/jre/lib/rt.jar

export REPO_URL=https://gerrit-googlesource.proxy.ustclug.org/git-repo
export SOURCE_FETCH_URL=git://mirrors.ustc.edu.cn/aosp
#export USE_CCACHE=1
export CCACHE_DIR=/Volumes/DATA/.ccache
#prebuilts/misc/darwin-x86/ccache/ccache -M 50G

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

export ANDROID_PLATFORM_TOOLS=/Users/fionera/Library/Android/sdk/platform-tools

export PYTHON_HOME=/Users/fionera/Library/Python/3.7

export FLUTTER_HOME=/Users/fionera/Git/flutter

export PATH=$ANDROID_PLATFORM_TOOLS:$PYTHON_HOME/bin:$FLUTTER_HOME/bin:$PATH
alias npm=/usr/local/bin/npm

echo "AP: $PATH"

# added by travis gem
[ -f /Users/fionera/.travis/travis.sh ] && source /Users/fionera/.travis/travis.sh

