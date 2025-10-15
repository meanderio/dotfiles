return {
  {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'main', 
    lazy = false, 
    build = ":TSUpdate",
    opts = {
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        "diff",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  }
}
