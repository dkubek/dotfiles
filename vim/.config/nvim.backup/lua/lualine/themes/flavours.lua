-- Base16 Eighties vim-lualine-theme 
-- For lualine.nvim (https://github.com/nvim-lualine/lualine.nvim)
-- By Chris Kempson (http://chriskempson.com)

local colors = {
  base00 = '#2d2d2d',
  base01 = '#393939',
  base02 = '#515151',
  base03 = '#747369',
  base04 = '#a09f93',
  base05 = '#d3d0c8',
  base06 = '#e8e6df',
  base07 = '#f2f0ec',
  base08 = '#f2777a',
  base09 = '#f99157',
  base0A = '#ffcc66',
  base0B = '#99cc99',
  base0C = '#66cccc',
  base0D = '#6699cc',
  base0E = '#cc99cc',
  base0F = '#d27b53',
  black        = '#282828',
  white        = '#ebdbb2',
  red          = '#fb4934',
  green        = '#b8bb26',
  blue         = '#83a598',
  yellow       = '#fe8019',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
}

return {
  normal = {
    a = {bg = colors.base0D, fg = colors.base06, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.base05},
    c = {bg = colors.base02, fg = colors.base05}
  },
  insert = {
    a = {bg = colors.base08, fg = colors.base06, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.base05},
    c = {bg = colors.base02, fg = colors.base05}
  },
  visual = {
    a = {bg = colors.base09, fg = colors.base06, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.base05},
    c = {bg = colors.base02, fg = colors.base05}
  },
  replace = {
    a = {bg = colors.base0A, fg = colors.base06, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.base05},
    c = {bg = colors.base02, fg = colors.base05}
  },
  command = {
    a = {bg = colors.base0B, fg = colors.base06, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.base05},
    c = {bg = colors.base02, fg = colors.base05}
  },
  inactive = {
    a = {bg = colors.base01, fg = colors.base03, gui = 'bold'},
    b = {bg = colors.base01, fg = colors.base03},
    c = {bg = colors.base01, fg = colors.base03}
  }
}
