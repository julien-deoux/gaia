return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"marilari88/twoslash-queries.nvim",
		"folke/neodev.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
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

		vim.lsp.config("rescriptls", {
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
    vim.lsp.enable("rescriptls")

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
    vim.lsp.enable("lua_ls")

		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("html")

		vim.lsp.config("gleam", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("gleam")

		vim.lsp.config("prolog_ls", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("prolog_ls")

		vim.lsp.config("purescriptls", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("purescriptls")

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach_with_prettier,
		})
    vim.lsp.enable("cssls")

		vim.lsp.config("sourcekit", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
    vim.lsp.enable("sourcekit")

		vim.lsp.config("ocamllsp", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("ocamllsp")

		vim.lsp.config("nixd", {
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
    vim.lsp.enable("nixd")

		vim.lsp.config("elixirls", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
			cmd = {
				"/opt/homebrew/bin/elixir-ls",
			},
		})
    vim.lsp.enable("elixirls")

		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("gopls")

		vim.lsp.config("templ", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("templ")

		vim.lsp.config("jsonls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
    vim.lsp.enable("jsonls")

		vim.lsp.config("yamlls", {
			capabilities = capabilities,
			on_attach = on_attach_with_prettier,
		})
    vim.lsp.enable("yamlls")

		vim.lsp.config("taplo", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("taplo")

		vim.lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
    vim.lsp.enable("rust_analyzer")

		vim.lsp.config("graphql", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "typescriptreact", "javascriptreact", "javascript", "typescript" },
		})
    vim.lsp.enable("graphql")

		vim.lsp.config("svelte", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("svelte")

		vim.lsp.config("astro", {
			capabilities = capabilities,
			on_attach = on_attach_with_prettier,
		})
    vim.lsp.enable("astro")

		vim.lsp.config("biome", {
			capabilities = capabilities,
			on_attach = on_attach_with_lsp_format,
		})
    vim.lsp.enable("biome")

		vim.lsp.config("eslint", {
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
    vim.lsp.enable("eslint")

		vim.lsp.config("ts_ls", {
			server = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					require("twoslash-queries").attach(client, bufnr)
				end,
			},
		})
    vim.lsp.enable("ts_ls")
	end,
}
