PS1="\[\033[0;37m\]\w $ "

alias py=python
alias cl=clear
alias vim="vim"
alias vi="vim"
alias st='git status'
alias co='git checkout'
alias ci='git commit'
alias br='git branch'

PATH=$PATH:$HOME/.rvm/bin:/opt/local/bin/ctags # Add RVM to PATH for scripting


##THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
#[[ -s "/Users/sawadasatoaki/.gvm/bin/gvm-init.sh" ]] && source "/Users/sawadasatoaki/.gvm/bin/gvm-init.sh"

# java
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.7"`
PATH=${JAVA_HOME}/bin:${PATH}

# mongo 
export MONGO_HOME=/Users/sawadasatoaki/dev/mongo/mongodb-osx-x86_64-2.6.4/
PATH=${MONGO_HOME}/bin:${PATH}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
  PROMPT="\W \! \$(parse_git_branch) \$ "
}
function proml {
  PS1="\W \! \$(parse_git_branch) \$ "
}
proml
