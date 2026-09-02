# 指定 or カレントディレクトリをツリー表示する
function trc() {
	local dir="$1"
	local flg
	if [[ -z "$dir" ]]; then
		dir="."
	else
		flg="-a"
	fi
	tree "$dir" "$flg" | cat
}

# ディレクトリが存在しないファイルの場合、ディレクトリごと作成するtouch
function mktouch() {
	if [[ -z "$1" ]]; then
		echo "引数が必要です"
		exit
	fi
	local filepath="$1"
	local dir=$(dirname "$filepath")
	if [[ ! -d "$dir" ]]; then
		mkdir -p "$dir"
	fi
	touch "$filepath"
}

# catしたファイルの内容をコピーする
function catc() {
	cat "$1" | wl-copy
}
