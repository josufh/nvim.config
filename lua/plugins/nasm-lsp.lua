return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				asm_lsp = {
					cmd = { "asm-lsp" },
					filetypes = { "asm", "nasm" },
				},
			},
		},
	},
}
