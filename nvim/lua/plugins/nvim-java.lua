return {
  -- see https://github.com/nvim-java/nvim-java#using-lazynvim
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
      vim.lsp.enable('jdtls')
    end,
  }
}
