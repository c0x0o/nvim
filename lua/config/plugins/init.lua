local function setup()
    -- load plugins
    require('packer').startup(function(use)
        -- packer should  manage itself
        use 'wbthomason/packer.nvim'

        -- editor
        use 'nvim-lualine/lualine.nvim'
        use 'tpope/vim-surround'
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons',
            }
        }
        use 'windwp/nvim-autopairs'
        use 'preservim/nerdcommenter'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'mattn/emmet-vim'
        use 'ahmedkhalf/project.nvim'
        use 'akinsho/toggleterm.nvim'

        -- git
        use 'airblade/vim-gitgutter'
        use 'f-person/git-blame.nvim'

        -- theme
        use { 'dracula/vim', as = 'dracula', }

        -- lsp
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
    end)

    -- load plugin config
    require('config/plugins/emmet-vim').setup{}
    require('config/plugins/git-blame').setup{}
    require('config/plugins/git-gutter').setup{}
    require('config/plugins/lua-line').setup{}
    require('config/plugins/nerdcommenter').setup{}
    require('config/plugins/nvim-autopairs').setup{}
    require('config/plugins/nvim-tree').setup{}
    require('config/plugins/project').setup{}
    require('config/plugins/telescope').setup{}
    require('config/plugins/terminal').setup{}
    require('config/plugins/lsp').setup{}

    -- load customized plugin
    require('config/plugins/json').setup{}
    require('config/plugins/terminal').setup{}
    require('config/plugins/hex').setup{}

    -- handle some plugin conflict
    require('config/plugins/fix').setup{}
end

return {
    setup = setup,
}
