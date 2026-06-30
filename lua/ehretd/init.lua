require("ehretd.remap")
require("ehretd.set")
require("ehretd.lazy_init")

local M = {}
local augroup = vim.api.nvim_create_augroup
local ehretd = augroup("ehretd", {})

local autocmd = vim.api.nvim_create_autocmd

local function stl_hl(name) return string.format("%%#%s#", name) end

local space = " "
local double_space = "  "

function M.directory()
    if vim.v.virtnum ~= 0 then
        return double_space
    end

    local name = vim.api.nvim_buf_get_lines(0, vim.v.lnum - 1, vim.v.lnum, true)[1]

    local icon, icon_color
    if name:sub(-1) == "/" then
        icon = ""
        icon_color = "Directory"
    else
        local extension = vim.fs.ext(name)
        local devicons = require("nvim-web-devicons")
        icon, icon_color = devicons.get_icon(name, extension)

        if not icon then
            icon, icon_color = devicons.get_icon_by_filetype(vim.bo[0].filetype, { default = true })
        end
    end

    return table.concat({
        stl_hl(icon_color),
        icon,
        space,
    })
end

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

        -- Some LSP Keymaps are in snacks.lua

		-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover({border=border}) end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostics.openfloat() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostics.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostics.goto_prev() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		-- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<C-t><C-j>", ":!npx jest %:p", opts)
        vim.keymap.set("n", "<C-t><C-v>", ":!npx vitest %:p", opts)
	end
})

return M
