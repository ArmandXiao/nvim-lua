-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lingao/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/lingao/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/lingao/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/lingao/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lingao/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["any-jump.vim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/any-jump.vim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2@\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0%plugin.config.galaxyline.eviline\frequire\0" },
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nightfox.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "/home/lingao/.local/share/nvim/site/pack/packer/start/wildfire.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0%plugin.config.galaxyline.eviline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end