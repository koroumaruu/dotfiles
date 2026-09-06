return {
       'nvim-treesitter/nvim-treesitter',
       build = ":TSUpdate",
       config = function()
	    local configs =  require("nvim-treesitter.config")
	    configs.setup({
		highlight = {
		    enable = true,
		},
		indent = { enable = true },
		autotage = { enable = true },
		ensure_installed = {
		    "python",
		    "c",
		    "nix",
		    "lua",
		    "vim",
		},
		auto_install = false,
	    })
       end
}
