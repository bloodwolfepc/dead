if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

--local telescope = require('telescope')
local actions = require('telescope.actions')
--local builtin = require ('telescope.builtin')
--local icons = require "icons"
local wk = require "which-key"

wk.register {
  ["<leader><leader>"] = { "<cmd>Telescope live_grep<cr>", "Fuzzy Grep" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Fuzzy Files" },
  ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Fuzzy Projects" },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Fuzzy Buffers" },
  -- [""] = { "<cmd>Telescope <cr>", "" },
}

--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "TelescopeResults",
--  callback = function(ctx)
--    vim.api.nvim_buf_call(ctx.buf, function()
--      vim.fn.matchadd("TelescopeParent", "/t/t, *$")
--      vim.api.nvim_set_hl(0, "TelescopeParent", {link = "Comment" })
--    end)
--  end,
--})
--local function filenameFirst(_, path)
--  local tail = vim.fs.basename(path)
--  local parent = vim.fs.dirmane(path)
--  if parent == "." then
--    return tail
--  end
--  return string.format("%s\t\t%s", tail, parent)
--end

require("telescope").setup {
  defaults = {
--    vimgrep_arguments = {
--      "rg",
--      },
      mappings = {
        n = {
          ["q"] = actions.close,
        },
      },
--    extensions = {
--      fzf = {
--        fuzzy = true,
--        override_generic_sorter = true,
--        override_file_sorter = true,
--        case_mode = "smart_case",
--      },
--    },
  },
}


