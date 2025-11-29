return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		-- vim.cmd.colorscheme("lackluster")
		-- vim.cmd.colorscheme("lackluster-night")
		-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
		vim.cmd.colorscheme("lackluster-mint")
	end,
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
}

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("catppuccin-mocha")
-- 	end,
-- }
