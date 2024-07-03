return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"karb94/neoscroll.nvim",
  config = function ()
    require('neoscroll').setup({})
  end},
}
