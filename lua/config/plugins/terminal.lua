require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.33
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.33
        end
    end,
    start_in_insert = true,
}

function _G.my.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

local function setup()

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua my.set_terminal_keymaps()')
    vim.cmd('autocmd! TermEnter term://* startinsert')
    -- setup key mapping
    vim.api.nvim_set_keymap('n', '<C-c>', ':ToggleTerm direction=horizontal<CR>', {noremap = true, silent = true})
end

return {
    setup = setup,
}
