#
# my custom aliases.
#

# General
alias ll='ls -lha'

# history                                                                                                                                                                                                
setopt share_history
setopt hist_reduce_blanks
setopt extended_history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Editor
alias vi="nvim"                                                                                                                                                                                          
alias vim="nvim"

# Peco
function peco-history-selection() {
  if (( $+commands[tac] )); then
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  else
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  fi
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
