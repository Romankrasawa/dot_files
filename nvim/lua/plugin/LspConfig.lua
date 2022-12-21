local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

root_dir = function(fname)
    return vim.fn.getcwd()
end

require('lspconfig').pyright.setup({ capabilities = capabilities, root_dir = root_dir })

require("lspconfig").ccls.setup({ capabilities = capabilities, root_dir = root_dir })

require("lspconfig").tsserver.setup({ capabilities = capabilities, root_dir = root_dir })

require("lspconfig").html.setup({ capabilities = capabilities, root_dir = root_dir })

require("lspconfig").rust_analyzer.setup({ capabilities = capabilities, root_dir = root_dir })

require("lspconfig").cssls.setup({ capabilities = capabilities, root_dir = root_dir })

require("lspconfig").emmet_ls.setup({ capabilities = capabilities})

