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
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true ,
      show_duplicate_prefix = true, 
      auto_toggle_bufferline = true ,
      hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
      },
    }
  }
}
