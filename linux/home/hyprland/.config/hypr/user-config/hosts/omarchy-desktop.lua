local setupArr = {
	{ workspace = "6", monitor = "DP-3" },
	{ workspace = "7", monitor = "DP-3" },
	{ workspace = "8", monitor = "DP-3", default = true },
	{ workspace = "9", monitor = "DP-3" },
	{ workspace = "10", monitor = "DP-3" },
	{ workspace = "1", monitor = "DP-2", default = true },
	{ workspace = "2", monitor = "DP-2" },
	{ workspace = "3", monitor = "DP-2" },
	{ workspace = "4", monitor = "DP-2" },
	{ workspace = "5", monitor = "DP-2" },
}
for i = 1, #setupArr do
	hl.workspace_rule(setupArr[i])
end
