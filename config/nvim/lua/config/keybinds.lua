vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- code runner for C
-- vim.api.nvim_create_autocmd({"BufWritePost"}, {
--     pattern = "*.c",
--     command = "horizontal terminal! gcc % -o %:r && ./%:r"
    -- "%" expands to the current file name, "%:r" expands to the file name without extension
-- })

-- Optional: Map a key to manually run the above command (e.g., <leader>r for Run)
vim.keymap.set("n", "<leader>r", ":horizontal terminal! gcc % -o %:r && ./%:r<CR>", { noremap = true, silent = true })
