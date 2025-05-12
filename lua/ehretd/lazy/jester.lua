return {
    "David-Kunz/jester",
    config = function()
        vim.keymap.set("n", "<leader>tt", function()
            require("jester").run()
        end, { desc = "Run test" })

        vim.keymap.set("n", "<leader>tf", function()
            require("jester").run({ file = true })
        end, { desc = "Run file" })

        vim.keymap.set("n", "<leader>o", function()
            require("jester").run({ output = true })
        end, { desc = "Run output" })
    end
}
