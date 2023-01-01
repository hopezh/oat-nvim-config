-- oat-mini

-- import nvim-cmp plugin safely -----------------------------------------------
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely ------------------------------------------------
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely ------------------------------------------------
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end
-- or, simply: 
-- local lspkind = require('lspkind')

-- select-opts -----------------------------------------------------------------
local select_opts = { behavior = cmp.SelectBehavior.Select }

-- abbr of source names, to be used together with tabnine related formatting
-- ref: https://github.com/tzachar/cmp-tabnine#More-Commands -------------------
-- local source_mapping = {
-- 	buffer      = "[Buff]",
-- 	nvim_lsp    = "[LSP]",
-- 	nvim_lua    = "[Lua]",
-- 	cmp_tabnine = "[TabN]",
-- 	path        = "[Path]",
-- }

-- autocompletion --------------------------------------------------------------
vim.opt.completeopt = "menu,menuone,noselect"

-- load vs-code like snippets from plugins (e.g. friendly-snippets) ------------
require("luasnip/loaders/from_vscode").lazy_load()

-- cmp settings ----------------------------------------------------------------
cmp.setup({
    -- snippet 
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- keymapping
    mapping = {
        -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        -- ["<Tab>"]       = cmp.mapping.select_next_item(select_opts),   -- tab: go to the next suggestion
        -- ["<S-Tab>"]     = cmp.mapping.select_prev_item(select_opts),   -- shift+tab: go to previous suggestion
        ["<C-j>"]       = cmp.mapping.select_next_item(select_opts),
        ["<C-k>"]       = cmp.mapping.select_prev_item(select_opts),
        ["<C-f>"]       = cmp.mapping.scroll_docs(4),
        ["<C-Space>"]   = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"]       = cmp.mapping.abort(), -- close completion window
        ["<CR>"]        = cmp.mapping.confirm({ select = false }),  -- confirm selection
    },

    -- sources for autocompletion
    sources = {
        { name = "path" },                          -- file system paths
        { name = "nvim_lsp",    keyword_length = 3 },  -- lsp
        { name = "cmp_tabnine", keyword_length = 3 },  -- tabnine
        { name = "buffer",      keyword_length = 3 },  -- text within current buffer
        { name = "luasnip",     keyword_length = 3 },  -- snippets
    },

    -- appearance of documentation window 
    window = {
        -- documentation = cmp.config.window.bordered(),
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },

    -- configure lspkind for vs-code like icons
    formatting = {
        fields = {'kind', 'abbr', 'menu'},

        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",

            -- display source of completion suggestion
            menu = ({
                buffer          = "[Buffer]",
                nvim_lsp        = "[LSP]",
                nvim_lua        = "[Lua]",
                cmp_tabnine     = "[Tabnine]",
                path            = "[Path]",
                luasnip         = "[LuaSnip]",
                latex_symbols   = "[Latex]",
            })
        }),

        -- format in tabnine way 
        -- ref: https://github.com/tzachar/cmp-tabnine#More-Commands
        -- format = function(entry, vim_item)
        --     -- if you have lspkind installed, you can use it like
        --     -- in the following line:
        --     vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
        --     vim_item.menu = source_mapping[entry.source.name]
        --     if entry.source.name == "cmp_tabnine" then
        --         local detail = (entry.completion_item.data or {}).detail
        --         vim_item.kind = ""
        --         if detail and detail:find('.*%%.*') then
        --             vim_item.kind = vim_item.kind .. ' ' .. detail
        --         end

        --         if (entry.completion_item.data or {}).multiline then
        --             vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
        --         end
        --     end
        --     local maxwidth = 80
        --     vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        --     return vim_item
        -- end,
    },
})


