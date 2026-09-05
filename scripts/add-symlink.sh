#!/bin/bash

echo "Choose target-directory"
current_dir="$(cwd)"
project_root_dir="$(git rev-parse --show-toplevel)"
target_dir="$(find "$project_root_dir" -maxdepth 1 -iname "*config" | gum choose --limit 1)"
# 実装内容
# target_dirに移動する
# symlinkファイル一覧をgum chooseする
# 選択したsymlinkに対して、stow --adopt && git checkout -- .する
# 完了までspin
# 完了メッセージ
# current_dirに戻る
echo "$target_dir"
