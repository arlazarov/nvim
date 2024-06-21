return{
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
				{
				path = '~/vimwiki',
				syntax = 'default',
				ext = '.wiki',
				},
		}
		vim.g.vimwiki_map_prefix = '<leader>w'
		vim.g.vimwiki_camel_case = 0
		vim.g.vimwiki_table_auto_fmt = 1
		vim.g.vimwiki_use_calendar = 1
    end,
}
