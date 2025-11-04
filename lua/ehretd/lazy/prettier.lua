return {
    "prettier/vim-prettier",
    ft = { "javascript", "typescript", "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql" },
    run = "yarn install --frozen-lockfile --production",
    config = function()
        vim.g['prettier#autoformat'] = 1
        vim.g['prettier#autoformat_require_pragma'] = 0
    end,
}
