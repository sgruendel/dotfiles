return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",   -- Alt + l to accept suggestion
          next = "<M-]>",     -- Alt + ] for next suggestion
          prev = "<M-[>",     -- Alt + [ for prev suggestion
          dismiss = "<C-]>",  -- Ctrl + ] to hide suggestion
        },
      },
      panel = { enabled = false },
    },
  }
}
