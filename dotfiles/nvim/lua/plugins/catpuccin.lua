return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    vim.g.catppuccin_flavour = "macchiato"
    require('catppuccin').setup({
      transparent_background = true,
    })
    vim.cmd('colorscheme catppuccin')
  end
}

