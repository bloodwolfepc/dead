if vim.g.did_load_treesitter_plugin then
  return
end
vim.g.did_load_treesitter_plugin = true

require'nvim-treesitter.configs'.setup {
  -- ensure_installed = 'all',
  highlight = { enable = true },
  indent = { enable = true },
}
