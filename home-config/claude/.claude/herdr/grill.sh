#!/bin/bash
# briefを所定の場所に移し、指定したherdrペインでClaude Codeを起動して壁打ち(/grill-me-develop)を始める。
#
# usage (git リポジトリ内で実行する): grill.sh <branch> <brief-file> <pane_id>
#   <branch>      対象のブランチ名
#   <brief-file>  機能の説明を書いたmdファイル。<repo>.worktree/brief/<branch>.md に移動する
#   <pane_id>     Claude Codeを起動するherdrのペインID(create.shが出力するpane_id)
set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
branch="${1:-}"
brief_src="${2:-}"
pane_id="${3:-}"

if [[ -z "$branch" || -z "$brief_src" || -z "$pane_id" ]]; then
	echo "Usage: grill.sh <branch> <brief-file> <pane_id>" >&2
	exit 1
elif [[ ! -f "$brief_src" ]]; then
	echo "Error: brief file not found: $brief_src" >&2
	exit 1
fi

brief_dir=$("$script_dir/record-path.sh" brief)
brief_path="$brief_dir/$branch.md"
mv "$brief_src" "$brief_path"

herdr pane run "$pane_id" "claude \"/grill-me-develop $brief_path を読んで、この機能の壁打ちを始めてください\"" >/dev/null

echo "brief:     $brief_path"
