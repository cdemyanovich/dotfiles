export PATH=~/bin:~/.lein/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/share/npm/bin:$PATH
export CDPATH=.:~:~/work:~/work/leapfrog:~/play:~/learn:~/talks
export NODE_PATH=/usr/local/lib/node_modules
# export SVN_EDITOR='mate -w'
# See: https://github.com/b4winckler/macvim/wiki/FAQ
export EDITOR='mvim --nofork --nomru -c "au VimLeave * !open -a iTerm"' # or Terminal
export RI='--no-pager --format=ansi'
export HISTCONTROL=erasedups

# lpp_broadband project settings for running tests
export CAPYBARA_HOST=192.168.50.95
export JASMINE_HOST=http://192.168.50.95
export SELENIUM_SERVER=http://gw-qafunc:4444/wd/hub
export JASMINE_BROWSER=firefox

# for building Ruby via RVM, since LLVM is now the default compiler on Lion
# export CC=gcc-4.2

export ARCHFLAGS='-arch x86_64'

COLOR_BLUE_BG='\[\e[48;5;63m\]'
COLOR_RESET='\[\e[0m\]'
export PS1='\n'${COLOR_BLUE_BG}'\h:\W \u'${COLOR_RESET}'\n\$ '

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
