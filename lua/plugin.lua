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

  --use 'ful1e5/onedark.nvim' -- theme
  --use '/onedark.nvim' -- theme
  use 'EdenEast/nightfox.nvim'


  -- ** Functions ** --
  use 'gcmt/wildfire.vim' -- select in pattern
  use 'tpope/vim-surround'
  use 'simrat39/symbols-outline.nvim'

  --use 'easymotion/vim-easymotion'
  use 'preservim/nerdcommenter' -- lazy commenter
  use 'junegunn/vim-peekaboo' -- check buffers
  use {
    -- requires package ripgrep 11.0.0+ or ag
    'pechorin/any-jump.vim'
  }
  --use 'rhysd/vim-clang-format'
  use 'mhartington/formatter.nvim'  -- require .clang-formatter, can download throught python -m install pip clang-formatter


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
    'hrsh7th/nvim-cmp',
    requires = {
        --'hrsh7th/vim-vsnip',
        'SirVer/ultisnips',
        'quangnguyen30192/cmp-nvim-ultisnips',  -- ultisnips source
        'honza/vim-snippets',    -- Snippet engine

        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-look',

        'ray-x/lsp_signature.nvim'
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
        'romgrk/nvim-treesitter-context'
    },
    run = ':TSUpdate'
  }

  -- Snippet --
  use 'honza/vim-snippets'

end)

---- **** Configurations **** ----
local keymap = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

-- * Buffer line* ---
require("bufferline").setup{}

keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true })
keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true })

--require('onedark').setup()  -- one dark theme
require('nightfox').load(duskfox)

-- * NerdCommeter * --
keymap('n', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })
keymap('v', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })

-- * formatter.nvim * --
keymap('n', '<A-S-K>', ':Format<CR>', {noremap = true, silent = true})
require('plugin-config.formatter.setup')

-- * NerdTree * --
--keymap('n', '<leader>f', ":NERDTreeToggle<CR>", { noremap = true, silent = true })

-- * symbols-outline.nvim * --
keymap('n', '<leader>F', ":SymbolsOutline<CR>", { noremap = true, silent = true })

-- * Nvim-tree * --
keymap('n', '<leader>f', ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- * Telescope * --
require('plugin-config.telescope')

-- * Any-Jump * --
keymap('n', '<leader>j', ":AnyJump<CR>", { noremap = true, silent = true })

-- * LSP config * --
--require('lsp.lsp-config')
require('lsp.lsp-cmp-config')

vim.g.UltiSnipsJumpForwardTrigger=";j"
vim.g.UltiSnipsJumpBackwardTrigger=";k"

require('lsp.lsp-signature-config')
--require('plugin-config.lspsaga')

--- ** treesitter ** ---
require('plugin-config.treesitter.setup')
