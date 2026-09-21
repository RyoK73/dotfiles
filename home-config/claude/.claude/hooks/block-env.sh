#!/bin/bash
set -euo pipefail

input=$(cat)

tool_name=$(echo "$input" | jq -r '.tool_name')
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')
command_str=$(echo "$input" | jq -r '.tool_input.command // empty')

target=""
case "$tool_name" in
Read | Edit | Write)
	target="$file_path"
	;;
Bash)
	target="$command_str"
	;;
esac

deny() {
	jq -n --arg reason "$1" '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: $reason
    }
  }'
	exit 0
}

# 1. ファイル名・コマンドのパターンマッチ
if [[ "$target" =~ \.env(\.|$) ]]; then
	deny "機密ファイルへのアクセスはブロックされました: $target"
fi

# 2. 中身に機密文字列が含まれていないかチェック（Read / Edit のみ）
# if [[ "$tool_name" == "Read" || "$tool_name" == "Edit" ]] && [[ -f "$file_path" ]]; then
# 	if grep -qE 'SECRET_KEY|PRIVATE_KEY|API_TOKEN' "$file_path"; then
# 		deny "機密文字列を含むファイルへのアクセスはブロックされました: $file_path"
# 	fi
# fi

exit 0
