vim.o.shell = os.getenv("SHELL")
vim.o.shellcmdflag = "-c"
vim.o.shellquote = ""
vim.o.shellxquote = ""

local options = {
  number = true,
  relativenumber = true,
  mouse = "a",
  showmode = false,
  clipboard = "",
  breakindent = true,
  undofile = true,
  ignorecase = true,
  smartcase = true,
  signcolumn = "yes",
  updatetime = 250,
  timeoutlen = 300,
  splitright = true,
  splitbelow = true,
  list = true,
  inccommand = "split",
  cursorline = true,
  scrolloff = 8,
  guicursor = "",
  swapfile = false,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}
