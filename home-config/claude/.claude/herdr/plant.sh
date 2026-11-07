#!/bin/bash
# herdrのworktree workspaceを作り、新しいworkspaceでClaude Codeを起動して壁打ち(/grill-me-develop)を始める。
# 作成はcreate.sh、Claude起動はgrill.shが行う。ここはそれらをつなぐ入口。
#
# usage (git リポジトリ内で実行する): plant.sh <branch> <brief-file>
#   <branch>      作成するブランチ名(-区切り)
#   <brief-file>  機能の説明を書いたmdファイル。<repo>.worktree/brief/<branch>.md に移動する
set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
branch="${1:-}"
brief_src="${2:-}"

if [[ -z "$branch" || -z "$brief_src" ]]; then
	echo "Usage: plant.sh <branch> <brief-file>" >&2
	exit 1
elif [[ ! -f "$brief_src" ]]; then
	echo "Error: brief file not found: $brief_src" >&2
	exit 1
fi

# マージ済みのworktreeを先に片付ける。失敗しても作成は続ける。
"$script_dir/cut.sh" || echo "Warning: cut.sh failed, continuing" >&2

created=$("$script_dir/create.sh" "$branch")
worktree_path=$(sed -n 's/^worktree_path=//p' <<<"$created")
workspace_id=$(sed -n 's/^workspace_id=//p' <<<"$created")
pane_id=$(sed -n 's/^pane_id=//p' <<<"$created")

brief_line=$("$script_dir/grill.sh" "$branch" "$brief_src" "$pane_id")

echo "worktree:  $worktree_path"
echo "workspace: $workspace_id"
echo "$brief_line"
