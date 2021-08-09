local function setup()
    -- load plugins
    require('packer').startup(function(use)
        -- packer should  manage itself
        use 'wbthomason/packer.nvim'

        -- editor
        use { 'glepnir/galaxyline.nvim', branch = 'main' }
        use 'tpope/vim-surround'
        use 'airblade/vim-rooter'
        use 'kyazdani42/nvim-tree.lua'
        use 'windwp/nvim-autopairs'
        use 'preservim/nerdcommenter'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'Thyrum/vim-stabs'

        -- git
        use 'airblade/vim-gitgutter'
        use 'f-person/git-blame.nvim'
		use 'sindrets/diffview.nvim'

        -- theme
        use 'kyazdani42/nvim-web-devicons'
        use { 'dracula/vim', as = 'dracula', }

        -- lsp
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-compe'
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
    end)

    -- load plugin config
    require('config/plugins/galaxyline').setup{}
    require('config/plugins/diffview').setup{}
    require('config/plugins/git-blame').setup{}
    require('config/plugins/git-gutter').setup{}
    require('config/plugins/lspconfig').setup{}
    require('config/plugins/nerdcommenter').setup{}
    require('config/plugins/nvim-autopairs').setup{}
    require('config/plugins/nvim-compe').setup{}
    require('config/plugins/nvim-tree').setup{}
    require('config/plugins/telescope').setup{}
    require('config/plugins/vim-stabs').setup{}
    require('config/plugins/vim-vsnip').setup{}
	
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
