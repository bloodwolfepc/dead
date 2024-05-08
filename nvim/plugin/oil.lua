if vim.g.did_load_oil_plugin then
  return
end
vim.g.did_load_oil_plugin = true

local wk = require "which-key"

wk.register {
  ["<leader>o"] = { "<cmd>Oil<cr>", "Oil" },
}
