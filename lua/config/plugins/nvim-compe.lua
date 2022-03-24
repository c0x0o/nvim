require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        vsnip = true;
        nvim_lsp = true;
        nvim_lua = true;
    };
}

local function setup()
    -- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent = true, noremap = true})
    -- vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true, silent = true})
    -- vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {expr = true, silent = true, noremap = true})
    -- vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {expr = true, silent = true, noremap = true})
end

return {
    setup = setup,
}
