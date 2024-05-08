if vim.g.did_load_lspconfig_plugin then
  return
end
vim.g.did_load_lspconfig_plugin = true

local wk = require "which-key"
wk.register {
  ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  ["<leader>lf"] = {
    "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
    "Format",
  },
  ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
  ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
  ["<leader>lh"] = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
  ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
  ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
}

wk.register {
  ["<leader>la"] = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
  },
}
