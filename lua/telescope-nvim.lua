-- default values
local tl = require("telescope")

tl.setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git",
		},
	},
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg"
        }
    }
}

tl.load_extension("media_files")

-- mappings

local opt = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>fm", ":Telescope media_files<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>fc", ":Telescope commands<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>ft", ":TodoTelescope<CR>", opt)

