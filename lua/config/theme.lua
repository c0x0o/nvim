local function setup()
    vim.cmd('colorscheme dracula')

    vim.cmd('highlight! Blamer ctermbg=238 guibg=#424450 ctermfg=61 guifg=#6272A4')
    vim.cmd('highlight! BlamerNoHL ctermfg=61 guifg=#6272A4')
    vim.cmd('highlight! link NvimTreeGitDirty DiffChange')
    vim.cmd('highlight! link NvimTreeGitNew DiffAdd')
end

return {
    setup = setup
}
