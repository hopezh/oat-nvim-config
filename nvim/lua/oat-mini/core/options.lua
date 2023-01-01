-- oat-mini 

-- for brevity -----------------------------------------------------------------
local opt = vim.opt
local g   = vim.g

-- line numbers ---------------------------------------------------------------- 
opt.number = true
opt.relativenumber = true

-- tabs & indentation ----------------------------------------------------------
opt.autoindent  = true
opt.expandtab   = true
opt.shiftwidth  = 4
opt.showtabline = 2
opt.smartindent = true
opt.smarttab    = true
opt.softtabstop = 4
opt.tabstop     = 4

-- line wrap ------------------------------------------------------------------- 
opt.wrap = false

-- search ---------------------------------------------------------------------- 
opt.hlsearch    = true
opt.ignorecase  = true
opt.smartcase   = true
opt.incsearch   = true

-- hightlight cursor line ------------------------------------------------------ 
opt.cursorline = true

-- display --------------------------------------------------------------------- 
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.background = 'dark'

-- change cursor using nvim's guicursor ---------------------------------------- 
-- [:help guicursor]
vim.cmd([[
    set guicursor=n-v-c:block,i-ci-ve:ver50,r-cr:hor50,o:hor50
      \,a:blinkwait30-blinkoff30-blinkon30-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175F
]])

-- highlight the 80th column --------------------------------------------------- 
vim.o.colorcolumn = '80'
-- vim.cmd([[
--     set colorcolumn=80
--     " -- set the color of the colorcolumn
--     hi ColorColumn ctermbg=Black guibg=#ffffff
--     " -- set the color of the columns from the 80th character
--     let &colorcolumn=join(range(81, 999), ",")
-- ]])

-- use system clipboard -------------------------------------------------------- 
opt.clipboard:append('unnamedplus')

-- default window splitting direction ------------------------------------------
opt.splitbelow = true
opt.splitright = true

-- vim-sneak ------------------------------------------------------------------- 
g['sneak#label'] = 1        -- show a unique label for each sneak result
g['sneak#use_ic_scs'] = 1   -- sneak's case sensitivity according to 'ignorecase' & 'smartcase'

-- use material.vim colorscheme ------------------------------------------------ 
-- vim.cmd 'colorscheme material'
-- g['material_theme_style'] = 'darker'



-- treesitter-based folding ----------------------------------------------------
opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- no swap file ----------------------------------------------------------------
vim.cmd('set noswapfile')

-- floaterm config -------------------------------------------------------------
g['floaterm_width'] = 0.98  -- ratio relative to the nvim window
g['floaterm_height'] = 0.98

g['floaterm_borderchars'] = '─│─│┌┐┘└'  -- default border characters
-- g['floaterm_borderchars'] = '- -     '  -- customize border characters

vim.cmd([[
    hi Floaterm guibg=black  " set floaterm window background color
]])


