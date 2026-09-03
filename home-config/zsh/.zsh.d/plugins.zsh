# plugin集

ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz compinit && compinit
zinit light zsh-users/zsh-completions

_comp_options+=(globdots)

zinit light Aloxaf/fzf-tab # tabでファイル検索

# aliasをexpand
export ZPWR_EXPAND_TO_HISTORY=true
# export ZPWR_EXPAND_PRE_EXEC_NATIVE=true
zinit light MenkeTechnologies/zsh-expand

# zinit snippet OMZ::plugins/git/git.plugin.zsh # OMZのgitプラグインを追加する

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
