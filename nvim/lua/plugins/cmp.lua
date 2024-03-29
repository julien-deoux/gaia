return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Suggest words from buffer
		"hrsh7th/cmp-path", -- Suggest path
		"hrsh7th/cmp-nvim-lsp", -- Suggest LSP tags
		"saadparwaiz1/cmp_luasnip", -- Suggest snippets
		"kirasok/cmp-hledger", -- hledger integration
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "hledger" },
			}),
		})
	end,
}
