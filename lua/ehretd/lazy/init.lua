vim.wo.number = true
vim.o.relativenumber = true;

return {
    "folke/tokyonight.nvim",
    "theprimeagen/vim-be-good",
    "thePrimeagen/refactoring.nvim",
    "mbbill/undotree",
    "folke/zen-mode.nvim",
    "nvim-tree/nvim-web-devicons",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/tokyonight.nvim" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight",
                    icons_enabled = true,
                    always_show_tabline = true,
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {{'datetime', style = '%m-%d-%y %H:%M'}, 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
            })
        end,
    },
    {
        "nvim-neotest/neotest",
        commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
        -- lazy = true,
    },
    {
        "nvim-neotest/neotest-jest",
        commit = "d34e6fdc8cedc290d36977ff0e865e5077459a49"
    },
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
        dir = "~/Developer/nvim/copilot.vim",
        enabled = true,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true },
                panel = { enabled = true },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
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
