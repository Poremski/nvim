local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs,
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- make identing smarter again
  splitright = true, -- force all horizontal splits to go below current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors
  timeoutlen = 100, -- time to wait for a mapped sequence to complete in ms.
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4k ms default)
  writebackup = false, -- prevent to edit file if it was or is edited by other
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column with
  signcolumn = "yes", -- always show the sign column
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- scroll off by 8 rows
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used graphical neovim applications
}

vim.opt.shortmess:append "c" -- avoid hit-enter promts about completion messages

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
