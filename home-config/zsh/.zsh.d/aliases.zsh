# 汎用的なalias集

# ===
# 便利系
# ===
alias -s {md,lua,ts,tsx,js,jsx,json,jsonc,conf,toml,yaml,yml,toml,html,css,zshrc}=$EDITOR
alias npm="pnpm"
alias cat="bat"
alias xopen="xdg-open"
alias cdnv="cd $HOME/.config/nvim/lua/plugins"
alias killport="fuser -k 3000/tcp 2>/dev/null"
alias sysup="sudo pacman -Syu && zinit self-update && zinit update --all"

# ===
# ファイル操作
# ===
alias ls="ls -a1"
alias lsc="ls -a1 | cat"

# ===
# 短縮形
# ===
alias hx="helix"
alias nv="nvim"

# ===
# ショートカット系
# ===
alias waybar-reload="pkill waybar && waybar & disown"
alias hypr-reload="hyprctl reload"
alias mozc-setup="fcitx5-config-qt"
