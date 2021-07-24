local efm = {}

local eslint = {
	rootMarkers = { "package.json" },
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintIgnoreExitCode = true,
	lintStdin = true,
	lintFormats = {"%f:%l:%c: %m"},
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true
}

local prettier = {
	rootMarkers = { "package.json" },
	formatCommand = (
		function()
			if not vim.fn.empty(vim.loop.cwd() .. '/node_modules/.bin/prettier') then
				return "./node_modules/.bin/prettier"
			end

			return "prettier"
		end
  	)()
}

function efm.setup(config, on_attach)
	config.init_options = { documentFormatting = true }
	config.on_attach = function(client, bufnr)
		client.resolved_capabilities.rename = false
		client.resolved_capabilities.hover = false
		on_attach(client, bufnr)
	end
	config.filetypes = {
		"go",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"html",
		"css",
		"json",
		"yaml",
		"markdown",
		"tex",
	}
	config.settings = {
		languages = {
			go = {{
				rootMarkers = { "go.mod" },
				formatCommand = "goimports",
				formatStdin = true,
				lintCommand = "golint",
				lintStdin = true,
				lintFormats = { "%f:%l:%c: %m" },
			}},
			javascript = { eslint, prettier },
			javascriptreact = { eslint, prettier },
			typescript = { eslint, prettier },
			typescriptreact = { eslint, prettier },
			html = { prettier },
			css = { prettier },
			json = { prettier },
			yaml = { prettier },
			markdown = { prettier },
			tex = {{
				rootMarkers = { "main.tex" },
				formatCommand = "latexindent -g /dev/null",
				formatStdin = true,
			}},
		}
	}

	return config
end

return efm

