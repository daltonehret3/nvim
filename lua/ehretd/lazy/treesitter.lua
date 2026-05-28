return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	lazy = false,
	config = function()
		-- Register templ parser
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				require("nvim-treesitter.parsers").templ = {
					install_info = {
						url = "https://github.com/vrischmann/tree-sitter-templ.git",
						revision = "master",
					},
				}
			end,
		})

		vim.treesitter.language.register("templ", "templ")

		-- Install parsers (no-op if already installed)
		require("nvim-treesitter").install({
			"vimdoc",
			"javascript",
			"typescript",
			"c",
			"lua",
			"rust",
			"json",
			"html",
			"jsdoc",
		})

		-- Enable treesitter highlighting and indentation per filetype
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "javascript", "typescript", "c", "lua", "rust", "json", "html", "vimdoc", "templ" },
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
