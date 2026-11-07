#!/bin/bash
# herdrのworktree workspaceを作る(Claude Codeは起動しない)。
#
# usage (git リポジトリ内で実行する): create.sh <branch>
#   <branch>  作成するブランチ名(-区切り)
#
# 標準出力には結果を key=value で出す(worktree_path / workspace_id / pane_id)。
# gitの進捗出力は標準エラーに回し、標準出力を汚さない。
set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
branch="${1:-}"

if ! git rev-parse --git-dir &>/dev/null; then
	echo "Error: It is not Git directory here" >&2
	exit 1
elif ! git rev-parse HEAD &>/dev/null; then
	echo "Error: There is no commit. Commit something to the main branch first." >&2
	exit 1
elif [[ -z "$branch" ]]; then
	echo "Usage: create.sh <branch>" >&2
	exit 1
fi

root=$(git rev-parse --show-toplevel)
base=$("$script_dir/record-path.sh" base)
worktree_path="$base/$branch"

if [[ -e "$worktree_path" ]]; then
	echo "Error: already exists: $worktree_path" >&2
	exit 1
fi

git pull --rebase origin main >&2

# mainからではなく現ブランチから生成する
result=$(herdr worktree create --cwd "$root" --branch "$branch" --path "$worktree_path" --label "$branch" --focus)
workspace_id=$(jq -r '.result.workspace.workspace_id' <<<"$result")
pane_id=$(jq -r '.result.root_pane.pane_id' <<<"$result")

cp "$root"/.env* "$worktree_path/" 2>/dev/null || true # .gitignoreされている.envをコピー

# 作成したブランチのままremoteへpush(gone判定のためにremoteにブランチが必要)
git -C "$worktree_path" push -u origin "$branch" >&2

echo "worktree_path=$worktree_path"
echo "workspace_id=$workspace_id"
echo "pane_id=$pane_id"
