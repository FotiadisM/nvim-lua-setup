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
	hint_enable = false,
	handler_opts = {
		border = "single",
	},
	zindex = 50 -- signatureHelp behind completion items
}

-- keymaps
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	require("lsp_signature").on_attach(lspSignatureCfg)

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
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
		vim.cmd([[
			augroup lsp_format
				autocmd! * <buffer>
				autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
			augroup END
		]])
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>rf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	-- add lsp workspace diagnostic to quickfix and buffer diagnostics to localist
	vim.cmd([[
		augroup lsp_diagnostics
			autocmd! * <buffer>
			autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_qflist({ open = false })
			autocmd User LspDiagnosticsChanged lua vim.lsp.diagnostic.set_loclist({ open = false })
		augroup END
	]])

	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
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

		if server == "json" then
			config = require("lsp.servers.json").setup(config, on_attach)
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

