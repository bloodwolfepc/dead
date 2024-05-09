
--tosetup in the snippet context, C+j or k allows selection. tab is not used. enter will complete.
--jk will kill the context

--supertab has an option to get to a second place of a snippet

if vim.g.did_load_completion_plugin then
  return
end
vim.g.did_load_completion_plugin = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
--local icons = require('icons')
local check_backspace = function()
  local col = vim.fn.col "." -1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) --for 'luasnip' users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-d>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" },
    { name = "calc" },
    { name = "emoji" },
  },
  confirm_opts = { --UNKNOWN
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  -- window = {
  -- },
  experimental = {
    ghost_text = false,
  },
}
