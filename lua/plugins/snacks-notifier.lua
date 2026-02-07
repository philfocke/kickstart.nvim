return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 120 },
      height = { min = 1, max = 20 },
      top_down = true,
    },
  },
}
