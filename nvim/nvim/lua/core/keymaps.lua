vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
	desc = "Clear search highlight",
})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
	desc = "Open diagnostic [Q]uickfix list",
})
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
	desc = "Exit terminal mode",
})
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {
	desc = "Move focus to the left window",
})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {
	desc = "Move focus to the right window",
})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {
	desc = "Move focus to the lower window",
})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {
	desc = "Move focus to the upper window",
})
vim.keymap.set("n", "<leader>y", '"+y', {
	desc = "Yank to system clipboard",
	noremap = true,
	silent = true,
})
vim.keymap.set("v", "<leader>y", '"+y', {
	desc = "Yank selection to system clipboard",
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "<leader>Y", '"+Y', {
	desc = "Yank line to system clipboard",
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "<leader>p", '"+p', {
	desc = "Paste from system clipboard",
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "<leader>P", '"+P', {
	desc = "Paste before cursor from system clipboard",
	noremap = true,
	silent = true,
})
vim.keymap.set("n", "<leader>d", '"+d', {
	desc = "Delete to system clipboard",
	noremap = true,
	silent = true,
})
vim.keymap.set("v", "<leader>d", '"+d', {
	desc = "Delete selection to system clipboard",
	noremap = true,
	silent = true,
})
vim.keymap.set("i", "jk", "<Esc>", {
	desc = "Exit insert mode",
})
vim.keymap.set("n", "<leader>hv", vim.cmd.Ex, {
	desc = "Open netrw file explorer",
})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
	desc = "Move selected lines down",
})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
	desc = "Move selected lines up",
})
vim.keymap.set("n", "J", "mzJ`z", {
	desc = "Join lines and maintain cursor position",
})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {
	desc = "Scroll down and center",
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
	desc = "Scroll up and center",
})
vim.keymap.set("n", "n", "nzzzv", {
	desc = "Search forward and center",
})
vim.keymap.set("n", "N", "Nzzzv", {
	desc = "Search backward and center",
})
vim.keymap.set("n", "<C-s>", ":w<CR>", {
	desc = "Save file",
})
vim.keymap.set("n", "<C-a>", "ggVG", {
	desc = "Select all text in the file",
})

local function rebase_dir()
	vim.cmd("Ex")

	local current_path = vim.fn.expand("%:p:h")

	vim.cmd("cd " .. current_path)

	print("Rebased to " .. current_path)
end

vim.keymap.set("n", "<leader>rb", rebase_dir, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<CR>", { silent = true, desc = "Toggle ZenMode" })
