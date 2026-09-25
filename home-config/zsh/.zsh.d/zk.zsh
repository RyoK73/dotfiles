# ===
# zk
# ===

# ---
# Initialize
# ---
zk_document_stored_dir="$HOME/dev/zkhub"

if [[ ! -d "$zk_document_stored_dir" ]];then
	echo "$zk_document_stored_dir is not found."
	echo "Create $zk_document_stored_dir directory or clone dotfiles into dev directory"
fi	

alias zkn="zk-new-title"
alias zke="zk edit --interactive"
# ---
# Create a new md file into the zkhub directory
# ---
function zk-new-title(){
		if [[ -z "$1" ]];then
			echo "zkで作成するタイトルを指定してください"
			return
		fi
		local cwd="$(pwd)"
		cd "$zk_document_stored_dir"
		zk new --title "$1"
		cd "$cwd"

}
# ---
# Move to the zk stored directory
# ---
function zkcd(){
		cd "$zk_document_stored_dir"
}

# ---
# Commit and push automatically.
# ---
function zksync(){
	local cwd="$(pwd)"
	zkcd
	git add .
	git commit -m "chore: Update documents"
	git push origin main
	cd "$cwd"
}
