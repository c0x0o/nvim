-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- display
        {
            "Mofiqul/dracula.nvim",
            lazy = false,
            priority = 1000,
            opts = {
                overrides = function (colors)
                    return {
                        CursorColumn = { bg = colors.selection },
                    }
                end
            },
            config = function(plug, opt)
                require("dracula").setup(opt)
                -- load the colorscheme here
                vim.cmd([[colorscheme dracula]])
            end,
        },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons", config = true },
            config = true,
        },
        -- lang
        {
            "nvim-treesitter/nvim-treesitter",
            lazy = false,
            branch = "main",
            build = ":TSUpdate",
            config = function(plug, opt)
                require("nvim-treesitter").install {
                    "c",
                    "python",
                    "lua",
                    "rust"
                }
            end,
        },
        { "neovim/nvim-lspconfig" },

        -- editor
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true,
            opts = {},
        },
        {
            "kylechui/nvim-surround",
            event = "VeryLazy",
            config = true,
        },
        {
            "lewis6991/gitsigns.nvim",
            opts = {
                current_line_blame = true,
            },
            config = function(plug, opt)
                keymap_opt = { noremap = true, silent = true }
                vim.api.nvim_set_keymap("n", "<Leader>gp", "<Cmd>Gitsigns preview_hunk<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>gb", "<Cmd>Gitsigns blame_line<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd>Gitsigns stage_hunk<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>gr", "<Cmd>Gitsigns reset_hunk<CR>", keymap_opt )
            end,
        },

        -- finder
        {
            "ibhagwan/fzf-lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {},
            config = function(plug, opt)
                require("fzf-lua").setup(opt)
                keymap_opt = { noremap = true, silent = true }
                vim.api.nvim_set_keymap("n", "<Leader>f", "<Cmd>lua FzfLua.files()<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>/", "<Cmd>lua FzfLua.live_grep()<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>p", "<Cmd>lua FzfLua.builtin()<CR>", keymap_opt )
            end,
        }
    },
    rocks = { enable = false },
    install = { colorscheme = { "dracula" } },
    checker = { enabled = true },
})
