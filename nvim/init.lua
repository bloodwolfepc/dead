local cmd = vim.cmd
local fn = vim.fn
local opt = vim.o
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

if fn.has('termguicolors') then
  opt.termguicolors = true
end


opt.backup = false -- creates a backup file
opt.undofile = true -- enable persistent undo
opt.undodir = '/tmp/vim-undo' --location of undo file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
--opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.incsearch = true --UNKNOWN
opt.ignorecase = true -- ignore case in search patterns
-- opt.mouse = "a" -- allow the mouse to be used in neovim
opt.breakindent = true -- UNKNOWN
opt.pumheight = 10 -- pop up menu height
opt.pumblend = 10
opt.showmode = true -- show current mode
opt.showtabline = 2 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.timeoutlen = 10 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 50 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert spaces for a tab
opt.softtabstop = 2 -- UNKNOWN
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.laststatus = 3 --UNKNOWN
opt.showcmd = false --UNKNOWN
opt.ruler = false --UNKNOWN
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "number" -- always show the sign column, otherwise it would shift the text each time --TODO: number?, this would require configuration of gitsigns
opt.wrap = false -- display lines as one long line
opt.scrolloff = 0
opt.sidescrolloff = 8
-- opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.title = true -- UNKNOWN
opt.colorcolumn = '100'
-- opt.fillchars = vim.opt.fillchars + "eob: "
-- opt.fillchars:append {
--  stl = " ",
-- }

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

opt.path = vim.o.path .. '**'
opt.hidden = true --UNKNOWN
opt.wildmenu = true --show the wildmenu
g.editorconfig = true --UNKNOWN

-- Native plugins
cmd.filetype('plugin', 'indent', 'on')
cmd.packadd('cfilter') -- Allows filtering the quickfix list with :cfdo

-- let sqlite.lua (which some plugins depend on) know where to find sqlite
vim.g.sqlite_clib_path = require('luv').os_getenv('LIBSQLITE')

-- this should be at the end, because
-- it causes neovim to source ftplugins
-- on the packpath when passing a file to the nvim command
cmd.syntax('on')
cmd.syntax('enable')
