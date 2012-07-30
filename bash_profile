export PATH=~/bin:~/.lein/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/python:$PATH
export CDPATH=.:~:~/work:~/work/netcredit:~/work/internetpawn:~/play:~/learn:~/talks
export NODE_PATH=/usr/local/lib/node_modules
# export SVN_EDITOR='mate -w'
# See: https://github.com/b4winckler/macvim/wiki/FAQ
export EDITOR='mvim --nofork --nomru -c "au VimLeave * !open -a iTerm"' # or Terminal
export RI='--no-pager --format=ansi'
export HISTCONTROL=erasedups

# for building Ruby via RVM, since LLVM is now the default compiler on Lion
export CC=gcc-4.2

export ARCHFLAGS='-arch x86_64'

# export GIT_PS1_SHOWDIRTYSTATE=1
# export PS1='\[\e[1;33m\]\u@\h \[\e[0;33m\]\w\[\e[0m\]\[\e[32m\]$(__git_ps1 "[%s]")\[\e[0m\]\$ '
#           cdemyanovich@slapshot ~/work/dls[specs_once]$
#           \h:\W \u\$
#           slapshot:dls cdemyanovich$

COLOR_BLUE_BG='\[\e[48;5;63m\]'
COLOR_RESET='\[\e[0m\]'
export PS1='\n'${COLOR_BLUE_BG}'\h:\W \u'${COLOR_RESET}'\n\$ '

export P4CONFIG=.p4config

# hitch() {
#   command hitch "$@"
#   if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
# }
# alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
# hitch

# NetCredit read-only DB access
# example: proddb portfolio
proddb () {
  db=$1_prod_nc
  host=proddb-$1.netcredit.com
  if [ "$1" = "account_home" ]; then
    db=accounthome_prod_nc
    host=proddb-my.netcredit.com
  fi
  psql -h $host -U netcredit__read_only $db
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
