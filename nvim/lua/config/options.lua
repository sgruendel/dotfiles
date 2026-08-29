-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

-- vim.opt.relativenumber = false
vim.g.autoformat = false

-- Hide AI suggestions from the completion popup menu
vim.g.ai_cmp = false

vim.filetype.add({
  extension = {
    jte = "html",
  },
})
