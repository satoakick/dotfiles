PS1="\[\033[0;37m\]\w $ "

alias cl=clear
alias vi="vim"
alias st='git status'
alias co='git checkout'
alias ci='git commit'
alias br='git branch'

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
