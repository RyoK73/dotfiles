#!/bin/bash
# herdrのworktree workspaceを作り、新しいworkspaceでClaude Codeを起動して壁打ち(/grill-me-develop)を始める。
#
# usage (git リポジトリ内で実行する): plant.sh <branch> <brief-file>
#   <branch>      作成するブランチ名(-区切り)
#   <brief-file>  機能の説明を書いたmdファイル。<repo>.worktree/brief/<branch>.md に移動する
set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
branch="${1:-}"
brief_src="${2:-}"

if ! git rev-parse --git-dir &>/dev/null; then
	echo "Error: It is not Git directory here" >&2
	exit 1
elif ! git rev-parse HEAD &>/dev/null; then
	echo "Error: There is no commit. Commit something to the main branch first." >&2
	exit 1
elif [[ -z "$branch" || -z "$brief_src" ]]; then
	echo "Usage: plant.sh <branch> <brief-file>" >&2
	exit 1
elif [[ ! -f "$brief_src" ]]; then
	echo "Error: brief file not found: $brief_src" >&2
	exit 1
fi

root=$(git rev-parse --show-toplevel)
base=$("$script_dir/record-path.sh" base)
worktree_path="$base/$branch"

if [[ -e "$worktree_path" ]]; then
	echo "Error: already exists: $worktree_path" >&2
	exit 1
fi

# マージ済みのworktreeを先に片付ける。失敗しても作成は続ける。
"$script_dir/cut.sh" || echo "Warning: cut.sh failed, continuing" >&2

git pull --rebase origin main

# mainからではなく現ブランチから生成する
result=$(herdr worktree create --cwd "$root" --branch "$branch" --path "$worktree_path" --label "$branch" --focus)
workspace_id=$(jq -r '.result.workspace.workspace_id' <<<"$result")
pane_id=$(jq -r '.result.root_pane.pane_id' <<<"$result")

cp "$root"/.env* "$worktree_path/" 2>/dev/null || true # .gitignoreされている.envをコピー

# 作成したブランチのままremoteへpush(gone判定のためにremoteにブランチが必要)
git -C "$worktree_path" push -u origin "$branch"

brief_dir=$("$script_dir/record-path.sh" brief)
brief_path="$brief_dir/$branch.md"
mv "$brief_src" "$brief_path"

herdr pane run "$pane_id" "claude \"/grill-me-develop $brief_path を読んで、この機能の壁打ちを始めてください\"" >/dev/null

echo "worktree:  $worktree_path"
echo "workspace: $workspace_id"
echo "brief:     $brief_path"
