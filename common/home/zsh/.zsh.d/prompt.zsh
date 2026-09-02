# ===
# プロンプトをグラフィカルにスタイリング
# ===

parse_git_count() {
	git status --porcelain 2>/dev/null | grep -cE "^ M|^\?\?|^ D"
}

_git_prompt() {
	local branch
	branch=$(git branch 2>/dev/null | grep '^*' | sed 's/^\* //')
	[[ -z "$branch" ]] && return
	if [[ $(git status -s 2>/dev/null) ]]; then
		echo -n "%K{237}%F{#fbd254}%B  ${branch} 🔀 $(parse_git_count) %b%f%k"
	else
		echo -n "%K{237}%F{#57f2c1}%B  ${branch} ✅ 0 %b%f%k"
	fi
}

_venv_info() {
	[[ -n "$VIRTUAL_ENV" ]] && echo -n "%K{#00c666}%F{#343534} ${VIRTUAL_ENV##*/} %f%k"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='$(_venv_info)%K{#00c666}%F{#343534} %n@%m %f%k%K{#59a4ff}%F{#343534} 🧭 %~ %f%k$(_git_prompt)
%B%F{#00c666}╰> $ %f%b'

# 入力する際の文字色設定
ZSH_HIGHLIGHT_STYLES[argument]=$(fg=#ffffff)
ZSH_HIGHLIGHT_STYLES[string]=$(fg=#ffffff)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ffffff:waybar'
