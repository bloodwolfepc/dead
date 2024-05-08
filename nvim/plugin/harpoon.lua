if vim.g.did_load_harpoon_plugin then
  return
end
vim.g.did_load_harpoon_plugin = true

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap ("n", "<leader>bm", "<cmd>lua require('harpoon').mark_file()<CR>", opts)
keymap ("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)



