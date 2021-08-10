vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{
		border = "single"
	}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{
		border = "single"
	}
)

local lspSignatureCfg = {
	bind = true, -- This is mandatory, otherwise border config won't get registered.
				 -- If you want to hook lspsaga or other signature handler, pls set to false
	doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                   -- set to 0 if you DO NOT want any API comments be shown
                   -- This setting only take effect in insert mode, it does not affect signature help in normal
                   -- mode, 10 by default

	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
	fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = false, -- virtual hint enable
	use_lspsaga = false,  -- set to true if you want to use lspsaga popup
	hi_parameter = "Search", -- how your parameter will be highlight
	max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
					 -- to view the hiding contents
	max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	handler_opts = {
		border = "single"   -- double, single, shadow, none
	},
	extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
}

-- keymaps
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	require("lsp_signature").on_attach(lspSignatureCfg)

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
		vim.api.nvim_exec([[
			augroup Format
				autocmd! * <buffer>
				autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
			augroup END
		]], false)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
		vim.api.nvim_exec([[
			augroup Format
				autocmd! * <buffer>
				autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
			augroup END
		]], false)
	end

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end

-- config that activates keymaps and enables snippet support
local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

-- lsp-install
local function setup_servers()
    require("lspinstall").setup()

    -- get all installed servers
    local servers = require("lspinstall").installed_servers()

    for _, server in pairs(servers) do
        local config = make_config()

        -- language specific config
        if server == "lua" then
			config = require("lsp.servers.lua").setup(config, on_attach)
        end

		if server == "latex" then
			config = require("lsp.servers.latex").setup(config, on_attach)
		end

		if server == "html" then
			config = require("lsp.servers.html").setup(config, on_attach)
		end

		if server == "go" then
			config = require("lsp.servers.go").setup(config, on_attach)
		end

		if server == "typescript" then
			config = require("lsp.servers.typescript").setup(config, on_attach)
		end

		if server == "efm" then
			config = require("lsp.servers.efm").setup(config, on_attach)
		end

		require("lspconfig")[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- show lightbulb when a code actions is available
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
