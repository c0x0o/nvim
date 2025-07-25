local vim_opts = {
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
  colorcolumn = '80',
  mouse = '',
}

-- Setup vim options
for k,v in pairs(vim_opts) do vim.o[k] = v end

-- Make your finger happy
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '

-- Window management
vim.api.nvim_set_keymap('n', '<C-w>s', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>v', ':vsplit<CR>', { noremap = true })
