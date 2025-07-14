require("ehretd.remap")
require("ehretd.set")
require("ehretd.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ehretd = augroup("ehretd", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
	group = ehretd,
	callback = function(e)
		local opts = { buffer = e.buf }

        local border = {
            { '┌', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '┐', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '┘', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '└', 'FloatBorder' },
            { '│', 'FloatBorder' },
        }

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover({border=border}) end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostics.openfloat() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostics.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostics.goto_prev() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<C-t><C-j>", ":!npx jest %:p", opts)
	end
})
