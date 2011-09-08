
# via https://github.com/sjl/dotfiles/blob/master/zsh/urls.zsh

function urlopen() {
  open "http://$*"
}

alias -s com=urlopen
alias -s org=urlopen
alias -s net=urlopen
alias -s io=urlopen
alias -s jp=urlopen

