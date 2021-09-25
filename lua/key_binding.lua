-- rename the api
-- vim.api.nvim_set_keymap({mode}, {keymap}. {mapped to}, {options})
local keymap = vim.api.nvim_set_keymap
local noremap_true = { noremap = true }

--- *** KEYBOARD *** ---
vim.g.mapleader = ' '

-- ** Navigation ** --
keymap('n', 'J', '5j', {noremap = true})
keymap('v', 'J', '5j', {noremap = true})
keymap('n', 'K', '5k', {noremap = true})
keymap('v', 'K', '5k', {noremap = true})

keymap('n', 'L', '$', {noremap = true})
keymap('v', 'L', '$', {noremap = true})
keymap('n', 'H', '^', {noremap = true})
keymap('v', 'H', '^', {noremap = true})

-- ** Operations ** --
keymap('i', 'jk', '<ESC>', {}) -- escape

keymap('n', '<leader><leader>r', ':source %<CR>', {noremap = true}) -- source code

keymap('n', '<C-s>', ':w<CR>', {}) -- save
keymap('n', '<C-q>', ':q<CR>', {}) -- exit
keymap('n', '<S-q>', ':q<CR>', {})

-- ** Indentation ** --
--keymap('n', '<', '<<', {noremap = true})
--keymap('n', '>', '>>', {noremap = true})

-- ** Functions ** --
keymap('n', '<C-a>', ':ggVG', {noremap = true}) -- set Ctrl+a as select all
keymap('n', '<leader>a', '<C-a>', {noremap = true}) -- auto increment
keymap('v', '<leader>a', '<C-a>', {noremap = true})

keymap('n', '<leader>,', ':nohl<CR>', {noremap = true, silent = true})
keymap('n', 'cp', ':set spell spelllang=en_us<CR>', {noremap = true})

--- *** Wkndows *** ---

-- ** Split ** --
keymap('n', '<LEADER><LEADER>l', ':set splitright<CR>:vsplit<CR>', {noremap = true, silent = true})
keymap('n', '<kEADER><LEADER>h', ':set nosplitright<CR>:vsplit<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER><LEADER>k', ':set nosplitbelow<CR>:split<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER><LEADER>j', ':set splitbelow<CR>:split<CR>', {noremap = true, silent = true})

-- ** Focus ** --
keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- ** Resize ** --
keymap('n', '<up>', ':res +5<CR>', {noremap = true, silent = true})
keymap('n', '<down>', ':res -5<CR>', {noremap = true, silent = true})
keymap('n', '<left>', ':vertical resize+5<CR>', {noremap = true, silent = true})
keymap('n', '<right>', ' :vertical resize-5<CR>', {noremap = true, silent = true})

-- ** Buffer Control ** --
keymap('n', 'te', ':tabe<CR>', {noremap = true, silent = true})
keymap('n', 'th', ':-tabnext<CR>', {noremap = true, silent = true})
keymap('n', 'tl', ':+tabnext<CR>', {noremap = true, silent = true})

keymap('n', '<LEADER>1', ':b 1<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>2', ':b 2<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>3', ':b 3<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>4', ':b 4<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>5', ':b 5<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>6', ':b 6<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>7', ':b 7<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>8', ':b 8<CR>', {noremap = true, silent = true})
keymap('n', '<LEADER>9', ':b 9<CR>', {noremap = true, silent = true})
