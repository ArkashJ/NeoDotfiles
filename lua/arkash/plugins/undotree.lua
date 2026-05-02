return {
  "mbbill/undotree",
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle undo tree" })
  end,
}
