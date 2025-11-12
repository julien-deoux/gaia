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

		local on_attach_with = function(formatter)
			return function(client, bufnr)
				local format = function()
					formatter(client, bufnr)
				end
				on_attach(client, bufnr)
				set("n", "<leader>F", format)
				api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = format,
				})
			end
		end

		local prettier = function()
			cmd("PrettierAsync")
		end

		local lspformat = function(client)
			lsp.buf.format({ id = client.id })
		end

		local purstidy = function()
			cmd("%!purs-tidy format")
		end

		local biome = function(client, bufnr)
			local params = lsp.util.make_range_params(0, client.offset_encoding)
			params.context = { diagnostics = {}, only = { "source.fixAll.biome" } }
			local result = client.request_sync("textDocument/codeAction", params, 1000, bufnr)
			if not result then
				return
			end
			for _, r in pairs(result.result or {}) do
				if r.edit then
					lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
				elseif r.command then
					lsp.buf.execute_command(r.command)
				end
			end
			lspformat(client)
		end

		lsp.config("rescriptls", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
			init_options = {
				extensionConfiguration = {
					incrementalTypechecking = {
						enabled = true,
					},
				},
			},
		})
		lsp.enable("rescriptls")

		lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lsp.enable("lua_ls")

		lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("html")

		lsp.config("gleam", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("gleam")

		lsp.config("prolog_ls", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("prolog_ls")

		lsp.config("purescriptls", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				set("n", "<leader>F", purstidy)
				on_attach(client, bufnr)
			end,
		})
		lsp.enable("purescriptls")

		lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach_with(prettier),
		})
		lsp.enable("cssls")

		lsp.config("sourcekit", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lsp.enable("sourcekit")

		lsp.config("ocamllsp", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("ocamllsp")

		lsp.config("nixd", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
			settings = {
				nixd = {
					formatting = {
						command = { "nixfmt" },
					},
				},
			},
		})
		lsp.enable("nixd")

		lsp.config("elixirls", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
			cmd = {
				"/opt/homebrew/bin/elixir-ls",
			},
		})
		lsp.enable("elixirls")

		lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("gopls")

		lsp.config("templ", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("templ")

		lsp.config("jsonls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lsp.enable("jsonls")

		lsp.config("yamlls", {
			capabilities = capabilities,
			on_attach = on_attach_with(prettier),
		})
		lsp.enable("yamlls")

		lsp.config("taplo", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("taplo")

		lsp.config("rust_analyzer", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lsp.enable("rust_analyzer")

		lsp.config("graphql", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "typescriptreact", "javascriptreact", "javascript", "typescript" },
		})
		lsp.enable("graphql")

		lsp.config("svelte", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lsp.enable("svelte")

		lsp.config("astro", {
			capabilities = capabilities,
			on_attach = on_attach_with(lspformat),
		})
		lsp.enable("astro")

		lsp.config("biome", {
			capabilities = capabilities,
			on_attach = on_attach_with(biome),
		})
		lsp.enable("biome")

		lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				require("twoslash-queries").attach(client, bufnr)
			end,
		})
		lsp.enable("ts_ls")
	end,
}
