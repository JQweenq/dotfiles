source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#----HISTORY-STUFF----#
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS


#----COMP-STUFF----#
autoload -Uz compinit
compinit

setopt completealiases

zstyle ':completion:*' menu select

#- buggy
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#-/buggy

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always


#----PROMPT----#
autoload -U colors promptinit
colors
promptinit


setprompt() {
  setopt prompt_subst

  PS1=${(j::b)${(Z:Cn:):-$'
    %K{green}
      %B
        %F{blue}%n%f
      %b
    %k
    %F{green} %f
  '}}

  PS2=$'%_>'
  dir="%F{blue}%~%f"
 
  RPROMPT=${(j::b)${(Z:Cn:):-$'
    %F{green}%f
    %K{green}
      %B
        ${dir}
      %b
    %k

  '}}
}
setprompt


#----HOTKEYS----#

# delete
bindkey "~" delete-char
# ctrl + delete
bindkey ";5~" delete-word
# home
bindkey "^[[H" beginning-of-line
# end
bindkey "^[[F" end-of-line
# ctrl + left
bindkey ";5D" backward-word
# ctrl + right
bindkey ";5C" forward-word
# ctrl + delete
bindkey "^H" backward-kill-word
# ctrl + backspace
bindkey ";5~" kill-word


#----COLORIZED----#
if [ -f /usr/bin/grc ]; then
  alias gcc="grc --colour=auto gcc"
  alias irclog="grc --colour=auto irclog"
  alias log="grc --colour=auto log"
  alias netstat="grc --colour=auto netstat"
  alias ping="grc --colour=auto ping"
  alias proftpd="grc --colour=auto proftpd"
  alias traceroute="grc --colour=auto traceroute"
fi

#----ALIASES----#
alias i3-instant-layout='~/.local/lib/python3.10/site-packages/i3_instant_layout/main.py'
alias time='tty-clock -sctD -C 2'
alias ls='ls --color=auto'
alias pac='sudo pacman -Syu'
alias pc='sudo pacman -S'
alias lg='lazygit'
alias vim='nvim'
alias conf-i3='nvim ~/.config/i3/config'
alias conf-picom='nvim ~/.config/picom/picom.conf' 
alias conf-polybar='nvim ~/.config/polybar/polybar.conf'
alias conf-nvim='nvim ~/.config/nvim/init.vim'
alias conf-kitty='nvim ~/.config/kitty/kitty.conf'
alias conf-zsh='nvim ~/.zshrc'

#----VARIABLES----#
export BROWSER="google-chrome-stable"
export EDITOR="nvim"

# for gopls
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
