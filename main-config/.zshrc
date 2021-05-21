export ZSH="/home/luizlazaro/.oh-my-zsh"
ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(git bgnotify colored-man-pages zsh-completions zsh-autosuggestions zsh-syntax-highlighting yarn npm adb)

autoload -U compinit && compinit # zsh-completions
source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
# For a full list of active aliases, run `alias`.
alias vim="nvim" 
alias tlmgr='TEXMFDIST/scripts/texlive/tlmgr.pl --usermode'

# Change default shell to bash or zsh
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"

# export MANPATH="/usr/local/man:$MANPATH"

# FCITX5
export GTK_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx5

# Misc Envivonment Variables
export EDITOR=nvim
export TERM=termite
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin

# Language environment
export LANG=en_US.UTF-8

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

