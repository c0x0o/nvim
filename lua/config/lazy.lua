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
        {
            "neovim/nvim-lspconfig",
            config = function(plug, opt)
                keymap_opt = { noremap = true, silent = true }
                vim.lsp.enable("rust_analyzer")
                vim.lsp.enable("pylsp")
                vim.lsp.enable("clangd")
                vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", keymap_opt )
            end,
        },
        {
            'saghen/blink.cmp',
            version = '1.*',
            opts = {
                -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                -- 'super-tab' for mappings similar to vscode (tab to accept)
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- All presets have the following mappings:
                -- C-space: Open menu or open docs if already open
                -- C-n/C-p or Up/Down: Select next/previous item
                -- C-e: Hide menu
                -- C-k: Toggle signature help (if signature.enabled = true)
                --
                -- See :h blink-cmp-config-keymap for defining your own keymap
                keymap = { preset = 'enter' },
                appearance = {
                    nerd_font_variant = 'mono'
                },
                completion = { documentation = { auto_show = false } },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" }
            },
            opts_extend = { "sources.default" }
        },

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
            opts = {},
            config = function(plug, opt)
                require("gitsigns").setup(opt)

                keymap_opt = { noremap = true, silent = true }
                vim.api.nvim_set_keymap("n", "<Leader>gp", "<Cmd>Gitsigns preview_hunk<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>gb", "<Cmd>Gitsigns blame_line<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd>Gitsigns stage_hunk<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>gr", "<Cmd>Gitsigns reset_hunk<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>g[", "<Cmd>Gitsigns nav_hunk prev<CR>", keymap_opt )
                vim.api.nvim_set_keymap("n", "<Leader>g]", "<Cmd>Gitsigns nav_hunk next<CR>", keymap_opt )
            end,
        },

        -- finder
        {
            "ibhagwan/fzf-lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
                fzf_colors = { true },
            },
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
    checker = { enabled = false },
})
