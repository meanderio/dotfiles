return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {},
    }
  end,
}
