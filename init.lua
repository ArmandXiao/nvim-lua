-- * otimazation * --
local status_ok, impatient = pcall(require, "impatient")
if status_ok then
    impatient.enable_profile()
end

-- * essentials * --
require "plugin"
require "config"

-- * functions * --
require "function"

--- * LSP * ---
local lsp_ok, _ = pcall(require, "lspconfig")
if lsp_ok then
  require "lsp.lsp-setup"
end
