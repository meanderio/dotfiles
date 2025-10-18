require("mndr")
require("config.lazy")

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.wo.number = true
vim.wo.relativenumber = true

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})

vim.keymap.set("i", "<C-,>", "<C-o>j")
vim.keymap.set("i", "<C-.>", "<C-o>k")
