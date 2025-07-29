return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			-- Enable in Public --
			enabled = false,
			cloak_character = "*",
			highlight_group = "Comment",
			patterns = {
				{
					file_pattern = {
						".env*",
						"wrangler.toml",
						".dev.vars",
					},
					cloak_pattern = "=.+"
				},
			},
		})
	end
}
