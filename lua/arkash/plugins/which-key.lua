return {
  "folke/which-key.nvim",
  event = "Verylazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- leave opts empty for default
  },
}
