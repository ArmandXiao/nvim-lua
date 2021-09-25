local keymap = vim.api.nvim_set_keymap

keymap('n', '<A-S-l>', "<Cmd>lua require('jdtls').code_action()<CR>", {noremap = true})
keymap('n', '<leader>r', "<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>", {noremap = true})
--vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
--nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>
--
--nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
--nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
--vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
--nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
--vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
--vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
