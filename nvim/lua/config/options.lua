-- Options are automatically loaded before lazy.nvim startup.
if vim.fn.has("wsl") == 0 then
	require("config.remote_clipboard").setup()
end

-- vim.opt.relativenumber = false
vim.g.autoformat = false

-- Hide AI suggestions from the completion popup menu
vim.g.ai_cmp = false

vim.filetype.add({
	extension = {
		jte = "html",
	},
})

-- see https://github.com/mfussenegger/nvim-jdtls#configuration
vim.lsp.config("jdtls", {
	-- see https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	settings = {
		java = {
			-- disable formatting and organize imports, since we use conform.nvim for that
			format = {
				enabled = false,
			},
			saveActions = {
				organizeImports = false,
			},
			completion = {
				importOrder = {}, -- no packages given -> alphabetical order with no blanks between groups
			},
		},
	},
})
