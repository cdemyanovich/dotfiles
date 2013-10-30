# shortcuts for commonly used commands...
alias cl=clear
alias la="ls -al"
alias ls="ls -GF"
alias ps="ps aux"
alias df="df -h"
alias du="du -sh"

alias m="mate"

alias be="bundle exec"

alias tags="ctags -R --exclude=.git --exclude=log --exclude=tmp --exclude=coverage *"

# rails <= 2.3.x
alias ss=script/server
alias sc=script/console
alias sdbcs=script/dbconsole
alias sg=script/generate
alias sd=script/destroy
alias cap1="cap _1.4.1_"

# git
alias gits='git status'

# IngersollRand XXL project w/ EdgeCase
alias ircommands='echo irconfig irbuild irswf irlog'
alias irconfig='mvim ~/work/irxxl/projects/flash/skywalker/xxl_gui/swf/xml/config.xml && mvim ~/work/irxxl/projects/mtasc/build'
alias irbuild='cd ~/work/irxxl/projects/mtasc ; ./build'
alias irswf='open -a firefox ~/work/irxxl/projects/flash/skywalker/xxl_gui/swf/xLink.swf'
alias irlog='mvim ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'
alias irtlog='> ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'
