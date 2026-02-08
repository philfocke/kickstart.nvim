return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- Dashboard config
    dashboard = {
      enabled = true, width = 60,
      row = nil,
      col = nil,
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyz',
      preset = {
        header = [[
        |
        |
        |
        |
        |
        |
        _ ----- _
        .-~             ~-.       
        /                     \
        .-- -- -- |                       | -- -- --.
        .-~ / ~~ ~~ ~~ \        O   O        / ~~ ~~ ~~ \ ~-.
        .-~   /        _ - ~ ~-.             .-~ ~ - _        \   ~-.
        /      /~          /  ~ ----- ~  \          ~\      \
        /       /           /               \           \       \
        /           /                 \           \
        /           /                   \           \
        /           |                     |           \
        |                     |
        |                     |
        |                     |
        |                     |
        ]],
      },
      sections = {
        { section = 'header' },
      },
    },
    
    -- Notifier config
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 120 },
      height = { min = 1, max = 20 },
      top_down = true,
    },
    
    -- Picker config
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['<C-c>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
    },
  },
  
  config = function(_, opts)
    require('snacks').setup(opts)
    
    -- Register picker keymaps
    local keymap = vim.keymap.set
    
    keymap('n', '<leader>ff', function() Snacks.picker.files() end, { desc = '[F]ind [F]iles' })
    keymap('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = '[F]ind by [G]rep' })
    keymap('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = '[F]ind [B]uffers' })
    keymap('n', '<leader>fh', function() Snacks.picker.help() end, { desc = '[F]ind [H]elp' })
    keymap('n', '<leader>fk', function() Snacks.picker.keymaps() end, { desc = '[F]ind [K]eymaps' })
    keymap('n', '<leader>fr', function() Snacks.picker.recent() end, { desc = '[F]ind [R]ecent' })
    keymap('n', '<leader>fc', function() Snacks.picker.commands() end, { desc = '[F]ind [C]ommands' })
    keymap('n', '<leader>fw', function() Snacks.picker.grep_word() end, { desc = '[F]ind current [W]ord' })
    
    -- Restore LSP state on startup
    vim.schedule(function()
      if vim.g.lsp_enabled == false then
        vim.cmd("LspStop")
      end
    end)
    
    -- Restore inlay hints state
    vim.schedule(function()
      if vim.g.inlay_hints_enabled == false then
        vim.lsp.inlay_hint.enable(false)
      end
    end)
  end,
}
