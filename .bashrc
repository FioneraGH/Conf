#sudo alias to fix the alias not effect when using sudo command
alias sudo="sudo "
alias vim="sudo vim"

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

#mysql alias
alias mysqlr="mysql -u root -p"
alias openmysql="sudo systemctl start mysqld"
alias closemysql="sudo systemctl stop mysqld"

#performance alias
alias flushcache="echo 3 > /proc/sys/vm/drop_caches"
alias reswap="sudo swapoff -a;sudo swapon -a"
alias showscheduler="cat /sys/block/sda/queue/scheduler;cat /sys/block/sdb/queue/scheduler;"

#git alias
alias status="git status"
alias add="git add ."
alias commit="git commit"
alias rebase="git pull --rebase"
alias push="git push"
