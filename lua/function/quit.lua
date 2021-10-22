local keymap = vim.api.nvim_set_keymap

local exec = vim.api.nvim_command

function Quit()
    if (string.sub(vim.fn.expand('%'), 1, 4)) == "term" then
        exec("bdelete!")
    else
        exec("q")
    end
end


keymap('n', '<S-q>', ":lua Quit()<CR>" , {noremap = true})
keymap('n', '<C-q>', ":lua Quit()<CR>" , {noremap = true})
