if vim.g.did_load_comment_plugin then
  return
end
vim.g.did_load_comment_plugin = true

local wk = require "which-key"
wk.register {
  ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  }
wk.register {
  ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment", mode = "v" },
  }

vim.g.skip_ts_context_commentstring_module = true
---@diagnostic disable: missing-fields
require("ts_context_commentstring").setup {
 enable_autocmd = false,
}
require("Comment").setup {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

