-- CodeActionsMenu with ?
vim.api.nvim_set_keymap("n", "?", ":CodeActionMenu<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ">", ":lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<", ":lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })

vim.opt.splitright = true
vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
