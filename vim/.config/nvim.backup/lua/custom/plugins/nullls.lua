return {
  --{
  --  'jose-elias-alvarez/null-ls.nvim',

  --  config = function()
  --    local null_ls = require("null-ls")

  --    local with_root_file = function(builtin, file)
  --      return builtin.with {
  --        condition = function(utils)
  --          return utils.root_has_file(file)
  --        end,
  --      }
  --    end

  --    local sources = {
  --      -- python
  --      null_ls.builtins.formatting.yapf,
  --      null_ls.builtins.formatting.isort,

  --      -- shell
  --      null_ls.builtins.formatting.shfmt.with { extra_args = { "-i 2", "-ci" } },

  --      -- lua
  --      with_root_file(null_ls.builtins.formatting.stylua, "stylua.toml"),
  --      with_root_file(null_ls.builtins.diagnostics.selene, "selene.toml"),
  --      null_ls.builtins.diagnostics.tsc,

  --      -- lot of things
  --      null_ls.builtins.formatting.prettierd,
  --      null_ls.builtins.formatting.fixjson,
  --      -- null_ls.builtins.diagnostics.write_good,

  --      -- hover
  --      -- null_ls.builtins.hover.dictionary,
  --    }


  --    null_ls.setup({
  --      sources = sources,
  --      debug = true
  --      -- on_attach = function(_, bufnr)
  --      --   vim.keymap.set('n', '<leader>fd', vim.lsp.buf.format, { buffer = bufnr })
  --      --   print 'LSP attached (null-ls)'
  --      -- end,
  --      -- should_attach = function(bufnr)

  --      --   return not vim.api.nvim_buf_get_name(bufnr):match("qmd")
  --      -- end,
  --    })
  --  end
  --},

  -- {
  --   'jayp0521/mason-null-ls.nvim',

  --   config = function()

  --     require("mason-null-ls").setup({
  --       automatic_installation = false,
  --       automatic_setup = true,
  --       ensure_installed = nil,
  --     })

  --     require("mason-null-ls").setup_handlers({})
  --   end,
  -- },
}
