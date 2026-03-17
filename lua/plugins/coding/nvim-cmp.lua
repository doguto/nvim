return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{"hrsh7th/cmp-buffer"},
		{"saadparwaiz1/cmp_luasnip"},
		{"L3MON4D3/LuaSnip"},
		{"rafamadriz/friendly-snippets"},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip/loaders/from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({}),
			sources = cmp.config.sources({
				{ name = "luasnip", priority_weight = 20 },

			}, {
				{ name = "buffer", priority_weight = 10 },
			}),
		})
	end,
}
