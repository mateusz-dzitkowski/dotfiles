export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias zshconfig="vim ~/.zshrc"
alias kittyconfig="vim ~/.config/kitty/kitty.conf"
alias fd=fdfind

