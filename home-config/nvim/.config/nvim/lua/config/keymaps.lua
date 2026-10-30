vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer", silent = true })
-- vim.keymap.set("n", "%", "ggVG", { desc = "Select all" })
-- 基本操作系
vim.keymap.set("n", "Y", "Vy", { desc = "Yank Line" })
vim.keymap.set("n", "gs", "^", { desc = "Go to first word" })
vim.keymap.set("n", "gl", "$", { desc = "Go to last word" })
vim.keymap.set("n", "U", "<C-r>", { desc = "redo" })
vim.keymap.set("n", "<enter>", "o", { desc = "line break" })
vim.keymap.set("n", "<BS>", "X", { desc = "Back Space" })
vim.keymap.set("n", "<Del>", "x", { desc = "Delete" })

-- rename
vim.keymap.set("n", "<leader>rn", ":IncRename")

vim.keymap.set("n", "<leader>F", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Go to error float" })

-- 表の確認用に折り返しのtrue/falseを切り替える
vim.keymap.set("n", "<leader>k", "", { desc = "便利操作キーバインド" }) -- which keyの表示用
local function toggle_wrap()
  vim.wo.wrap = not vim.wo.wrap
  vim.notify("折り返し: " .. (vim.wo.wrap and "ON" or "OFF"), vim.log.levels.INFO)
end
vim.keymap.set("n", "<leader>kw", toggle_wrap, { desc = "折り返しを切り替える" })
-- Claude Codeに渡すために現在開いているファイル名と行番号をクリップボードにコピーする
local function copy_filelocation()
  local path = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  vim.fn.setreg("+", "@" .. path .. " :" .. line .. " ")
  print("Copied @" .. path .. " #" .. line)
  print("")
end
vim.keymap.set(
  "n",
  "<leader>ky",
  copy_filelocation,
  { desc = "ファイルの場所をクリップボードにコピーする" }
)
