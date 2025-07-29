vim.wo.number = true
vim.o.relativenumber = true;

return {
	"folke/tokyonight.nvim",
	"theprimeagen/vim-be-good",
	"thePrimeagen/refactoring.nvim",
	"mbbill/undotree",
	"folke/zen-mode.nvim",
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                enable = true,
                max_lines = 0,
                trim_scope = "outer",
                min_window_height = 0,
                mode = "cursor",
                separator = nil,
            })
        end
    },
	{
		"github/copilot.vim",
		dir = "~/Developer/nvim/copilot.vim"
	},
	"Eandrju/cellular-automaton.nvim",
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
