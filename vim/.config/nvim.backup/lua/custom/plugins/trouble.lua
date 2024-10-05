return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end,
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true } },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true } },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true } },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true } },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true } },
    { "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true } }
  }
}
