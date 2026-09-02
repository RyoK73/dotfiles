# keymap集

# ===
# fzf
# ===

# CTRL+Tの上下移動をTab/Shift+Tabで
export FZF_CTRL_T_OPTS="
  --bind='tab:down'
  --bind='shift-tab:up'
"
# CTRL+Rの上下移動をTab/Shift+Tabで
export FZF_CTRL_R_OPTS="
  --bind='tab:down'
  --bind='shift-tab:up'
"

# ===
# zsh
# ===

bindkey -v
bindkey "^A" autosuggest-accept
bindkey "^P" forward-word

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
