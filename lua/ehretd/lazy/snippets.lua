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

        ls.add_snippets("javascript", {
            ls.parser.parse_snippet(
                {
                    trig = "here",
                    name = "Insert console.log('here')",
                    priority = 2000,
                },
                "console.log('here');"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "log",
                    name = "Insert console.log()",
                    priority = 9999,
                },
                "console.log($0);"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "test",
                    name = "Insert test function",
                    priority = 2000,
                },
                "test('$1', () => {\n\t$0\n});"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "acaf",
                    name = "Async Arrow Function",
                    priority = 2000,
                },
                "const $1 = async ($2) => {\n\t$0\n};"
            ),
             ls.parser.parse_snippet(
                {
                    trig = "caf",
                    name = "Arrow Function",
                    priority = 2000,
                },
                "const $1 = ($2) => {\n\t$0\n};"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "ae",
                    name = "Inserts afterEach() block",
                    priority = 2000,
                },
                "afterEach(() => {\n\t$0\n});"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "be",
                    name = "Inserts beforeEach() block",
                    priority = 2000,
                },
                "beforeEach(() => {\n\t$0\n});"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "descr",
                    name = "Inserts describe() block",
                    priority = 2000,
                },
                "describe('$1', () => {\n\t$0\n});"
            ),
            ls.parser.parse_snippet(
                {
                    trig = "test",
                    name = "Inserts test() block",
                    priority = 2000,
                },
                "test('$1', $2 () => {\n\t$0\n});"
            ),
        }, { key = "javascript" });
    end,
}
