[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
#terminal colours
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

export ANDROID_HOME=/opt/boxen/homebrew/Cellar/android-sdk/r21.1/
export ANDROID_NDK_HOME=/opt/boxen/homebrew/Cellar/android-ndk/r8d/

export PATH=$PATH:~/bin

source ~/.git-completion.bash

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh