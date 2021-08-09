local function setup()
	vim.g.gitblame_message_template = '   <author>, <date> • <summary> • <sha>'
	vim.g.gitblame_date_format = '%r'
end

return {
	setup = setup,
}
