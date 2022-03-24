local utils = require('utils')

local function get_default_vim_option() 
    return {
        fenc = 'utf-8',
        termguicolors = true,
        updatetime = 200,
        list = true,
        listchars = 'lead:·,trail:·,tab:>·',
        history = 2000,
        autoread = true,
        shortmess = 'atI',
        backup = false,
        swapfile = false,
        cursorcolumn = true,
        cursorline = true,
        title = true,
        visualbell = false,
        errorbells = false,
        tm = 1000,
        magic = true,
        backspace = 'eol,start,indent',
        whichwrap = 'b,s,<,>,h,l',
        ruler = true,
        showcmd = true,
        showmode = true,
        hlsearch = true,
        incsearch = true,
        ignorecase = true,
        smartcase = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
        expandtab = true,
        smarttab = true,
        shiftround = true,
        smartindent = true,
        autoindent = true,
        completeopt = 'menuone,noselect',
        number = true,
        relativenumber = true,
        encoding = 'utf-8',
        ffs = 'unix,dos,mac',
        splitbelow = true,
        splitright = true,
        background = 'dark',
        scrolloff = 20,
        sidescrolloff = 15,
        showtabline = 0,
        wrap = false,
        colorcolumn = '80'
    }
end

local function setup(opt)
    -- merge user option
    option = utils.deep_merge(get_default_vim_option(), opt)

    -- setup vim option
    utils.merge(vim.o, option)

    -- setup leader key
    vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true })
    vim.g.mapleader = ' '

    -- default key mapping
    vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
    vim.api.nvim_set_keymap('n', 'J', '10j', { noremap = true })
    vim.api.nvim_set_keymap('n', 'K', '10k', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader>x', ':split<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader>/', ':nohls<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>b', ':ls<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader><', ':cp<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader>>', ':cn<CR>', { noremap = true })

    -- some command that nvim not support api operation yet
    vim.cmd('syntax on')
    vim.cmd('filetype plugin indent on')

    -- line number toggle
    vim.cmd([[
    augroup numbertoggle
        autocmd!
        autocmd InsertLeave * set number relativenumber
        autocmd InsertEnter * set number norelativenumber
    augroup END
    ]])

    -- cursor toggle
    vim.cmd([[
    augroup cursortoggle
        autocmd!
        autocmd BufLeave * set cursorcolumn! cursorline!
        autocmd BufEnter * set cursorcolumn cursorline
    augroup END
    ]])

    -- GUI Copy mode
    -- it may help when you are working over ssh connection 
    vim.cmd([[
    function EnterGUICopyMode()
        " remove line number
        set nu!
        set relativenumber!
        set signcolumn=no
        set nolist
        " close nvim-tree
        execute 'NvimTreeClose' 
        " close git-blamer
        execute 'GitBlameDisable'
    endfunction
    command -nargs=* GUICopy execute "call EnterGUICopyMode()"

    function ExitGUICopyMode()
        " remove line number
        set nu
        set relativenumber
        set signcolumn=auto
        set list
        " close nvim-tree
        " close nvim-tree
        execute 'NvimTreeOpen' 
        " close git-blamer
        execute 'GitBlameEnable'
    endfunction
    command -nargs=* GUICopyEnd execute "call ExitGUICopyMode()"
    ]])
end

return {
    setup = setup,
}
