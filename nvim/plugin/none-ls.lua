if vim.g.did_load_null_ls_plugin then
  return
end
vim.g.did_load_null_ls_plugin = true

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.stylua,
    --formatting.prettier,
    --formatting.black,
    --diagnostics.flake8,
    null_ls.builtins.completion.spell,
  },
}
