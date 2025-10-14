return {
    {
        "nvim-treesitter/nvim-treesitter", 
        branch = 'main', 
        lazy = false, 
        build = ":TSUpdate", 
        opts = {
            indent = { enable = true},
            highlight = { enable = true},
            folds = { enable = true},
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "printf",
                "python",
                "query",
                "regex",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
        },
    }
}
