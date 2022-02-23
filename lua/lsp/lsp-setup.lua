local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  virtual_text = {}

  virtual_text.show = true

  virtual_text.toggle = function()
      virtual_text.show = not virtual_text.show
      vim.lsp.diagnostic.display(
          vim.lsp.diagnostic.get(0, 1),
          0,
          1,
          {virtual_text = virtual_text.show}
      )
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'M', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space><enter>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)    -- use telescope one instead
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>de', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<Cmd>lua virtual_text.toggle()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --buf_set_keymap('n', '<A-S-k>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'clangd'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

------------ Setup Mannually ----------------
--require 'lspconfig'.pyright.setup{on_attach = config_.on_attach}       -- python
--require 'lspconfig'.clangd.setup{on_attach = on_attach}         -- clangd
--require 'lsp.java.jdtls-config'.setup()   -- java - full functionality

-- ** Java ** --
-- this one is jdtls not nvim-jdtls
require'lspconfig'.jdtls.setup{
    -- Enable signature
    settings = {
        java = {
            signature_help = { enable = true };
            contentProvider = { preferred = 'fernflower'}
        }
    },
    on_init = function(client)
      if client.config.settings then
        client.notify('workspace/didChangeConfiguration', {settings = client.config.settings})
      end
    end,

    cmd = { 'jdtls' },
    on_attach = on_attach,
    root_dir = function(fname)
        return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
    end

}

-- ** Lua ** --
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
--local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'

-- uncomment below
--local sumneko_root_path = "/home/lingao/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server"
--local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

--local runtime_path = vim.split(package.path, ';')
--table.insert(runtime_path, "lua/?.lua")
--table.insert(runtime_path, "lua/?/init.lua")

--require'lspconfig'.sumneko_lua.setup {
  --cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  --settings = {
    --Lua = {
      --runtime = {
        ---- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        --version = 'LuaJIT',
        ---- Setup your lua path
        --path = runtime_path,
      --},
      --diagnostics = {
        ---- Get the language server to recognize the `vim` global
        --globals = {'vim'},
      --},
      --workspace = {
        ---- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file("", true),
      --},
      ---- Do not send telemetry data containing a randomized but unique identifier
      --telemetry = {
        --enable = false,
      --},
    --},
  --},
--}
