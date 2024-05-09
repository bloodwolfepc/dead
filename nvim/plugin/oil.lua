if vim.g.did_load_oil_plugin then
  return
end
vim.g.did_load_oil_plugin = true

local wk = require "which-key"

require("oil").setup()

wk.register {
  ["<leader>o"] = { "<cmd>Oil<CR>", "Oil" },
}
