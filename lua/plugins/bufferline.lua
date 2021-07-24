require("bufferline").setup({
	options = {
        tab_size = 20,
        diagnostics = "nvim_lsp",
        offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}},
        show_tab_indicators = true,
        separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false,
        always_show_bufferline = true
    }
})

