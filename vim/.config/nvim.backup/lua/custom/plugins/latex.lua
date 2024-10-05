return {
  'lervag/vimtex',
  config = function()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_compiler_latexmk = {
      build_dir = 'out',
    }
  end,
}
