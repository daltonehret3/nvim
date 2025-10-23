return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "zbirenbaum/copilot.lua",
    },
    build = "make tiktoken",
    config = function()
        require("CopilotChat").setup({
            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },
            window = {
                border = "rounded",
                width = 0.3,
                height = 0.6,
            },
            tools = {
                edit = {
                    use_contextual_strategy = true,
                },
            },
            system = {
                tools = {
                    file_manager = {
                        read = true,
                        write = true,
                        edit = true,
                        create = true,
                    },
                },
            },
            model = "claude-3.5-sonnet",
            provider = "copilot",
        })

        vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Start CopilotChat" })
        vim.keymap.set("x", "<leader>cc", ":CopilotChatVisual ", { desc = "Start CopilotChat with visual selection" })
    end,
}
