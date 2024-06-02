vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

-- press jk in insert mode to escape  
-- keymap.set("i", "jk", "<ESC>", {desc = "Exit Insert mode with jk"})

-- press n to remove highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", {desc="Clear search highlights"})

-- increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>", {desc = "Increment Number"}) -- increment
keymap.set("n", "<leader>-", "<C-x>", {desc = "Decrement Number"}) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", {desc="Split window vertically"})
keymap.set("n", "<leader>sh", "<C-w>s", {desc="Split window horizontally"})
keymap.set("n", "<leader>se", "<C-w>=", {desc="Make splits equal size"})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc="Close current split"})
