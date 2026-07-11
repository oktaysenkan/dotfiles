# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source $HOME/antigen.zsh

antigen init $HOME/.antigenrc

eval "$(starship init zsh)"

alias gcfl='git commit --fixup=HEAD'
alias grem='git rebase origin/master -i --autosquash'

alias t="open -a iTerm ."
alias c='claude --dangerously-skip-permissions'
alias z="zed ."

# git push + MotoGP "viiiuğ" sesi (başarılıysa)
unalias gp 2>/dev/null
gp() {
  git push "$@" || return
  open -g "hammerspoon://moto"   # ses + animasyon Hammerspoon'dan
}
