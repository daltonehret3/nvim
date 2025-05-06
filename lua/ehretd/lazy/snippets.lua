return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local ls = require("luasnip")

        ls.setup({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })

        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip").filetype_extend("javascript", { "jsdoc" })

        vim.keymap.set({"i", "s"}, "<C-p>", function() ls.jump(1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-o>", function() ls.jump(-1) end, {silent = true})

        ls.add_snippets("all", {
            ls.parser.parse_snippet(
                {
                    trig = "here",
                    name = "Insert console.log('here')",
                },
                "console.log('here');"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "test",
                    name = "Insert test function",
                },
                "test('$1', () => {\n\t$0\n});"
            ),
        }, { key = "all" })
    end,
}
