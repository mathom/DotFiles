#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colorful PS1
PS1="\[\e[0;31m\]\u\[\e[0;37m\]@\[\e[0;31m\]\h \[\e[0;37m\][\t] \[\e[0;36m\]\w: \[\e[0m\]$ "

# Global Variable Configuration
export EDITOR="vim"
export LESS="-R"
export GREP_OPTIONS="--color=always -n --exclude-dir=.svn"
export LS_COLORS="di=34:ex=32:or=31:mi=31:ln=36:*.tar.gz=35:*.tar.bz2=35:*.diff=33"

# Operation System Specific Setup
if [ $OSTYPE == 'linux-gnu' ]; then
    # Linux Specific Paths
    export PATH="/usr/local/bin/:${PATH}"
    # Enable Bash Completion
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
elif [ $OSTYPE == 'darwin10.0' ]; then
    # Mac OS X Paths
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    # Use MacVim
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    # Enable Bash Completion
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

# Aliases
alias ls='ls --color=auto'
# Aliases for updating and logging into SSH sites
alias gocalvary='ssh calvaryag@mycalvaryassembly.org'
alias update-calvary='ssh calvaryag@mycalvaryassembly.org -k "cd calvaryag; ~/bin/hg pull -u; ~/webapps/django/myproject/manage.py syncdb; ~/webapps/django/apache2/bin/restart"'
alias goleona='ssh leonamay@leonamayphotography.com'
alias update-leona='ssh leonamay@leonamayphotography.com -k "cd leonamay; ~/bin/hg pull -u; ~/webapps/django/myproject/manage.py syncdb; ~/webapps/django/apache2/bin/restart"'

# Increase history to 10,000 entries... erase duplicates, and append on shell exit instead of overwrite.
export HISTSIZE=10000
export HISTCONTROL=erasedups
shopt -s histappend
