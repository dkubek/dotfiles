return {
  { 'shaunsingh/nord.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'EdenEast/nightfox.nvim' },

  -- color html colors
  { 'norcalli/nvim-colorizer.lua', config = function()
    require 'colorizer'.setup {
      css = { css_fn = true, css = true },
      'javascript',
      'html',
      'r',
      'rmd',
      'qmd',
      'markdown',
      'python'
    }
  end
  },
}
