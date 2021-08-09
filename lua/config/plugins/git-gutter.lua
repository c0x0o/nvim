local function setup()
    vim.api.nvim_set_keymap('n', '<Leader>}', '<Plug>(GitGutterNextHunk)', {})
    vim.api.nvim_set_keymap('n', '<Leader>{', '<Plug>(GitGutterPrevHunk)', {})
    -- vim.api.nvim_set_keymap('n', 'gs', '<Plug>(GitGutterStageHunk)', {})
    -- vim.api.nvim_set_keymap('n', 'gu', '<Plug>(GitGutterUndoHunk)', {})
    vim.api.nvim_set_keymap('n', '<Leader>p', '<Plug>(GitGutterPreviewHunk)', {})
end

return {
    setup = setup
}
