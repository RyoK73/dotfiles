# ===
# zk
# ===
alias zknt="zk new --title"

# ---
# Move to the zk stored directory
# ---
function zkcd(){
	local zk_document_stored_dir="$HOME/dev/zkhub"
	if [[ -d "$zk_document_stored_dir" ]];then
		cd "$zk_document_stored_dir"
	else
		echo "$zk_document_stored_dir is not found."
	fi
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
