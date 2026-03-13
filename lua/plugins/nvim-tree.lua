return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup()
		vim.keymap.set("n", ";h", "<cmd>NvimTreeFocus<CR>", { desc = "NvimTree にフォーカス" })
	end,
}

