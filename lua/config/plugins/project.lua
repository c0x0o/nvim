local function setup()
    require("project_nvim").setup{
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        exclude_dirs = {},
    }
end

return {
    setup = setup,
}
