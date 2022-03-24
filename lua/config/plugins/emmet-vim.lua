local function setup()
    vim.g.user_emmet_leader_key = '<C-e>'
    vim.g.user_emmet_install_global = 0
    vim.cmd([[
    autocmd FileType xml,html,css EmmetInstall
    ]])
end

return {
    setup = setup
}
