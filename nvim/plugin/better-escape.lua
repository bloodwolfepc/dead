if vim.g.did_load_betterescape_plugin then
  return
end
vim.g.did_load_betterescape_plugin = true

require("better_escape").setup {
  mapping = { "jk" },
  timeout = 300,
  clear_empty_lines = false,
  keys = "<Esc>",
}
