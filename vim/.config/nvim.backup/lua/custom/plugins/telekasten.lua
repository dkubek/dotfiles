return {
  'renerocksai/telekasten.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'renerocksai/calendar-vim',
  },
  config = function()
    local home = vim.fn.expand("~/zettelkasten")
    require('telekasten').setup({
      home = home,
    })
  end
}
