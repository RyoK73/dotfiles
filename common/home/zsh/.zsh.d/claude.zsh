# claude code関連のalias,function集

# ===
# alias
# ===
alias ccr="claude -r"
alias ccc="claude -c"

# ===
# function
# ===

# claude codeを通常モードで呼び出す
function cc() {
	if [[ -z "$1" ]]; then
		echo "セッション名を指定してください"
		echo "例：cc session-name"
		return 1
	fi
	wl-copy "$1"
	claude --name "$1"
}

# claude codeをthinkモードで呼び出す
function cct() {
	if [[ -z "$1" ]]; then
		echo "セッション名を指定してください"
		echo "例：cc session-name"
		return 1
	fi
	claude /think --name "think-${1}"
}

# claude skill 一覧の呼び出し関数
function skills-tutor() {
	if [[ -f "$HOME/.claude/skills-tutor.md" ]]; then
		cat "$HOME/.claude/skills-tutor.md"
	else
		echo "$HOME/.claude/skills-tutor.mdがありません"
	fi
}
