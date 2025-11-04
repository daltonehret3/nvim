return {
    "folke/snacks.nvim",
    dependencies = {
        "nvim-mini/mini.nvim",
        "nvim-tree/nvim-web-devicons",
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
}
