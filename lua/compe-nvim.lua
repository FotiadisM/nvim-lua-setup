-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Avoid showing message extra message when using completion
-- vim.o.shortmess = "shmc"
vim.api.nvim_exec([[
	set shortmess+=c
]], false)

require("compe").setup({
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = "always";
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		-- vsnip = true;
		-- ultisnips = true;
	};
})

vim.cmd("hi link CompeDocumentation NormalFloat")

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

