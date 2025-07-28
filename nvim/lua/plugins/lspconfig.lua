return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"marilari88/twoslash-queries.nvim",
		"folke/neodev.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local telescope = require("telescope.builtin")

		local set = vim.keymap.set
		local cmd = vim.cmd
		local lsp = vim.lsp
		local api = vim.api

		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			set("n", "gd", lsp.buf.definition, opts)
			set("n", "gr", telescope.lsp_references, opts)
			set("n", "<leader>ds", telescope.lsp_document_symbols, opts)
			set("n", "gv", function()
				cmd("vsplit")
				lsp.buf.definition()
			end, opts)
			set("n", "gs", function()
				cmd("split")
				lsp.buf.definition()
			end, opts)
			set("n", "gi", lsp.buf.implementation, opts)
			set("n", "<leader>ca", lsp.buf.code_action, opts)
			set("n", "<leader>rn", lsp.buf.rename, opts)
			set("n", "<leader>d", function()
				vim.diagnostic.open_float({
					source = "always",
				})
			end, opts)
			set("n", "[d", function()
				vim.diagnostic.goto_prev({
					float = {
						source = "always",
					},
				})
			end, opts)
			set("n", "]d", function()
				vim.diagnostic.goto_next({
					float = {
						source = "always",
					},
				})
			end, opts)
			set("n", "K", lsp.buf.hover, opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach_with_lsp_format = function(client, bufnr)
			on_attach(client, bufnr)
			api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					lsp.buf.format()
				end,
			})
		end

		local on_attach_with_prettier = function(client, bufnr)
			on_attach(client, bufnr)
			api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					cmd("PrettierAsync")
				end,
			})
		end

		lspconfig.rescriptls.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
			init_options = {
				extensionConfiguration = {
					incrementalTypechecking = {
						enabled = true,
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.gleam.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.prolog_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.purescriptls.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_prettier,
		})

		lspconfig.sourcekit.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.ocamllsp.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.nixd.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
			settings = {
				nixd = {
					formatting = {
						command = { "nixfmt" },
					},
				},
			},
		})

		lspconfig.elixirls.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
			cmd = {
				"/opt/homebrew/bin/elixir-ls",
			},
		})

		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.templ.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.yamlls.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_prettier,
		})

		lspconfig.taplo.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
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
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.astro.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_prettier,
		})

		lspconfig.biome.setup({
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						cmd("EslintFixAll")
						cmd("PrettierAsync")
					end,
				})
			end,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"vue",
				"astro",
			},
		})

		lspconfig.ts_ls.setup({
			server = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					require("twoslash-queries").attach(client, bufnr)
				end,
			},
		})
	end,
}
