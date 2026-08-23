-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Catppuccin Mocha Overlay 1 foreground color
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#7f849c" })
