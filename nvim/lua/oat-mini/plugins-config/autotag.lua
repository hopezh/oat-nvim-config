require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

require('nvim-ts-autotag').setup({

    filetypes = {
        'html', 'javascript', 'css', 'typescript', 'javascriptreact',
        'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
        'xml', 'json',
        'php',
        'markdown',
        'glimmer','handlebars','hbs',
        'python',
    },

    skip_tags = {
      'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
      'input', 'keygen', 'link', 'meta',
      'param', 'source', 'track', 'wbr','menuitem'
    },

})

