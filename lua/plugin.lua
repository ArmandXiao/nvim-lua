---- **** Plugins **** ----

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- ** apperance ** --
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    --your statusline
    config = function() require('plugin-config.galaxyline.eviline') end,
    --some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  --use 'vim-airline/vim-airline' -- status line
  --use 'vim-airline/vim-airline-themes'

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

  use {
    -- requires package ripgrep 11.0.0+ or ag
    'pechorin/any-jump.vim'
  }

  -- ** Files ** --
  --use 'preservim/nerdtree'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }


  use {'nvim-telescope/telescope-fzy-native.nvim'}  -- fzy, not fzf, be careful
  use {'gbrlsnchs/telescope-lsp-handlers.nvim'}     -- telescope: extension: lsp-handlers

  -- ** LSP ** --
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  --use 'glepnir/lspsaga.nvim'

  use 'mfussenegger/nvim-jdtls' -- java lsp

  use {   -- auto compeletion
    'hrsh7th/nvim-compe',
    requires = 'hrsh7th/vim-vsnip'

  }

end)

---- **** Configurations **** ----
local keymap = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

-- * Buffer line* ---
require("bufferline").setup{}

keymap('n', '<leader>n', ':BufferLineCycleNext<CR>', { noremap = true })
keymap('n', '<leader>b', ':BufferLineCyclePrev<CR>', { noremap = true })


require('onedark').setup()  -- one dark theme

-- * NerdCommeter * --
keymap('n', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })
keymap('v', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })

-- * NerdTree * --
--keymap('n', '<leader>f', ":NERDTreeToggle<CR>", { noremap = true, silent = true })

-- * Nvim-tree * --
keymap('n', '<leader>f', ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- * Telescope * --
require('plugin-config.telescope')

-- * Any-Jump * --
keymap('n', '<leader>j', ":AnyJump<CR>", { noremap = true, silent = true })

-- * LSP config * --
--require('lsp.lsp-config')
require('lsp.compe-config')
require('plugin-config.lspsaga')
