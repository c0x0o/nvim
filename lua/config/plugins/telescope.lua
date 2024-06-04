local function setup()
    vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
    vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('telescope.builtin').live_grep{only_sort_text=true}<cr>", {})
end

return {
    setup = setup,
}
