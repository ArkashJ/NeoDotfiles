# Neovim — arkash config

A from-scratch personal Neovim setup, written in Lua, plugin-managed by lazy.nvim.

## Layout

```
~/.config/nvim/
├── init.lua                 -- entrypoint: requires arkash.core + arkash.lazy
└── lua/arkash/
    ├── core/
    │   ├── init.lua
    │   ├── options.lua      -- numbers, tabs, search, splits, clipboard
    │   └── keymaps.lua      -- leader=<space>; window/tab/highlight bindings
    ├── lazy.lua             -- bootstraps lazy.nvim; imports arkash.plugins(.lsp)
    └── plugins/
        ├── init.lua         -- plenary, vim-tmux-navigator
        ├── colorscheme.lua  -- tokyonight
        ├── telescope.lua    -- fuzzy file/string finder
        ├── nvim-tree.lua    -- file explorer
        ├── lualine.lua      -- status bar
        ├── bufferline.lua   -- buffer tabs
        ├── alpha.lua        -- startup screen
        ├── dressing.lua     -- UI input/select improvements
        ├── which-key.lua    -- keybinding help
        ├── gitsigns.lua     -- git diff signs in gutter
        ├── treesitter.lua   -- syntax parsing
        ├── autopairs.lua    -- auto-close brackets
        ├── comment.lua      -- toggle comments
        ├── indent-blankline.lua  -- indent guides
        ├── todo-comments.lua     -- TODO highlight
        ├── auto-session.lua      -- session restore
        ├── formatting.lua   -- conform (code formatter)
        ├── linting.lua      -- nvim-lint (linter)
        ├── nvim-cmp.lua     -- completion
        ├── markdown.lua     -- markdown utils
        ├── aerial.lua       -- code outline sidebar
        ├── vim-maximimzer.lua    -- toggle window zoom
        ├── distant.lua      -- remote editing
        ├── harpoon.lua      -- quick file navigation
        ├── flash.nvim       -- speed jump navigation
        ├── trouble.nvim     -- diagnostic/quickfix sidebar
        ├── oil.nvim         -- buffer-based file browser
        ├── nvim-surround.lua     -- text object surrounding
        ├── undotree.lua     -- undo history tree
        └── lsp/
            ├── mason.lua         -- LSP/tool manager
            └── lspconfig.lua     -- language server setup
```

## Install

```sh
git clone https://github.com/ArkashJ/NeoDotfiles.git ~/.config/nvim
nvim                # lazy.nvim auto-installs plugins on first launch
```

## Keybindings Reference

| Mode | Mapping | Action | Source |
|------|---------|--------|--------|
| n | `<space>` | Leader key | Core |
| n | `<leader>nh` | Clear search highlights | Core |
| n | `<leader>+` | Increment number | Core |
| n | `<leader>-` | Decrement number | Core |
| n | `<leader>sv` | Split window vertically | Core |
| n | `<leader>sh` | Split window horizontally | Core |
| n | `<leader>se` | Make splits equal size | Core |
| n | `<leader>sx` | Close current split | Core |
| n | `<leader>to` | Open new tab | Core |
| n | `<leader>tx` | Close current tab | Core |
| n | `<leader>tn` | Go to next tab | Core |
| n | `<leader>tp` | Go to previous tab | Core |
| n | `<leader>tf` | Open buffer in new tab | Core |
| n | `<leader>ff` | Fuzzy find files in cwd | Telescope |
| n | `<leader>fr` | Fuzzy find recent files | Telescope |
| n | `<leader>fs` | Find string in cwd | Telescope |
| n | `<leader>fc` | Find string under cursor | Telescope |
| n | `<leader>ft` | Find todos | Telescope |
| n | `<leader>ee` | Toggle file explorer | NvimTree |
| n | `<leader>ef` | Toggle explorer on current file | NvimTree |
| n | `<leader>ec` | Collapse file explorer | NvimTree |
| n | `<leader>er` | Refresh file explorer | NvimTree |
| n | `<leader>ha` | Harpoon add file | Harpoon |
| n | `<leader>hh` | Harpoon menu | Harpoon |
| n | `<leader>h1` | Select harpoon file 1 | Harpoon |
| n | `<leader>h2` | Select harpoon file 2 | Harpoon |
| n | `<leader>h3` | Select harpoon file 3 | Harpoon |
| n | `<leader>h4` | Select harpoon file 4 | Harpoon |
| n | `<leader>hp` | Go to previous harpoon file | Harpoon |
| n | `<leader>hn` | Go to next harpoon file | Harpoon |
| n,x,o | `s` | Flash jump | Flash |
| n,x,o | `S` | Flash treesitter | Flash |
| o | `r` | Remote flash | Flash |
| o,x | `R` | Treesitter search | Flash |
| c | `<C-s>` | Toggle flash search in cmdline | Flash |
| n | `<leader>xx` | Toggle diagnostics (Trouble) | Trouble |
| n | `<leader>xX` | Toggle buffer diagnostics | Trouble |
| n | `<leader>xs` | Toggle symbols | Trouble |
| n | `<leader>xL` | Toggle location list | Trouble |
| n | `<leader>xQ` | Toggle quickfix list | Trouble |
| n | `<leader>o` | Open Oil (edit dir as buffer) | Oil |
| n | `ys<motion><char>` | Surround with char | Surround |
| n | `ds<char>` | Delete surrounding char | Surround |
| n | `cs<old><new>` | Change surrounding char | Surround |
| n | `<leader>u` | Toggle undo tree | Undotree |
| n | `]h` | Next git hunk | Gitsigns |
| n | `[h` | Previous git hunk | Gitsigns |
| n | `<leader>hs` | Stage hunk | Gitsigns |
| n | `<leader>hr` | Reset hunk | Gitsigns |
| n | `<leader>hS` | Stage buffer | Gitsigns |
| n | `<leader>hR` | Reset buffer | Gitsigns |
| n | `<leader>hu` | Undo stage hunk | Gitsigns |
| n | `<leader>hp` | Preview hunk | Gitsigns |
| n | `<leader>hb` | Blame line | Gitsigns |
| n | `<leader>hB` | Toggle line blame | Gitsigns |
| n | `<leader>hD` | Diff this with prev | Gitsigns |
| n,v | `gc` | Toggle line comment | Comment |
| n,v | `gb` | Toggle block comment | Comment |
| n | `gR` | Show LSP references | LSP |
| n | `gD` | Go to declaration | LSP |
| n | `gd` | Show LSP definitions | LSP |
| n | `gi` | Show LSP implementations | LSP |
| n | `gt` | Show LSP type definitions | LSP |
| n,v | `<leader>ca` | See code actions | LSP |
| n | `<leader>rn` | Smart rename | LSP |
| n | `<leader>D` | Show buffer diagnostics | LSP |
| n | `<leader>d` | Show line diagnostics | LSP |
| n | `[d` | Go to previous diagnostic | LSP |
| n | `]d` | Go to next diagnostic | LSP |
| n | `K` | Show documentation | LSP |
| n | `<leader>rs` | Restart LSP | LSP |
| n | `<leader>ae` | Toggle code outline | Aerial |
| n,v | `<leader>mp` | Format file or range | Formatting |
| n | `<leader>l` | Trigger linting | Linting |

