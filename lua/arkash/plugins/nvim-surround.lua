-- nvim-surround: keybindings are ys{motion}{char} to add, ds{char} to delete, cs{old}{new} to change
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end,
}
