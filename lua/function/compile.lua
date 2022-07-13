local keymap = vim.api.nvim_set_keymap

local exec = vim.api.nvim_command

function CompileRun()
    if vim.bo.filetype == 'c' then
        exec("!gcc % && ./a.out")
        exec("!time ./%")
    elseif vim.bo.filetype == 'cpp' then
        exec("set splitbelow")
        exec("!g++ % -Wall -o %<")
        exec("sp")
        exec("res -15")
        exec("term ./%<")
    elseif vim.bo.filetype == 'java' then
        exec("set splitbelow")
        exec("sp")
        exec("res -5")
        exec("term javac % && time java %<")
    elseif vim.bo.filetype == 'sh' then
        exec("!time bash %")
    elseif vim.bo.filetype == 'python' then
        exec("set splitbelow")
        exec("sp")
        exec("term python3 %")
    -- rlanguage
    elseif vim.bo.filetype == ('R' or 'r') then
        exec("set splitbelow")
        exec("sp")
        exec("term Rscript %")
    end
end


keymap('n', 'R', ":lua CompileRun()<CR>" , {noremap = true})
