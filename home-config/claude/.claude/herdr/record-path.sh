#!/bin/bash
# worktreeと記録mdの置き場所を決める共通スクリプト。置き場所のルールはここだけが持つ。
#
# usage (git リポジトリ内で実行する):
#   record-path.sh primary   primaryリポジトリのルートを出力する
#   record-path.sh base      <repo>.worktree ディレクトリを出力する(作成はしない)
#   record-path.sh <種類>    <repo>.worktree/<種類> を作成して出力する (brief, grill-me, pr-reviews など)
set -euo pipefail

kind="${1:-}"
if [[ -z "$kind" ]]; then
	echo "Usage: record-path.sh <primary|base|種類>" >&2
	exit 1
fi

if ! common_dir=$(git rev-parse --path-format=absolute --git-common-dir 2>/dev/null); then
	echo "Error: It is not Git directory here" >&2
	exit 1
fi
primary=$(dirname "$common_dir")

if [[ "$kind" == "primary" ]]; then
	echo "$primary"
	exit 0
fi

# ディレクトリではなく、remote repositoryを基準にprefixを決定、remote repositoryがなければディレクトリ名にフォールバック
if url=$(git remote get-url origin 2>/dev/null); then
	repo=$(basename "$url" .git)
else
	repo=$(basename "$primary")
fi

base="$(dirname "$primary")/$repo.worktree"

if [[ "$kind" == "base" ]]; then
	echo "$base"
	exit 0
fi

mkdir -p "$base/$kind"
echo "$base/$kind"
