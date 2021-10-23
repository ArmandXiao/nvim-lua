local keymap = vim.api.nvim_set_keymap
local exec = vim.api.nvim_command

-- set fold method --
vim.o.foldmethod = 'expr'
--vim.o.foldexpr = 'nvim_treesitter#foldexpr()'  -- with presence of treesitter
vim.o.foldlevel = 99

function FoldByTreeSitter()
    vim.o.foldexpr = 'nvim_treesitter#foldexpr()'  -- with presence of treesitter
    if (vim.bo.filetype == 'c' or vim.bo.filetype == 'cpp' or vim.bo.filetype == "py") then
        exec("set foldlevel=0")
    elseif (vim.bo.filetype == 'java') then
        exec("set foldlevel=2")
    end
end


function ToggleFold()
    if (vim.o.foldlevel < 10 ) then
        exec("set foldlevel=99")
    else
        FoldByTreeSitter()
    end
end

keymap('n', 'zf', ":lua ToggleFold()<CR>", {noremap = true, silent = true })
