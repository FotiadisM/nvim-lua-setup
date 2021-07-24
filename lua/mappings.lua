vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true})
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true })

local opt = { noremap = true, silent = true}

-- close current buffer and jump to the previous one
vim.api.nvim_set_keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opt)

-- moving between windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opt)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opt)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opt)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opt)

-- resizing windows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +3<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -3<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize +3<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize -3<CR>", opt)

-- copy to clipboard
vim.api.nvim_set_keymap("", "<C-c>", "\"+y", opt)

-- disable ex mode
vim.api.nvim_set_keymap("n", "Q", "<nop>", opt)
vim.api.nvim_set_keymap("n", "q:", "<nop>", opt)

-- toggle spelling
vim.api.nvim_set_keymap("n", "<leader>s", ":set spell!<CR>", opt)

-- misc
vim.api.nvim_set_keymap("n", "<space>j", "o<ESC>", opt)
vim.api.nvim_set_keymap("n", "<space>k", "o<ESC>k", opt)

-- Plugins

-- nvim-tree
vim.api.nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<CR>", opt)

-- telescope
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>fm", ":Telescope media_files<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>fc", ":Telescope commands<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>ft", ":TodoTelescope<CR>", opt)

-- bufferline
vim.api.nvim_set_keymap("n", "gt", ":BufferLineCycleNext<CR>", opt)
vim.api.nvim_set_keymap("n", "gT", ":BufferLineCyclePrev<CR>", opt)

vim.api.nvim_set_keymap("n", "L", ":BufferLineCycleNext<CR>", opt)
vim.api.nvim_set_keymap("n", "H", ":BufferLineCyclePrev<CR>", opt)

-- nvim-compe
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.tab_completion()
    return vim.fn.pumvisible() == 1 and t('<Down>') or t('<Tab>')
end

function _G.s_tab_completion()
    return vim.fn.pumvisible() == 1 and t('<Up>') or t('<S-Tab>')
end

-- map <C-Space> to manually trigger completion
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { silent = true, expr = true })

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_completion()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_completion()', {expr = true, noremap = true})

-- nvim-toggleterm
vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>T", ":ToggleTerm direction='float'<CR>", opt)

-- nvim-comment
vim.api.nvim_set_keymap("n", "<leader>c", ":CommentToggle<CR>", opt)
vim.api.nvim_set_keymap("v", "<leader>c", ":CommentToggle<CR>", opt)

-- nvim-spectre
vim.api.nvim_set_keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", opt)

-- todo-comments
vim.api.nvim_set_keymap("n", "<leader>wt", ":TodoQuickFix<CR>", { noremap = true, silent = true, })

-- trouble
vim.api.nvim_set_keymap("n", "<leader>ww", ":LspTroubleWorkspaceToggle<CR>", { noremap = true, silent = true, })

