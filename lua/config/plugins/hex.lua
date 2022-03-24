local function to_hex_view(buf)
    vim.api.nvim_exec("%!xxd", false)
end

local function from_hex_view(buf)
    vim.api.nvim_exec("%!xxd -r", false)
end

local function setup()
    _G.my.to_hex_view = to_hex_view 
    _G.my.from_hex_view = from_hex_view

    vim.cmd([[
    command -nargs=0 HexView lua my.to_hex_view()
    command -nargs=0 HexViewEnd lua my.from_hex_view()
    ]])
end

return {
    setup = setup
}
