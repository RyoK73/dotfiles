# ===
# setup
# ===

ZSHHOME="$(pwd)/zsh/.zsh.d"

source "$ZSHHOME/plugins.zsh"
source "$ZSHHOME/env.zsh"
source "$ZSHHOME/aliases.zsh"
source "$ZSHHOME/functions.zsh"
source "$ZSHHOME/prompt.zsh"
source "$ZSHHOME/git.zsh"
source "$ZSHHOME/claude.zsh"
source "$ZSHHOME/keymap.zsh"

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt auto_cd
setopt PROMPT_SUBST

# pnpm
export PNPM_HOME="/home/taruroma/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME/bin:"*) ;;
*) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# gists-tips-manager
source "/home/taruroma/dev/gists-tips-manager/scripts/gists-tips-manager.zsh"
# gists-tips-managerA end
