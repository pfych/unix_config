-- CodeActionsMenu with ?
vim.api.nvim_set_keymap("n", "?", ":CodeActionMenu<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ">", ":lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<", ":lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })
