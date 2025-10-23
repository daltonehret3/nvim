return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "zbirenbaum/copilot.lua",
        branch = 'master'
    },
    build = "make tiktoken",
    opts = {
        mappings = {
            open = "<leader>cc",
            close = "<leader>ce",
            submit = "<leader>cs",
            cycle_next = "<leader>cn",
            cycle_prev = "<leader>cp",
            toggle_settings = "<leader>ct",
            new_session = "<leader>cnv",
        }
    }
}