## Libraries / Plugins

| Plugin | Purpose |
|--------|---------|
| plenary.nvim | Lua utility functions used by many plugins |
| vim-tmux-navigator | Navigate between tmux/vim splits seamlessly |
| tokyonight | Tokyo Night color scheme |
| telescope.nvim | Fuzzy finder for files, strings, buffers, LSP |
| nvim-tree.lua | File explorer tree sidebar |
| lualine.nvim | Customizable status line |
| bufferline.nvim | Buffer tabs with icons |
| alpha.nvim | Startup dashboard screen |
| dressing.nvim | Improved UI for vim.ui.input/select |
| which-key.nvim | Keybinding helper and menu |
| gitsigns.nvim | Git diff signs in line number gutter |
| treesitter.lua | Incremental syntax parsing |
| autopairs.lua | Auto-close brackets and quotes |
| comment.lua | Toggle comments with motions |
| indent-blankline.lua | Vertical indent guides |
| todo-comments.lua | Highlight TODO/FIXME/NOTE comments |
| auto-session.lua | Auto-save/restore vim sessions |
| conform.nvim | Code formatter with LSP fallback |
| nvim-lint.lua | Async linter runner |
| nvim-cmp.lua | Completion engine with LSP/snippet sources |
| markdown.lua | Markdown utilities and preview |
| aerial.lua | Code outline tree sidebar |
| vim-maximimzer.lua | Toggle single-window zoom |
| distant.lua | Remote file editing over SSH |
| harpoon.lua | Quick mark and jump to 4 files |
| flash.nvim | Speed jump with search preview |
| trouble.nvim | Diagnostic/quickfix/loclist sidebar |
| oil.nvim | Edit directories as a buffer |
| nvim-surround.lua | Add/delete/change text surrounds |
| undotree.lua | Visual undo history tree |
| mason.nvim | Install language servers and tools |
| lspconfig.nvim | Language server configuration |

## Conventions

- **Leader key**: `<space>`
- **One file per plugin**: Each plugin has its own config file under `lua/arkash/plugins/`
- **Lazy-loaded**: Plugins use `keys`, `event`, or `cmd` triggers to defer loading
- **Binary management**: `mason` installs LSPs and tools; `conform` handles formatting; `nvim-lint` handles linting

## Write-ups

- **Part 1 — Writing my Neovim config from scratch**
  https://medium.com/@arkjain/writing-my-neovim-config-from-scratch-1e7cbfa69cb7
- **Part 2 — Adding Plugins to my Config: No Punches Pulled Back Now**
  https://medium.com/@arkjain/adding-plugins-to-my-config-8776a6140096
