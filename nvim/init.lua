-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Catppuccin Mocha Overlay 1 foreground color
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#7f849c" })

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
