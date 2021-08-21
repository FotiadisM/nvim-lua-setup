local nvim_set_keymap = vim.api.nvim_set_keymap

nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true})
nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true })

local opt = { noremap = true, silent = true}

-- fix vim weird behavior
nvim_set_keymap("n", "Y", "y$", {})

-- close current buffer and jump to the previous one
nvim_set_keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opt)

-- moving between windows
nvim_set_keymap("n", "<C-h>", "<C-w>h", opt)

nvim_set_keymap("n", "<C-j>", "<C-w>j", opt)
nvim_set_keymap("n", "<C-k>", "<C-w>k", opt)
nvim_set_keymap("n", "<C-l>", "<C-w>l", opt)

-- resizing windows
nvim_set_keymap("n", "<C-Up>", ":resize +3<CR>", opt)
nvim_set_keymap("n", "<C-Down>", ":resize -3<CR>", opt)
nvim_set_keymap("n", "<C-Left>", ":vertical resize +3<CR>", opt)
nvim_set_keymap("n", "<C-Right>", ":vertical resize -3<CR>", opt)

-- copy to clipboard
nvim_set_keymap("", "<C-c>", "\"+y", opt)

-- disable ex mode
nvim_set_keymap("n", "Q", "<nop>", opt)
nvim_set_keymap("n", "q:", "<nop>", opt)

-- toggle spelling
nvim_set_keymap("n", "<leader>s", ":set spell!<CR>", opt)

-- misc
nvim_set_keymap("n", "<space>j", "o<ESC>", opt)
nvim_set_keymap("n", "<space>k", "o<ESC>k", opt)

-- Plugins

-- nvim-tree
nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<CR>", opt)

-- telescope
nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", opt)
nvim_set_keymap("n", "<leader>fm", ":Telescope media_files<CR>", opt)
nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
nvim_set_keymap("n", "<leader>fc", ":Telescope commands<CR>", opt)
nvim_set_keymap("n", "<leader>fb", ":Telescope builtin<CR>", opt)
nvim_set_keymap("n", "<leader>fd", ":Telescope find_files cwd=~/.config/nvim<CR>", opt)

-- bufferline
nvim_set_keymap("n", "L", ":BufferLineCycleNext<CR>", opt)
nvim_set_keymap("n", "<space>l", ":BufferLineMoveNext<CR>", opt)
nvim_set_keymap("n", "H", ":BufferLineCyclePrev<CR>", opt)
nvim_set_keymap("n", "<space>h", ":BufferLineMovePrev<CR>", opt)

-- nvim-toggleterm
nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", opt)
nvim_set_keymap("n", "<leader>T", ":ToggleTerm direction='float'<CR>", opt)

-- nvim-comment
nvim_set_keymap("n", "<leader>c", ":CommentToggle<CR>", opt)
nvim_set_keymap("v", "<leader>c", ":CommentToggle<CR>", opt)

-- nvim-spectre
nvim_set_keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", opt)

-- todo-comments
nvim_set_keymap("n", "<leader>wt", ":TodoQuickFix<CR>", opt)

-- trouble
nvim_set_keymap("n", "<leader>ww", ":LspTroubleWorkspaceToggle<CR>", opt)

-- refactoring.nvim
vim.api.nvim_set_keymap("v", "<leader>rt", ":lua M.refactors()<CR>", opt)

-- debuging
nvim_set_keymap("n", "<F5>", ":lua require('dap').continue()<CR>", opt)
nvim_set_keymap("n", "<F10>", ":lua require('dap').step_over()<CR>", opt)
nvim_set_keymap("n", "<F11>", ":lua require('dap').step_into()<CR>", opt)
nvim_set_keymap("n", "<F12>", ":lua require('dap').step_out()<CR>", opt)
nvim_set_keymap("n", "<leader>du", ":lua require('dapui').toggle()<CR>", opt)
nvim_set_keymap("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", opt)

