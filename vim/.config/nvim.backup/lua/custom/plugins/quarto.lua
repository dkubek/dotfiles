-- This is a config that can be merged with your
-- existing LazyVim config.
--
-- It configures all plugins necessary for quarto-nvim,
-- such as adding its code completion source to the
-- completion engine nvim-cmp.
-- Thus, instead of having to change your configuration entirely,
-- this takes your existings config and adds on top where necessary.

return {
  -- this taps into vim.ui.select and vim.ui.input
  -- and in doing so currently breaks renaming in otter.nvim
  { "stevearc/dressing.nvim", enabled = false },

  {
    "quarto-dev/quarto-nvim",
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "html", "lua" },
      },
    },
    config = function()
      -- conceal can be tricky because both
      -- the treesitter highlighting and the
      -- regex vim syntax files can define conceals
      --
      -- conceallevel
      -- 0		Text is shown normally
      -- 1		Each block of concealed text is replaced with one
      -- 		character.  If the syntax item does not have a custom
      -- 		replacement character defined (see |:syn-cchar|) the
      -- 		character defined in 'listchars' is used.
      -- 		It is highlighted with the "Conceal" highlight group.
      -- 2		Concealed text is completely hidden unless it has a
      -- 		custom replacement character defined (see
      -- 		|:syn-cchar|).
      -- 3		Concealed text is completely hidden.
      vim.opt.conceallevel = 1

      -- disable conceal in markdown/quarto
      vim.g['pandoc#syntax#conceal#use'] = false

      -- embeds are already handled by treesitter injectons
      vim.g['pandoc#syntax#codeblocks#embeds#use'] = false

      vim.g['pandoc#syntax#conceal#blacklist'] = { 'codeblock_delim', 'codeblock_start' }

      -- but allow some types of conceal in math reagions:
      -- a=accents/ligatures d=delimiters m=math symbols
      -- g=Greek  s=superscripts/subscripts
      vim.g['tex_conceal'] = 'gm'

      require 'quarto'.setup {
        lspFeatures = {
          enabled = true,
          languages = { 'r', 'python', 'julia' },
          chunks = 'curly', -- 'curly' or 'all'
          diagnostics = {
            enabled = true,
            triggers = { "BufWrite" }
          },
          completion = {
            enabled = true
          }
        }
      }
    end,
    ft = "quarto",
    keys = {
      { "<leader>qa",   ":QuartoActivate<cr>",                           desc = "quarto activate" },
      { "<leader>qp",   ":lua require'quarto'.quartoPreview()<cr>",      desc = "quarto preview" },
      { "<leader>qq",   ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
      { "<leader>qh",   ":QuartoHelp ",                                  desc = "quarto help" },
      { "<leader>qe",   ":lua require'otter'.export()<cr>",              desc = "quarto export" },
      { "<leader>qE",   ":lua require'otter'.export(true)<cr>",          desc = "quarto export overwrite" },
      { "<leader>qrr",  ":QuartoSendAbove<cr>",                          desc = "quarto run to cursor" },
      { "<leader>qra",  ":QuartoSendAll<cr>",                            desc = "quarto run all" },
      { "<leader><cr>", ":SlimeSend<cr>",                                desc = "send code chunk" },
      { "<c-cr>",       ":SlimeSend<cr>",                                desc = "send code chunk" },
      { "<c-cr>",       "<esc>:SlimeSend<cr>i",                          mode = "i",                      desc = "send code chunk" },
      { "<c-cr>",       "<Plug>SlimeRegionSend<cr>",                     mode = "v",                      desc = "send code chunk" },
      { "<cr>",         "<Plug>SlimeRegionSend<cr>",                     mode = "v",                      desc = "send code chunk" },
      { "<leader>ctr",  ":split term://R<cr>",                           desc = "terminal: R" },
      { "<leader>cti",  ":split term://ipython<cr>",                     desc = "terminal: ipython" },
      { "<leader>ctp",  ":split term://python<cr>",                      desc = "terminal: python" },
      { "<leader>ctj",  ":split term://julia<cr>",                       desc = "terminal: julia" },
    },
  },

  {
    "jmbuhr/otter.nvim",
    opts = {},
  },

  -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  {
    "jpalardy/vim-slime",
    init = function()
      vim.b["quarto_is_" .. "python" .. "_chunk"] = false
      Quarto_is_in_python_chunk = function()
        require("otter.tools.functions").is_otter_language_context("python")
      end

      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return a:text
      end
      endfunction
      ]])

      local function mark_terminal()
        vim.g.slime_last_channel = vim.b.terminal_job_id
        vim.print(vim.g.slime_last_channel)
      end

      local function set_terminal()
        vim.b.slime_config = { jobid = vim.g.slime_last_channel }
      end

      -- slime, neovvim terminal
      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1

      require("which-key").register({
        ["<leader>cm"] = { mark_terminal, "mark terminal" },
        ["<leader>cs"] = { set_terminal, "set terminal" },
      })
    end,
  },

  -- paste an image to markdown from the clipboard
  -- :PasteImg,
  'ekickx/clipboard-image.nvim',

  -- display images in the terminal!
  { 'edluffy/hologram.nvim',
    config = function()
      -- require'hologram'.setup{
      --   auto_display = true
      -- }
    end
  },
}
