local function setup()
    -- do not let stabs bind <tab> <cr>
    -- we will handle it in fix.lua
    vim.g.stabs_maps = 'boO='
end

return {
    setup = setup,
}
