return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    enabled = true,
    opts = {
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function ()
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>")
    end
  }
}
