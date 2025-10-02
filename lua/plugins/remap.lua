-- lua/plugins/remap.lua
return {
  {
    -- A lightweight host plugin just to run your keymaps early
    -- (no extra dependency needed; it only uses the init() callback)
    "nvim-lua/plenary.nvim",
    lazy = true,
    -- Run as soon as lazy starts up
    priority = 10000,
    init = function()
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }



      -- General
      keymap("n", "<leader>e", ":Oil<CR>", opts)        -- File explorer
      keymap("n", "<leader>w", ":w<CR>", opts)          -- Save
      keymap("n", "<leader>q", ":q<CR>", opts)          -- Quit
      keymap("n", "<leader>h", ":nohlsearch<CR>", opts) -- Clear highlights
      keymap("n", "<leader>n", ":bn<CR>", opts)         -- Next buffer
      keymap("n", "<leader>p", ":bp<CR>", opts)         -- Prev buffer

      -- Window management
      keymap("n", "<leader>sv", "<C-w>v", opts)     -- Split vertical
      keymap("n", "<leader>sh", "<C-w>s", opts)     -- Split horizontal
      keymap("n", "<leader>se", "<C-w>=", opts)     -- Equalize splits
      keymap("n", "<leader>sx", ":close<CR>", opts) -- Close split

      -- Tabs
      keymap("n", "<leader>to", ":tabnew<CR>", opts)   -- New tab
      keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- Close tab
      keymap("n", "<leader>tn", ":tabn<CR>", opts)     -- Next tab
      keymap("n", "<leader>tp", ":tabp<CR>", opts)     -- Prev tab

      -- Move lines (up/down with Alt+j/k)
      keymap("n", "<A-j>", ":m .+1<CR>==", opts)
      keymap("n", "<A-k>", ":m .-2<CR>==", opts)
      keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
      keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
      keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
      keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
      keymap("n", "<C-f>", function() vim.lsp.buf.format({ async = true }) end, opts)
    end,
  }
}
