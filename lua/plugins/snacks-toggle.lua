-- ~/.config/nvim/lua/plugins/snacks-toggles.lua
-- LSP, Inlay Hints, Diagnostics toggle (separate from main Snacks config)

return {
  {
    "folke/snacks.nvim",
    keys = function()
      return {
        -- LSP Toggle
        {
          "<leader>ul",
          function()
            local lsp_enabled = vim.g.lsp_enabled ~= false
            vim.g.lsp_enabled = not lsp_enabled
            if vim.g.lsp_enabled then
              vim.schedule(function()
                vim.cmd("LspStart")
              end)
              Snacks.notify.info("LSP enabled", { title = "LSP" })
            else
              vim.schedule(function()
                vim.cmd("LspStop")
              end)
              Snacks.notify.warn("LSP disabled", { title = "LSP" })
            end
          end,
          desc = "Toggle LSP",
          mode = "n",
        },
        -- Inlay Hints Toggle
        {
          "<leader>uh",
          function()
            local hints_enabled = vim.g.inlay_hints_enabled ~= false
            vim.g.inlay_hints_enabled = not hints_enabled
            if vim.g.inlay_hints_enabled then
              vim.lsp.inlay_hint.enable(true)
              Snacks.notify.info("Inlay hints enabled", { title = "Hints" })
            else
              vim.lsp.inlay_hint.enable(false)
              Snacks.notify.warn("Inlay hints disabled", { title = "Hints" })
            end
          end,
          desc = "Toggle inlay hints",
          mode = "n",
        },
        -- Diagnostics Toggle
        {
          "<leader>ud",
          function()
            local diag_enabled = vim.diagnostic.is_enabled()
            if diag_enabled then
              vim.diagnostic.disable()
              Snacks.notify.warn("Diagnostics disabled", { title = "Diagnostics" })
            else
              vim.diagnostic.enable()
              Snacks.notify.info("Diagnostics enabled", { title = "Diagnostics" })
            end
          end,
          desc = "Toggle diagnostics",
          mode = "n",
        },
        -- Blink Completions Toggle
        {
          "<leader>uc",
          function()
            vim.b.completion = vim.b.completion ~= false and false or true
            
            if vim.b.completion then
              Snacks.notify.info("Completions enabled", { title = "Blink" })
            else
              Snacks.notify.warn("Completions disabled", { title = "Blink" })
            end
          end,
          desc = "Toggle Blink completions",
          mode = "n",
        },
      }
    end,
  },
  
  -- Update Blink config to respect completion toggle
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- Initialize completion to enabled by default
      vim.b.completion = vim.b.completion ~= false
      
      -- Make blink respect the completion toggle
      opts.enabled = function()
        return vim.b.completion ~= false
      end
      
      return opts
    end,
  },
}
