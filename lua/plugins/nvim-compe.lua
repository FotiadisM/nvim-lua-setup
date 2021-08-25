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
		luasnip = true;
	};
})

vim.cmd("hi link CompeDocumentation NormalFloat")

local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then return lib end
	return nil
end

local luasnip = prequire("luasnip")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    end

	return false
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<Down>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<Up>"
    elseif luasnip and luasnip.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    else
        return t "<S-Tab>"
    end
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<CR>", [[ compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()")) ]], { expr = true })
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')",  { expr = true })

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

