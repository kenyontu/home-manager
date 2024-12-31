return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    vim.g.catppuccin_flavour = "macchiato"
    require('catppuccin').setup()
    vim.cmd('colorscheme catppuccin')
  end
}

