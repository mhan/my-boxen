# Set the base PS1
PS1="\u:\h \W$ "

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

# Source the git bash completion file
source ~/.git-completion.bash
source ~/.git-prompt.sh

function prompt
{
	local WHITE="\[\033[1;37m\]"
	local GREEN="\[\033[0;32m\]"
	local CYAN="\[\033[0;36m\]"
	local GRAY="\[\033[0;37m\]"
	local BLUE="\[\033[0;34m\]"
	local RESET="\[\e[0;m\]"
	PS1="\n[\u@\h ${CYAN}\w${GREEN}"' $(__git_ps1 "(%s)")'"${RESET}]\n$ "
}
prompt

export PS1

alias gitk gitk 2>/dev/null

PATH=~/bin:$PATH

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
