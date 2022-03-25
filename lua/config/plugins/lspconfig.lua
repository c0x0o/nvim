local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<leader>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>]', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- format on save, it can be very slow
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")
    -- vim.cmd("autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)")
    -- vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)")
end

local function setup()
    -- enable lsp snips
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }

    -- golang lsp server
    nvim_lsp.gopls.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ["gopls"] = {
                usePlaceholders = true,
            }
        },
        flags = {
            debounce_text_changes = 100,
        }
    }

    -- rust lsp server
    nvim_lsp.rust_analyzer.setup{
        -- see https://github.com/rust-lang/rustup/issues/2411
        cmd = {"rustup", "run", "nightly", "rust-analyzer", },
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
            },
        },
        flags = {
            debounce_text_changes = 100,
        }
    }

    -- c++ lsp server
    nvim_lsp.clangd.setup{
        cmd = { "clangd", "-j", "4", "--background-index", },
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {},
        flags = {
            debounce_text_changes = 100,
        }
    }
    
    -- python language server
    nvim_lsp.pylsp.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {},
        flags = {
            debounce_text_changes = 100,
        }
    }
end

return {
    setup = setup
}
