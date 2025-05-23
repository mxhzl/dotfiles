return {
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{ path = "~/notes", syntax = "markdown", ext = ".txt" },
			}
			vim.g.vimwiki_ext2syntax =
				{ [".md"] = "markdown", [".markdown"] = "markdown", [".mdown"] = "markdown", [".txt"] = "markdown" }
			vim.g.vimwiki_use_mouse = 1
			vim.g.vimwiki_markdown_link_ext = 1
			vim.g.vimwiki_global_ext = 0
		end,
	},
}
