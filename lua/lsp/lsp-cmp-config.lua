-- Setup nvim-cmp.
local cmp = require("cmp")
local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

cmp.setup({
    mapping = {
      ['<Tab>'] = cmp.select_next_item(),
    },

    sources = {
      -- For ultisnips user.
      { name = 'ultisnips' },

      { name = 'nvim_lsp' },

       --For vsnip user.
      --{ name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },


      { name = 'buffer' },
    }
})
