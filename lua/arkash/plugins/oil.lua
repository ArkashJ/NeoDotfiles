return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    default_file_explorer = false,
    view_options = {
      show_hidden = true,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open Oil (edit dir as buffer)" })
  end,
}
