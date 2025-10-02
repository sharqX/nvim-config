return {
  "github/copilot.vim",

  config = function()
    vim.keymap.set("n", "<leader>-ce" , ":Copilot enable<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>-cd" , ":Copilot disable<CR>", { noremap = true, silent = true })
  end,
}
