local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
return {
    {
	"sainnhe/gruvbox-material",
	lazy = false,		--load immediately
	priority = 1000,	--load before other schemes
	config = function()
	    vim.o.background = "dark"
	    vim.g.gruvbox_material_background = 'hard'
	end
    },
    {
    "nvim-lualine/lualine.nvim",
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },
    opts = {
	theme = 'gruvbox',
	}
    },
}
