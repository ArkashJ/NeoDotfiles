return {
  "akinsho/bufferline.nvim",
  dependencies = {'nvim-tree/nvim-web-devicons'},
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      close_command = "bdelete! %d",
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      diagnostics =  "nvim_lsp",
    }
  }
}
