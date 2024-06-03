return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua", "lua-format" },
        python = { "isort", "black" },
        rust = { "ast-grep", "rustfmt", "taplo" },
        cpp = { "astyles" },
        c = { "astyles" },
        go = { "gofmt", "goimports" },
        java = { "google-java-format" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 200,
      },
    })
    -- in visual mode select a specific block to format by using <leader>mp
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
