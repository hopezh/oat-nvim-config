-- oat-mini

-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
        "c", "lua", "rust", "vim",
        "bash", "yaml", "markdown", "tsx",
        "json", "javascript", "typescript", "html", "css",
        "python",
  },

  sync_install = false,
  auto_install = true,      -- auto install above language parsers

  highlight = { enable = true },    -- enable syntax highlighting

  indent = { enable = true },       -- enable indentation

  autotag = { enable = true },      -- enable nvim-ts-autotag

}


