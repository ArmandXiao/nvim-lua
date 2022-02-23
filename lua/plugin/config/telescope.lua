-- * Key remapping * --
local keymap = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap
vim.g.mapleader = ' '   -- Important!!! since Plugin is read before config..

keymap('n', '<leader>,', "<cmd>lua require('telescope.builtin').find_files()<cr>", { silent = true })
keymap('n', '<leader><leader>g', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { silent = true })
keymap('n', '<leader><leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })

-- ** lsp ** --
keymap('n', '<leader>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", {})
keymap('n', '<leader>r', "<cmd>lua require('telescope.builtin').lsp_references()<cr>", { silent = true })

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important

--local builtin = require('telescope.builtin')

require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },

        lsp_handlers = {
            code_action = {
                telescope = require('telescope.themes').get_dropdown({}),
            },
        },
    },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('lsp_handlers')
