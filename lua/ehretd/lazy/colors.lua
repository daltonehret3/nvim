function ColorMyPencils(color)
	color = color or "tokyonight"

	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.opt.colorcolumn = "120"
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })

            -- vim.cmd("colorscheme tokyonight")
            -- ColorMyPencils("tokyonight")
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true
            })
            -- vim.cmd("colorscheme rose-pine")
            --
            -- ColorMyPencils()
        end
    },
    {
        "Mofiqul/dracula.nvim",
        config = function()
            require("dracula").setup({
                italic_comment = true,
                overrides = {
                    -- Normal = { bg = "none" },
                    -- NormalFloat = { bg = "none" },
                    FloatBorder = { fg = "#6272a4" },
                    SignColumn = { bg = "none" },
                },
            })
            vim.cmd("colorscheme dracula")
            ColorMyPencils("dracula")
        end
    },
    {
    "marko-cerovac/material.nvim",
        config = function()
            require("material").setup({
                contrast = {
                    sidebars = true, -- Enable contrast for sidebars, the sidebar will have the same background color as normal text
                    floating_windows = true, -- Enable contrast for floating windows
                    line_numbers = true, -- Enable contrast background for line numbers
                    sign_column = true, -- Enable contrast background for the sign column
                },
                disable = {
                    borders = false, -- Disable borders between verticaly split windows
                },
            })
            -- ColorMyPencils("material")
        end
    },
}
