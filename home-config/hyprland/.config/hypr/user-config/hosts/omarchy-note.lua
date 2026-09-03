hl.device({
	name = "ftcs1000:00-2808:0101-touchpad",
	enabled = false,
})

local setupArr = {
	{ workspace = "1", monitor = "eDP-1", default = true },
	{ workspace = "2", monitor = "eDP-1" },
	{ workspace = "3", monitor = "eDP-1" },
	{ workspace = "4", monitor = "eDP-1" },
	{ workspace = "5", monitor = "eDP-1" },
	{ workspace = "6", monitor = "eDP-1" },
}

for i = 1, #setupArr do
	hl.workspace_rule(setupArr[i])
end
