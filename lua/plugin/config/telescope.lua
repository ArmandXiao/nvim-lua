-- * Key remapping * --
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>,', "<cmd>lua require('telescope.builtin').find_files()<cr>", { silent = true })
keymap('n', '<leader><leader>F', "<cmd>lua require('telescope.builtin').file_browser()<cr>", { silent = true })
keymap('n', '<leader><leader>g', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { silent = true })
keymap('n', '<leader><leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
local status_ok, telescope = pcall(require, "packer")

if not status_ok then
    return
end

telescope.setup {
extensions = {
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    }
}
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzy_native')
telescope.load_extension('lsp_handlers')
