" Base16 Dracula vim-lualine-theme 
" For lualine.nvim (https://github.com/nvim-lualine/lualine.nvim)
" By Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)

local colors = {
  base00 = '#282936',
  base01 = '#3a3c4e',
  base02 = '#4d4f68',
  base03 = '#626483',
  base04 = '#62d6e8',
  base05 = '#e9e9f4',
  base06 = '#f1f2f8',
  base07 = '#f7f7fb',
  base08 = '#ea51b2',
  base09 = '#b45bcf',
  base0A = '#00f769',
  base0B = '#ebff87',
  base0C = '#a1efe4',
  base0D = '#62d6e8',
  base0E = '#b45bcf',
  base0F = '#00f769',
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
    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.base0A, fg = colors.gray}
  },
  insert = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.lightgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.inactivegray, fg = colors.black}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.black, fg = colors.white}
  },
  command = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.inactivegray, fg = colors.black}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.gray},
    c = {bg = colors.darkgray, fg = colors.gray}
  }
}
