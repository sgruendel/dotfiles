return {
	-- see https://www.lazyvim.org/plugins/formatting#conformnvim
	"stevearc/conform.nvim",
	opts = {
		-- see https://micahsvenson.com/notes/brewing_up_a_java_setup_for_neovim/#xml-and-maven-support-with-lemminx
		servers = {
			lemminx = {
				init_options = {
					settings = {
						xml = {
							format = {
								enabled = true,
								splitAttributes = "preserve",
								maxLineWidth = 120,
							},
						},
					},
				},
			},
		},
		-- see https://github.com/stevearc/conform.nvim#options
		formatters_by_ft = {
			html = { "prettierd" },
			css = { "prettierd" },
			--json = { "prettier" },
			--yaml = { "prettier" },
			--markdown = { "prettier" },
			java = { "open-java-format" },
		},
		formatters = {
			["open-java-format"] = {
				command = "open-java-format",
				args = { "-" },
				range_args = function(self, ctx)
					return { "--lines", ctx.range.start[1] + ":" + ctx.range["end"][1] }
				end,
			},
		},
	},
}
