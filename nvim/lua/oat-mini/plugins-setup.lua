-- oat-mini

-- auto install packer if not installed ----------------------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- import packer safely --------------------------------------------------------
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- use a float window with rounded corners -------------------------------------
-- source: https://github.com/Allaman/nvim/blob/main/lua/core/packer.lua
packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746

  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- add list of plugins ---------------------------------------------------------
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- syntax highlight, fuzzy finder
  use 'nvim-treesitter/nvim-treesitter'
  use {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- must have util 
  use 'justinmk/vim-sneak'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

  -- file explorer
  use 'nvim-tree/nvim-tree.lua'

  -- color schemes
  use 'ellisonleao/gruvbox.nvim'
  use 'kaicataldo/material.vim'
  use 'marko-cerovac/material.nvim'

  -- format 
  use 'lukas-reineke/indent-blankline.nvim'
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use 'windwp/nvim-ts-autotag'
  use 'lukas-reineke/virt-column.nvim'

  -- icon, status line, gutter
  use 'nvim-tree/nvim-web-devicons'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use 'lewis6991/gitsigns.nvim'

  -- terminal, git
  use 'voldikss/vim-floaterm'
  use 'kdheepak/lazygit.nvim'

  -- lsp related 
  use 'williamboman/mason.nvim'             -- managing and installing lsp servers, linters & formatters 
  use 'williamboman/mason-lspconfig.nvim'   -- bridge the gap btw mason & lspconfig
  use 'neovim/nvim-lspconfig'               -- configuring lsp servers
  use 'onsails/lspkind.nvim'                -- vs-code like icons for autocompletion

  -- autocompletion 
  use 'hrsh7th/nvim-cmp'        -- completion plugin 
  use 'hrsh7th/cmp-nvim-lsp'    -- sourve for lsp
  use 'hrsh7th/cmp-buffer'      -- source for text in buffer
  use 'hrsh7th/cmp-path'        -- source for file system paths

  -- snippets
  use 'L3MON4D3/LuaSnip'                -- snippet engine
  use 'saadparwaiz1/cmp_luasnip'        -- for autcompletion
  use 'rafamadriz/friendly-snippets'    -- useful snippets

  -- code highlighting/dimming & zen mode
  use 'folke/twilight.nvim'
  use 'folke/zen-mode.nvim'
  use 'Pocco81/true-zen.nvim'

  -- tabnine smart code suggetion
  use {'tzachar/cmp-tabnine', run='./install.sh', requires='hrsh7th/nvim-cmp'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


