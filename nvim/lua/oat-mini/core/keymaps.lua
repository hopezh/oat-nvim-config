-- Author: oat
-- 2022-12-19

-- for brievity ---------------------------------------------------------------- 
local km = vim.keymap
local g  = vim.g
local api = vim.api

-- set leader key as SPACE ----------------------------------------------------- 
g.mapleader = " "

-- use "jk" to ESC ------------------------------------------------------------- 
km.set("c", "jk", "<ESC>")  -- command-line mode 
km.set("i", "jk", "<ESC>")  -- insert mode 
km.set("o", "jk", "<ESC>")  -- operator pending mode 
km.set("s", "jk", "<ESC>")  -- select mode 
km.set("v", "jk", "<ESC>")  -- visual & select mode 
km.set("x", "jk", "<ESC>")  -- visual mode 

-- in normal mode, use <leader>+n to clear highlight --------------------------- 
km.set("n", "<leader>n",  ":noh<CR>")

-- floaterm --------------------------------------------------------------------
g.floaterm_keymap_new    = '<Leader>ft'
g.floaterm_keymap_toggle = '<Leader>tt'

-- nvim-tree -------------------------------------------------------------------
km.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- toggle twilight for highliting/diming code section --------------------------
km.set("n", "<leader>tl", ":Twilight<CR>")

-- toggle true-zen modes -------------------------------------------------------
-- api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
-- api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
-- api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- toggle lazygit --------------------------------------------------------------
km.set("n", "<leader>zz", ":LazyGit<CR>")

