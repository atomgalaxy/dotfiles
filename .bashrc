#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [[ "x$BASH" == "x" ]] ; then
    return
fi

source /etc/profile

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]] ; then
	eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
	eval $(dircolors -b /etc/DIR_COLORS)
fi

# enable bash completion
if [[ -f /opt/local/etc/profile.d/bash_completion.sh ]]
then
    . /opt/local/etc/profile.d/bash_completion.sh
elif [[ -f /etc/bash_completion ]]
then
    . /etc/bash_completion
fi


# Change the window title of X terminals 
case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome)
        if [[ "x$(uname)" == "xDarwin" ]]
        then
            PROMPT_COMMAND="${PROMPT_COMMAND}"'echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007";'
        else
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007";'
        fi
        ;;
    screen)
        if [[ "x$(uname)" == "xDarwin" ]]
        then
            PROMPT_COMMAND="${PROMPT_COMMAND}"'echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\;";'
        else
            PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\;";'
        fi
        ;;
esac
export PROMPT_COMMAND

# colors
if [[ -f ~/.bash_colors ]]
then
    . ~/.bash_colors
fi

export PS1="${IGreen}\u${IBlue}@${IGreen}\h ${IBlue}\w ${IGreen}\$ ${Color_Off}"

# git repo/branch in PS1
if [ "\$(type -t __git_ps1)" ]; then
    GIT_COMP="\[\033[01;33m\]\$(__git_ps1)\[\033[01;34m\] "
    PS1=${PS1/ \\\$/$GIT_COMP\\\$}
    unset GIT_COMP
fi

# history hacks
export HISTFILESIZE=10000
shopt -s histappend

if [[ "$(uname)" == "Darwin" ]]
then
    export EDITOR="/usr/bin/env mvim"
else
    export EDITOR="/usr/bin/env vim"
fi
export CC=clang
export CXX=clang++

# include aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.shell_paths ]; then
    . ~/.shell_paths
fi
