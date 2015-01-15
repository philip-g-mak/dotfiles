#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i*  ]] && return

export TERM="xterm-256color"

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

echo -e "${green}Welcome, Sakib. What will you do today?${nc}"
echo -e ""
echo -ne "${cyan}Today is "; date
echo -e "${red}"; cal ;
echo "";

#function sblm {
   # nohup sublime $1 >/dev/null 2>&1 &
#}

alias upd='sudo yum update'
alias pls='ls --color=auto'
alias ls='ls --color=auto'
alias bashmod='vim ~/.bashrc'
alias vmod='vim ~/.vimrc'
alias gitup='git add . && git commit -m "update" && git push'
alias githeroku='git add . && git commit -m "update heroku" && git push origin master && git push heroku master' 
alias gg='exit'
alias k='clear'

if [ $GDMSESSION == "awesome" ]; then
  sudo nitrogen --set-scaled ~/Pictures/sunrise.jpg
fi

export PS1="\W\`parse_git_branch\`\\$ "
export SVN_EDITOR=vim
export EDITOR=vim

source ~/.bash_git
source $HOME/.bash_prompt

export PATH="/usr/local/heroku/bin:$PATH"
