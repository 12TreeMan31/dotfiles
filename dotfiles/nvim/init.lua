-- NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config")

vim.pack.add{
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },

    { src = 'https://github.com/nyoom-engineering/oxocarbon.nvim' },
    { src = 'https://github.com/rebelot/kanagawa.nvim' },
}

require("nvim-tree").setup()

-- vim.cmd("colorscheme kanagawa-wave")
vim.cmd("colorscheme oxocarbon")
vim.lsp.enable({
	"rust_analyzer",
	"clangd",
})
