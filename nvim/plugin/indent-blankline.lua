if vim.g.did_load_indentblankline_plugin then
  return
end
vim.g.did_load_indentblankline_plugin = true

require("ibl").setup()
