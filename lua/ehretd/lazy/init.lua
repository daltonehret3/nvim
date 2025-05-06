vim.wo.number = true
vim.o.relativenumber = true;

return {
	"folke/tokyonight.nvim",
	"theprimeagen/vim-be-good",
	"thePrimeagen/refactoring.nvim",
	"mbbill/undotree",
	"folke/zen-mode.nvim",
	{
		"github/copilot.vim",
		dir = "~/Developer/nvim/copilot.vim"
	},
	"Eandrju/cellular-automaton.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	},
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},
}
