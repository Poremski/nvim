local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- autocommand that reloads neovim whenever you save this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- install plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- the packer manager itself
  use "nvim-lua/popup.nvim" -- an implementation of the popup api
  use "nvim-lua/plenary.nvim" -- useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- smart and powerful comment plugin
  use "kyazdani42/nvim-web-devicons" -- devicons
  use "kyazdani42/nvim-tree.lua" -- file explorer
  use "akinsho/bufferline.nvim" -- a snazzy bufferline
  use "moll/vim-bbye" -- delete buffers without closing your windows
  use "nvim-lualine/lualine.nvim" -- statusline plugin
  use "akinsho/toggleterm.nvim" -- persist and toggle multiple terminals

  -- colorschemes
  use "lunarvim/darkplus.nvim"

  -- git
  use "lewis6991/gitsigns.nvim" -- git decorations
  use "f-person/git-blame.nvim" -- git blame
  use "ruifm/gitlinker.nvim" -- generate shareable file permlinks
  use "mattn/vim-gist" -- creating gists
  use "mattn/webapi-vim" -- interface to web api

  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
