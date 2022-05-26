local keymap = vim.api.nvim_set_keymap
local exec = vim.api.nvim_command

function TogglePasteMode()
    exec("set pastetoggle")
end


keymap('n', '<space>p', ":lua TogglePasteMode()<CR>" , {noremap = true})
