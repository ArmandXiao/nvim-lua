--- *** Bootstrapper *** ----
local fn = vim.fn

-- Automatically install packer.nvim
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim when change this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
  augroup end
]]

-- Auto check whether packer compiled file is missing
local compile_path = fn.stdpath('config') .. '/plugin/packer_compiled.lua'
if fn.empty(fn.glob(compile_path)) > 0 then
  vim.cmd [[packadd packer.nvim]]
  --vim.cmd [[PackerCompile]]
  --vim.cmd [[PackerSync]]
end

---- **** Packer Configs **** ----
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local util = require('plugin.config.packer.util')

packer.init({
  -- making packer a floating window
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  -- customize packer compile path
  --compile_path = util.join_paths(vim.fn.stdpath('config') , 'lua/plugin/config/packer' , 'packer_compiled.lua')
})

packer.reset()

---- **** Plugins **** ----
packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- ** Optimazition ** --
  use {'lewis6991/impatient.nvim'}

  -- ** apperance ** --
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    --your statusline
    config = function() require('plugin.config.galaxyline.eviline') end,
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
  --use 'simrat39/symbols-outline.nvim'
  use {
      'preservim/tagbar'
      -- require ctags in path
      -- sudo Pacman -S ctags
  }

  use 'liuchengxu/vim-which-key'

  -- * Navigation * --
  use {
  'phaazon/hop.nvim',
  branch = 'v1', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}
  --use 'ggandor/lightspeed.nvim'
  --use 'easymotion/vim-easymotion'

  use 'preservim/nerdcommenter' -- lazy commenter
  use 'junegunn/vim-peekaboo' -- check buffers
  use {
    -- requires package ripgrep 11.0.0+ or ag
    'pechorin/any-jump.vim'
  }
  --use 'rhysd/vim-clang-format'
  use 'mhartington/formatter.nvim'  -- require .clang-formatter, can download throught python -m install pip clang-format


  -- ** Files ** --
  --use 'preservim/nerdtree'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    event="VimEnter"    -- lazyload
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  use {'nvim-telescope/telescope-fzy-native.nvim'}  -- fzy, not fzf, be careful
  use {'gbrlsnchs/telescope-lsp-handlers.nvim'}     -- telescope: extension: lsp-handlers


  use {
      'plasticboy/vim-markdown',
      requires = 'godlygeek/tabular'
  }

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
        'romgrk/nvim-treesitter-context',
        'p00f/nvim-ts-rainbow'          -- ranbow brackets
    },

    run = ':TSUpdate'
  }

  -- debugger
  use 'puremourning/vimspector'

  -- Snippet --
  use 'honza/vim-snippets'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)

---- **** Configurations **** ----
local keymap = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

-- * which key * --
require('plugin.config.whichkey')

-- * Buffer line* ---
require("bufferline").setup{
    options = {
        separator_style = "slant",
        name_formatter = nil
    }
}

keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true })
keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true })

--require('onedark').setup()  -- one dark theme
require('nightfox').load("duskfox")

-- * NerdCommeter * --
keymap('n', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })
keymap('v', '?', ':call nerdcommenter#Comment(0, "toggle")<CR>', { silent = true })

-- * formatter.nvim * --
--keymap('n', '<A-K>', ':Format<CR>', {noremap = true, silent = true})
require('plugin.config.formatter.setup')

-- * Hop * --
--require'hop'.setup()
keymap('n', 'f', ':HopChar2<CR>', { silent = true })
keymap('n', 'F', ':HopPattern<CR>', { silent = true })

-- * NerdTree * --
--keymap('n', '<leader>f', ":NERDTreeToggle<CR>", { noremap = true, silent = true })

-- * tagbar * --
keymap('n', '<leader>F', ":TagbarToggle<CR>", { noremap = true, silent = true })

-- * Nvim-tree * --
keymap('n', '<leader>f', ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- * Telescope * --
--require('plugin.config.telescope')

-- * Any-Jump * --
keymap('n', '<leader>j', ":AnyJump<CR>", { noremap = true, silent = true })

-- * LSP config * --
--require('lsp.lsp-config')
require('lsp.lsp-cmp-config')

vim.g.UltiSnipsJumpForwardTrigger=";j"
vim.g.UltiSnipsJumpBackwardTrigger=";k"

require('lsp.lsp-signature-config')
--require('plugin.config.lspsaga')

--- ** treesitter ** ---
require('plugin.config.treesitter.setup')
