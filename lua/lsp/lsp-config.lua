local keymap = vim.api.nvim_set_keymap

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true })
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true })
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true })
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true })
--keymap('n', 'k', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true })
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true })
keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true })
keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true })
