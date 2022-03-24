local function setup()
    vim.g.gitblame_message_template = '   <author>, <date> • <summary> • <sha>'
    vim.g.gitblame_date_format = '%r'
    vim.g.gitblame_highlight_group = 'Blamer'

    -- do not show blamer in some situation
    vim.cmd([[
    augroup disableblamer
        autocmd!
        autocmd disableblamer WinEnter NvimTree GitBlameDisable 
        autocmd disableblamer BufEnter NvimTree GitBlameDisable 
        autocmd disableblamer BufLeave NvimTree GitBlameEnable
    augroup END
    ]])
end

return {
    setup = setup,
}
