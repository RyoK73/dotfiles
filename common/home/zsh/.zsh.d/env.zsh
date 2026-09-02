export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"

# golang
export PATH="$(go env GOPATH):$PATH"

# fzfが隠しファイルも検索する
export FZF_DEFAULT_COMMAND="find -L"
