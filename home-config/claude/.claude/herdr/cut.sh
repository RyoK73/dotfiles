#!/bin/bash
# リモートでgoneになった(=マージ済みの)ブランチのworktree・herdr workspace・ローカルブランチ・briefを削除する。
# 未コミットの変更などでworktreeを消せなかったブランチは、--forceせずにスキップして報告する。
#
# usage (git リポジトリ内で実行する): cut.sh
set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if ! git rev-parse --git-dir &>/dev/null; then
	echo "Error: It is not Git directory here" >&2
	exit 1
fi

primary=$("$script_dir/record-path.sh" primary)

brief_dir="$("$script_dir/record-path.sh" base)/brief"

git fetch --prune

current=$(git branch --show-current)
primary_branch=$(git -C "$primary" branch --show-current)

# herdrサーバーが動いていればworktree一覧を取得する。動いていなければ空にして、git worktreeにフォールバックする。
worktrees_json=$(herdr worktree list --cwd "$primary" 2>/dev/null || true)

# gone判定は`git for-each-ref`のupstream:trackが"[gone]"と完全一致するものだけ。コミット件名による誤検出を避ける。
gone_branches=$(git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {print $1}')

skipped=()
for branch in $gone_branches; do
	if [[ "$branch" == "$current" || "$branch" == "$primary_branch" ]]; then
		continue
	fi

	wt_path=""
	workspace_id=""
	if [[ -n "$worktrees_json" ]]; then
		wt_path=$(jq -r --arg b "$branch" '.result.worktrees[] | select(.branch == $b and .is_linked_worktree) | .path' <<<"$worktrees_json" | head -n 1)
		workspace_id=$(jq -r --arg b "$branch" '.result.worktrees[] | select(.branch == $b and .is_linked_worktree) | .open_workspace_id // empty' <<<"$worktrees_json" | head -n 1)
	fi
	if [[ -z "$wt_path" ]]; then
		wt_path=$(git worktree list --porcelain | awk -v b="refs/heads/$branch" '/^worktree /{p=$2} $1=="branch" && $2==b {print p}')
	fi

	if [[ -n "$workspace_id" ]]; then
		if ! herdr worktree remove --workspace "$workspace_id" >/dev/null; then
			skipped+=("$branch")
			continue
		fi
	elif [[ -n "$wt_path" ]]; then
		if ! git worktree remove "$wt_path"; then
			skipped+=("$branch")
			continue
		fi
	fi

	git branch -D "$branch"
	rm -f "$brief_dir/$branch.md"
done

if ((${#skipped[@]} > 0)); then
	echo
	echo "⚠️削除できなかったブランチ(未コミットの変更などを確認してください)"
	printf '  %s\n' "${skipped[@]}"
fi

echo
echo 💫残りのローカルブランチ💫
echo
git branch
