-- CodeActionsMenu with ?
vim.api.nvim_set_keymap("n", "?", ":CodeActionMenu<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ">", ":lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<", ":lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })

vim.opt.splitright = true
vim.api.nvim_set_keymap("n", "<space>f", ":NERDTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>fs", ":Telescope git_files<CR>", { noremap = true })
