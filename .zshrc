# HISTORY HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="yyyy-mm-dd"
setopt HIST_IGNORE_DUPS SHARE_HISTORY

# COMPLETION COMPLETION
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# LOAD PLUGINS LOAD PLUGINS
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# PROMPT PROMPT
PROMPT='%B%F{#a6e3a1}➜%f %F{#89b4fa}%c%f '

# LOAD BONUS ZSHRC
[ -e "$HOME/.zshrc-bonus.zsh" ] && source "$HOME/.zshrc-bonus.zsh"

# ALIASES ALIASES ALIASES
alias icat="kitten icat"
alias ssh="kitten ssh"
alias lg=lazygit
alias ls="ls --color=auto"

# ENV ENV ENV ENV
export PAGER=less
export LESS="-iMSx4 -FX"
export EDITOR=nvim
export GLAMOUR_STYLE="$HOME/.config/glow/catppuccin.json"

# PATH PATH PATH
export PATH="$HOME/.local/bin:$PATH"
# HASKELL
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
# GO
export PATH="$HOME/go/bin:$PATH"
# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# STINKY ZOXIDE HAS TO BE TURNED OFF AT THE END?
eval "$(zoxide init zsh)"

