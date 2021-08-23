require("tabset").setup({
    defaults = {
		tabwidth = 4,
		expandtab = false
    },
    languages = {
		markdown = {
			expandtab = true,
		},
        {
            filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
            config = {
                tabwidth = 2,
                expandtab = true
            }
        }
    }
})
