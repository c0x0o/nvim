local function json_beautify()
    vim.api.nvim_exec("%!jq --tab '.'", false)
end

local function json_uglify()
    vim.api.nvim_exec("%!jq -c '.'", false)
end

local function setup()
    _G.my.json_beautify = json_beautify
    _G.my.json_uglify = json_uglify

    vim.cmd([[
    command -nargs=0 JSONBeautify lua my.json_beautify()
    command -nargs=0 JSONUglify lua my.json_uglify()
    ]])
end

return {
    setup = setup
}
