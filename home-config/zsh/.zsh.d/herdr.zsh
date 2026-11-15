# 現在のペインを右に分割し、新しいペインで引数のファイルを$EDITORで開く
# エディターを終了するとペインも閉じる
function herdr-edit() {
	if [[ -z "$HERDR_ENV" ]]; then
		echo "herdr内で実行してください" >&2
		return 1
	fi
	if [[ $# -ne 1 ]]; then
		echo "使い方: herdr-edit <file>" >&2
		return 1
	fi
	local split_result pane_id
	split_result=$(herdr pane split --current --direction right --cwd "$PWD" --focus) || return 1
	pane_id=$(jq -r '.result.pane.pane_id' <<<"$split_result")
	herdr pane run "$pane_id" "$EDITOR ${(q)1}; exit"
}
