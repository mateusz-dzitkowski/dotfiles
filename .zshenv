# PAGERS EDITORS VISUALS PAGERS EDITORS VISUALS
export PSQL_PAGER='nvim -R -c "set nowrap"'
export PAGER=less
export LESS="-iMSx4 -FX"
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="nvim +Man!"

# STYLE STYLE STYLE STYLE
export GLAMOUR_STYLE="$HOME/.config/glow/catppuccin.json"
export EZA_CONFIG_DIR="$HOME/.config/eza"

# FZF FZF FZF FZF
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"

# PATH PATH PATH PATH PATH
export PATH="$HOME/.local/bin:$PATH"
# HASKELL
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
# GO
export PATH="$HOME/go/bin:$PATH"
# RUST
export PATH="$HOME/.cargo/bin:$PATH"

