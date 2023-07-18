return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"jose-elias-alvarez/typescript.nvim",
		"rescript-lang/vim-rescript",
		"marilari88/twoslash-queries.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local set = vim.keymap.set

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			set("n", "gf", ":Lspsaga finder<cr>", opts)
			set("n", "<leader>o", ":Lspsaga outline<cr>", opts)
			set("n", "gD", vim.lsp.buf.definition, opts)
			set("n", "gr", vim.lsp.buf.references, opts)
			set("n", "gd", ":Lspsaga peek_definition<cr>", opts)
			set("n", "gi", vim.lsp.buf.implementation, opts)
			set("n", "<leader>ca", ":Lspsaga code_action<cr>", opts)
			set("n", "<leader>rn", ":Lspsaga rename<cr>", opts)
			set("n", "<leader>d", ":Lspsaga show_line_diagnostics<cr>", opts)
			set("n", "<leader>za", ":Lspsaga diagnostic_jump_prev<cr>", opts)
			set("n", "<leader>ze", ":Lspsaga diagnostic_jump_next<cr>", opts)
			set("n", "K", ":Lspsaga hover_doc<cr>", opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig.rescriptls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"node",
				vim.fn.stdpath("data") .. "/lazy/vim-rescript/server/out/server.js",
				"--stdio",
			},
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.cmd("PrettierAsync")
					end,
				})
			end,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.cmd("PrettierAsync")
					end,
				})
			end,
		})

		lspconfig.sourcekit.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.ocamllsp.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.cmd("PrettierAsync")
					end,
				})
			end,
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.graphql.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "typescriptreact", "javascriptreact", "javascript", "typescript" },
		})

		lspconfig.svelte.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.cmd("PrettierAsync")
					end,
				})
			end,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.cmd("EslintFixAll")
						vim.cmd("PrettierAsync")
					end,
				})
			end,
		})

		require("typescript").setup({
			server = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					set("n", "<leader>rf", ":TypescriptRenameFile<cr>")
					require("twoslash-queries").attach(client, bufnr)
				end,
			},
		})
	end,
}
