# git関連のalias,function集

# ===
# 短縮alias
# ===

# ---
# ブランチ系
# ---
alias gsw="git switch"
alias gswc="git switch -c"

# ---
# コミット系
# ---
alias ga="git add --verbose"
alias gap="git add --verbose -p"
alias gc="git commit --verbose"
alias gcm="git commit -m"
alias gcp="git commit -p"
alias gcam="git commit --amend"
alias gcamn="git commit --amend --no-edit"

# ---
# remote系
# ---
alias gps="git push"
alias gps-r="git push --force-with-lease" # ローカルが最新の場合のみgit push --forceが成功する
alias gpl-r="git pull --rebase"

# ---
# 便利系
# ---
alias gst="git status"
alias gd="git diff"

alias gss="git stash push -m"
alias gsp="git stash pop"
alias gsl="git stash list"

# ===
# function
# ===

# ---
# プロジェクトルートへ移動する
# ---

# aliasだと$()がターミナル起動時にキャッシュされてエラーが表示されるためfunctionで記述
function gcd() {
	cd $(git rev-parse --show-toplevel)
}

# ---
# Git remoteでマージ済みのローカルブランチを削除する
# ---
function git-cleanup() {
	git fetch --prune
	git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -d
	echo
	echo 💫残りのローカルブランチ💫
	echo
	git branch
}

# ===
# git worktree
# ===

# ---
# Create new git worktree as ${project-name}-${branch-name} and create new directory.
# ---
alias gitp="git-worktree-plant"
function git-worktree-plant() {
	if ! git rev-parse --git-dir &>/dev/null; then
		echo "Error: It is not Git directory here"
		return
	elif ! git rev-parse HEAD --git-dir &>/dev/null; then
		echo "Error: There is no commit. Commit something to the main branch first."
		return
	elif [[ -z "$1" ]]; then
		echo "Error: Need the branch name"
		return
	fi

	# Move to the project root directory.
	gcd

	git pull --rebase origin main

	local repo
	repo=$(basename $(git remote get-url origin) .git) || repo=$(basename $(git rev-parse --show-toplevel)) # ディレクトリではなく、remote repositoryを基準にprefixを決定、remote repositoryがなければディレクトリ名にフォールバック

	local branchdir="../$repo-$1"
	git worktree add -b "$1" "$branchdir" # mainからではなく現ブランチから生成する

	cp .env* "$branchdir/" # Copy .env files that written in .gitignore.
	cd "$branchdir"

	git push # 作成したブランチのままremoteへpush(要upstream)
}

# ---
# merge済みのgit worktreeを削除する
# ---
function gitc() {
	git fetch --prune
	git branch -vv | grep ': gone' | awk '{
    if ($1 == "+") {
      gsub(/[()]/,"",$4); print $2,$4
    } else { print $1,"" }
  }' | while read branch wt_path; do
		[[ -n "$wt_path" ]] && git worktree remove "$wt_path"
		git branch -D "$branch"
	done
	echo
	echo 💫残りのローカルブランチ💫
	echo
	git branch
}
