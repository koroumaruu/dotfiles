return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        c = {
          "cd $dir &&",
          "gcc $fileName -o $fileNameWithoutExt &&",
          "./$fileNameWithoutExt",
        },
        python = "python3 -u",
      },
      -- Optional: float or tab
      mode = "float", 
      float = {
        border = "rounded",
      },
    })
  end,
  -- Keybinds
  keys = {
    { "<leader>rr", ":RunCode<CR>", desc = "Run Code" },
    { "<leader>rf", ":RunFile<CR>", desc = "Run File" },
    { "<leader>rp", ":RunProject<CR>", desc = "Run Project" },
  },
}
