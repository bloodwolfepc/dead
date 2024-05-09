if vim.g.did_load_keymaps_plugin then
  return
end
vim.g.did_load_keymaps_plugin = true

--local api = vim.api
--local fn = vim.fn
local keymap = vim.keymap.set
--local diagnostic = vim.diagnostic
local opts = { noremap = true, silent = true }
local wk = require("which-key")
local which_key_opts = {
  mode = "n",
  prefix = "<leader>",
}

local mappings = {
  b = { name = "Buffers" },
  d = { name = "Debug" },
  f = { name = "Fuzzy" },
  g = { name = "Git" },
  t = { name = "Test" },
  T = { name = "Treesitter" },
  l = { name = "LSP" },

  h = { "<cmd>nonlsearch<CR>", "NOHL" },
  [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
  v = { "<cmd>vsplit<CR>", "Split" },
}

wk.setup {
  plugins = {
    marks = true,
    registers = true,
  },
}

wk.register(mappings, which_key_opts)

keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])
