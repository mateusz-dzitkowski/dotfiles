# HISTORY HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# OPTIONS OPTIONS OPTIONS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# COMPLETION COMPLETION
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# LOAD PLUGINS LOAD PLUGINS
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# PLUGINS OPTIONS PLUGINS OPTIONS
bindkey '^E' autosuggest-accept

# PROMPT PROMPT
PROMPT='%B%F{#a6e3a1}➜%f %F{#89b4fa}%c%f%b '

# LOAD BONUS ZSHRC
[ -e "$HOME/.zshrc-bonus.zsh" ] && source "$HOME/.zshrc-bonus.zsh"

# ALIASES ALIASES ALIASES
alias icat="kitten icat"
alias ssh="kitten ssh"
alias lg=lazygit
alias ls="eza --icons --git"

# STINKY ZOXIDE HAS TO BE TURNED OFF AT THE END?
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

