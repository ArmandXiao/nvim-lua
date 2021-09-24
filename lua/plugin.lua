---- **** Plugins **** ----

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- ** apperance ** --
--[[
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'galaxyline.spaceline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
--]]

  use 'vim-airline/vim-airline' -- status line
  use 'vim-airline/vim-airline-themes'

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  } -- buffer line

  use 'ful1e5/onedark.nvim' -- theme

  -- ** Functions ** --
  use 'gcmt/wildfire.vim' -- select in pattern
  use 'tpope/vim-surround'
  --use 'easymotion/vim-easymotion'
  use 'preservim/nerdcommenter' -- lazy commenter

  use 'junegunn/vim-peekaboo' -- check buffers

  -- ** Files ** --
  use 'preservim/nerdtree'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  

end)

---- **** Configurations **** ----
local keymap = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

-- * Buffer line* ---
require("bufferline").setup{ 
  options = {
    show_buffer_icons = false,
    show_buffer_close_icons = false
  }
}

keymap('n', '<leader>n', ':BufferLineCycleNext<CR>', { noremap = true })
keymap('n', '<leader>b', ':BufferLineCyclePrev<CR>', { noremap = true })


require('onedark').setup()  -- one dark theme

-- * NerdCommeter * --
keymap('n', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })
keymap('v', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })

-- * NerdTree * --
keymap('n', '<leader>f', ":NERDTreeToggle<CR>", { silent = true})

-- * Telescope * --
keymap('n', '<leader><leader>f', "<cmd>lua require('telescope.builtin').find_files()<cr>", { silent = true })
keymap('n', '<leader><leader>g', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { silent = true })
keymap('n', '<leader><leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })
