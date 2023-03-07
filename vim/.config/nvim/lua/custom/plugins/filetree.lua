return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").load_extension "file_browser"
    end,
    keys = {
        { "<space>fb", ":Telescope file_browser<cr>",
            { noremap = true, desc = "[F]ile [B]rowser" } }
    }
}
