local function setup()
	vim.cmd('colorscheme dracula')

	vim.cmd('highlight! link NvimTreeGitDirty DiffChange')
	vim.cmd('highlight! link NvimTreeGitNew DiffAdd')
end

return {
	setup = setup
}
