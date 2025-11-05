return {
    "folke/snacks.nvim",
    dependencies = {
        {"nvim-tree/nvim-web-devicons", enabled = true},
        "nvim-mini/mini.nvim",
    },
    priority = 1000,
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        animate = { enabled = true },
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = false },
        indent = { enabled = true },
        image = { enabled = true },
        input = {
            enabled = true,
            position = "float",
            border = true,
            title_pos = "center",
        },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps"},
        { "<leader>pf", function() Snacks.picker.smart() end, desc = "Smart Find Files"},
        { "<leader>ps", function() Snacks.picker.grep() end, desc = "Grep Text"},
        { "<leader>pws", function() Snacks.picker.grep_word() end, desc = "Grep Word"},
        { "<leader>vh", function() Snacks.picker.help() end, desc = "Help Tags"},
        { "<leader>vrr", function() Snacks.picker.lsp_references() end, desc = "LSP References"},
        { "<C-p>", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to Definition" },
        -- { "K", function() Snacks.lsp.hover() end, desc = "Hover Documentation" },
    }
}
