export PAGER=less
export LESS="-iMSx4 -FX"
export EDITOR=nvim
export VISUAL=nvim

# STYLE STYLE STYLE STYLE
export MANPAGER="nvim +Man!"
export GLAMOUR_STYLE="$HOME/.config/glow/catppuccin.json"
# LESS
export LESS_TERMCAP_mb=$'\e[1;38;2;243;139;168m'               # blink → red
export LESS_TERMCAP_md=$'\e[1;38;2;137;180;250m'               # bold → blue
export LESS_TERMCAP_me=$'\e[0m'                                # blink/bold end
export LESS_TERMCAP_so=$'\e[1;38;2;17;17;27;48;2;249;226;175m' # standout → yellow on base
export LESS_TERMCAP_se=$'\e[0m'                                # standound end
export LESS_TERMCAP_us=$'\e[4;38;2;166;227;161m'               # underline → green
export LESS_TERMCAP_ue=$'\e[0m'                                # underline end

# PATH PATH PATH PATH PATH
export PATH="$HOME/.local/bin:$PATH"
# HASKELL
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
# GO
export PATH="$HOME/go/bin:$PATH"
# RUST
export PATH="$HOME/.cargo/bin:$PATH"

