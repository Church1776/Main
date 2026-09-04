# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/brass/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

ZSCRIPTDIR="${(%):-%N}"
ZSCRIPTDIR="${ZSCRIPTDIR:h}"

echo $ZSCRIPTDIR

function add_zenhance {
    local zenhance="$ZSCRIPTDIR/config/zsh/zenhance/zenhance.zsh"

    if [[ -z "$Z_SHELL_ENHANCE_ADDED" && -f $zenhance ]]; then
        source "$zenhance"
    fi
}
add_zenhance
unset -f add_zenhance

function add_zsh_autosuggestions {
    
  local zauto="$ZSCRIPTDIR/config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
  if [[ -z "$Z_SHELL_AUTO_ADDED" && -f $zauto ]]; then
    source "$zauto"
  fi
}
add_zsh_autosuggestions
unset -f add_zsh_autosuggestions

function add_zsh_syntax_highlight {
    
  local zsyntax="$ZSCRIPTDIR/config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  if [[ -z "$Z_SHELL_HIGHLIGHT_ADDED" && -f $zsyntax ]]; then
    source "$zsyntax"
  fi
}
add_zsh_syntax_highlight
unset -f add_zsh_syntax_highlight