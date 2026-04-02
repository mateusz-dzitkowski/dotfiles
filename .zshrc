export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.scripts/z.sh"
[ -e "$HOME/.zshrc-bonus.zsh" ] && source "$HOME/.zshrc-bonus.zsh"

alias icat="kitty +kitten icat"

export PATH="$HOME/.local/bin:$PATH"

# HASKELL
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

# GO
export PATH="$HOME/go/bin:$PATH"


envsource() {
    set -a
    source "${1:-.env}"
    set +a
}

