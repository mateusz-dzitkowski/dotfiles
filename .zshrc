export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias fd=fdfind

# PATH
export PATH="$HOME/.ghcup/bin:$PATH"


[ -f "/home/mati-test/.ghcup/env" ] && . "/home/mati-test/.ghcup/env" # ghcup-env
