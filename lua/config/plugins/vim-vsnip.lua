local function setup()
    vim.api.nvim_set_keymap('i', '<C-e>', "vsnip#expandable()?'<Plug>(vsnip-expand)':'<C-e>'", { silent = true, expr = true })
    vim.api.nvim_set_keymap('s', '<C-e>', "vsnip#expandable()?'<Plug>(vsnip-expand)':'<C-e>'", { silent = true, expr = true })
    vim.api.nvim_set_keymap('n', 's', "<Plug>(vsnip-select-text)<ESC>", { silent = true })
    vim.api.nvim_set_keymap('x', 's', "<Plug>(vsnip-select-text)<ESC>", { silent = true })
end

return {
    setup = setup
}
