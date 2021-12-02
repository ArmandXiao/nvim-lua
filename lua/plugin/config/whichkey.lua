local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>', ":WhichKey '<Space>'<CR>", {silent = true})
