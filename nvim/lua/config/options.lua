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
