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
    config = function()
      vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>")
    end
  }
}
