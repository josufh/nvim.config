require("config.lazy")

vim.cmd("syntax on")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.showmatch = true
vim.opt.cursorline = true

vim.cmd.colorscheme("tokyonight-night")

vim.filetype.add({
	extension = {
		asm = "nasm",
	},
})
