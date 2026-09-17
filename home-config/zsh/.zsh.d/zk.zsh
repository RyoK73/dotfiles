# ===
# zk
# ===
alias zknt="zk new --title"

function zkcd(){
	local zk_document_stored_dir="$HOME/dev/zkhub"
	if [[ -d "$zk_document_stored_dir" ]];then
		cd "$zk_document_stored_dir"
	else
		echo "$zk_document_stored_dir is not found."
	fi
}
