return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    { '<leader>ff', function() Snacks.picker.files() end, desc = '[F]ind [F]iles' },
    { '<leader>fg', function() Snacks.picker.grep() end, desc = '[F]ind by [G]rep' },
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = '[F]ind [B]uffers' },
    { '<leader>fh', function() Snacks.picker.help() end, desc = '[F]ind [H]elp' },
    { '<leader>fk', function() Snacks.picker.keymaps() end, desc = '[F]ind [K]eymaps' },
    { '<leader>fr', function() Snacks.picker.recent() end, desc = '[F]ind [R]ecent' },
    { '<leader>fc', function() Snacks.picker.commands() end, desc = '[F]ind [C]ommands' },
    { '<leader>fw', function() Snacks.picker.grep_word() end, desc = '[F]ind current [W]ord' },
  },
  opts = {
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
}
