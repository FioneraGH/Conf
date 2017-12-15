#sudo alias to fix the alias not effect when using sudo command
alias sudo="sudo "

#function alias
alias ll="ls -Alh --color=tty"
alias vi="vim"
alias cd..="cd .."
alias h="history"
alias grep="grep --color=auto"
alias cls="clear"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias dupdr="sudo dnf upgrade --exclude=kernel* --refresh"

#ssh alias
alias opensshd="sudo systemctl start sshd"

#mysql alias
alias mysqlr="mycli -u root -p root"
alias openmysql="sudo systemctl start mariadb"
alias closemysql="sudo systemctl stop mariadb"

#performance alias
alias flushcache="echo 3 > /proc/sys/vm/drop_caches"
alias reswap="sudo swapoff -a;sudo swapon -a"
alias showscheduler="cat /sys/block/sda/queue/scheduler;cat /sys/block/sdb/queue/scheduler;"

#git alias
alias rebase="git pull --rebase"

#docker alias
alias docker="sudo docker"

#sadb alias
alias adb="sadb"

#close ctrls hangout terminal
stty -ixon

#export
export VISUAL="vim"
export MUTTER_ALLOW_HYBRID_GPUS=0

export JAVA_HOME=/home/fionera/LinuxIDE/jdk
export CLASS_PATH=.:$JAVA_HOME/lib/tool.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/jre/lib/rt.jar

export PATH=$HOME/.local/bin:$HOME/LinuxIDE/dotnet2:$PATH

export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"

#eval $(thefuck --alias)
