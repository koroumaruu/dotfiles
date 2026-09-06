-- theme and transparency
vim.cmd.colorscheme("default")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

--Basic settings
vim.opt.number = true             -- Line numbers
vim.opt.relativenumber = true         -- relative line numbers
vim.opt.scrolloff = 10             --keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8         -- keep 8 columns left/right of cursor
vim.opt.cursorline = true	  --highlight current line

--indentation
vim.opt.smartindent = true  	  --smart auto-indent
vim.opt.autoindent = true 	  --copy indent from current line 
vim.opt.shiftwidth = 4            --makes ur tab only go 4 spaces instead of 8 

--search settings 
vim.opt.incsearch = true        --show matches as you type
vim.opt.smartcase = true 	-- case sensitive if uppercase in search
vim.opt.hlsearch = true 	--will highlight results

--visual settings
vim.opt.termguicolors = true       -- enable 24-bit colors
vim.opt.signcolumn = "yes"         -- always show sign column
vim.opt.showmatch = true	   --highlight matching brackets
vim.opt.matchtime = 4		   --how long to show matching bracket

-- clipboard
vim.opt.clipboard = "unnamedplus"


