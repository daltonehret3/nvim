return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "zbirenbaum/copilot.lua",
    },
    build = "make tiktoken",
    opts = {
    },
    config = function()
        require("CopilotChat").setup({
            -- prompts = {
            --     Explain = "Explain how the selected code works in detail.",
            --     Tests = "Propose useful unit tests for the selected code.",
            --     Fix = "Please fix the following code.",
            --     System = function()
            --         return [[
            --         You are a code-focused AI programming assistant with an active Agent Client Protocol (ACP).
            --         You have capabilities to read and analyze code through provided tools.
            --         Provide clear, direct responses focused on the programming task at hand.
            --     ]]
            --     end,
            -- },
            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            },
            window = {
                -- layout = "float",
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
        -- Optional keymaps
        vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Start CopilotChat" })
        vim.keymap.set("x", "<leader>cc", ":CopilotChatVisual ", { desc = "Start CopilotChat with visual selection" })
    end,
}
