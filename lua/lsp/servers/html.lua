local html = {}

function html.setup(config, on_attach)
	config.on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		on_attach(client, bufnr)
	end

	return config
end

return html

