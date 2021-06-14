require("completion")

-- Use completion-nvim in every buffer
-- vim.api.cmd("autocmd BufEnter * lua require'completion'.on_attach()")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.tab_completion()
    return vim.fn.pumvisible() == 1 and t('<C-n>') or t('<Tab>')
end

function _G.s_tab_completion()
    return vim.fn.pumvisible() == 1 and t('<C-p>') or t('<S-Tab>')
end

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_completion()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_completion()', {expr = true, noremap = true})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert,noselect"

vim.api.nvim_exec([[
	autocmd BufEnter * lua require'completion'.on_attach()
]], false)

-- Avoid showing message extra message when using completion
-- vim.o.shortmess = "shmc"

-- map <C-Space> to manually trigger completion
vim.api.nvim_set_keymap("i", "<C-Space>", "<Plug>(completion_trigger)", { silent = true })

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

