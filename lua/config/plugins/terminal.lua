local term

local function get_window_option()
    local ui = vim.api.nvim_list_uis()[1]
    return {
        relative = 'editor',
        border = 'rounded',
        style = 'minimal',
        anchor = 'NW',
        width = math.floor(ui.width * 0.8),
        height = math.floor(ui.height * 0.8),
        col = (ui.width - ui.width * 0.8) / 2,
        row = (ui.height - ui.height * 0.8) / 2,
    }
end

local function open_terminal_window()
    if term == nil then
        local term_buffer = vim.api.nvim_create_buf(false, true)
        local term_window, _ = vim.api.nvim_open_win(term_buffer, true, get_window_option())

        vim.api.nvim_command('terminal')

        term = {
            buffer = term_buffer,
            window = term_window,
            displayed = false,
        }

        vim.api.nvim_buf_set_keymap(term.buffer, 't', '<Esc>', '<c-\\><c-n>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.buffer, 'n', '<Esc>', ':lua my.hide_terminal_window()<CR>', {noremap = true, silent = true})
    else
        term.window, _ = vim.api.nvim_open_win(term.buffer, true, get_window_option())
    end

    vim.api.nvim_command('startinsert')
    term.displayed = true
end

local function hide_terminal_window()
    if term ~= nil and term.displayed then
        vim.api.nvim_win_hide(term.window)
        term.displayed = false
    end
end

local function toggle_terminal_window()
    if term == nil or not term.displayed then
        open_terminal_window()
    else
        hide_terminal_window() 
    end
end

local function close_terminal_window()
    hide_terminal_window() 
    term = nil
end

local function setup()
    -- global function
    _G.my.toggle_terminal_window = toggle_terminal_window
    _G.my.close_terminal_window = close_terminal_window
    _G.my.hide_terminal_window = hide_terminal_window
    _G.my.open_terminal_window = open_terminal_window

    -- setup key mapping
    vim.api.nvim_set_keymap('n', '<C-c>', ':lua my.toggle_terminal_window()<CR>', {noremap = true, silent = true})
    vim.cmd([[
    augroup MyTerminal
    autocmd!
    autocmd MyTerminal TermClose * lua my.close_terminal_window()
    augroup END
    ]])
end

return {
    setup = setup,
    toggle = toggle_terminal_window,
}
