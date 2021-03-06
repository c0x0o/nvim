local function setup()
    require'nvim-tree'.setup {
        disable_netrw = true,  -- 1 by default, disables netrw
        hijack_netrw = true, -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
        open_on_setup = false, -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
        create_in_closed_folder = true,
        open_on_tab = false, -- 0 by default, will open the tree when entering a new tab and the tree was previously open
        hijack_cursor = false, -- 1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
        diagnostics = {
            enable = true,
            icons = {
                hint = '',
                info = '',
                warning = '',
                error = ''
            }
        },
        update_cwd = true, -- 1 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
        -- hijacks new directory buffers when they are opened.
        ignore_ft_on_setup = { 'startify', 'dashboard', 'DiffviewFiles', 'terminal', 'packer' }, -- empty by default, don't auto open tree on specific filetypes.
        update_focused_file = {
            enable = false, -- 0 by default, this option allows the cursor to be updated when entering a buffer
            update_cwd = true, -- 1 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
            ignore_list = {}
        },
        view = {
            side = 'left', -- left by default
            width = 40, -- 30 by default
        },
        filters = {
            dotfiles = false,
            custom = { '.git', 'node_modules', '.cache' }
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 500,
        },
        renderer = {
            indent_markers = {
                enable = true,
            },
            icons = {
                padding = ' ',
                show = {
                    git = true,
                    folder = true,
                    file = true,
                    folder_arrow = true,
                },
                glyphs = {
                    default = '',
                    symlink = '',
                    git = {
                        unstaged = '*',
                        staged = '✓',
                        unmerged = '',
                        renamed = '➜',
                        untracked = '+',
                        deleted = '-',
                        ignored = '◌'
                    },
                    folder = {
                        arrow_open = '',
                        arrow_closed = '',
                        default = '',
                        open = '',
                        empty = '',
                        empty_open = '',
                        symlink = '',
                        symlink_open = '',
                    },
                },
            },
            highlight_git = true,
            group_empty = true,
            add_trailing = true,
            highlight_opened_files = 'icon',
            root_folder_modifier = ':~',
            special_files = {'README.md', 'Makefile', 'MAKEFILE', 'Cargo.toml'},
        },
        actions = {
            change_dir = {
                global = false,
            },
            open_file = {
                resize_window = true,
                quit_on_open = true,
                window_picker = {
                    enable = true,
                    exclude = {
                        filetype = {
                            'packer',
                            'qf'
                        },
                        buftype = {
                            'terminal'
                        }
                    },
                },
            },
        },
    }

    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true})
end

return {
    setup = setup,
}
