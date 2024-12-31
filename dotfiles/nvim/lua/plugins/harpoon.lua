return {
  'ThePrimeagen/harpoon',
  config = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    keymap('n', '<space>g', [[<Cmd>lua require('harpoon.mark').add_file()<CR>]], opts)
    keymap('n', '<space>h', [[<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]], opts)
    keymap('n', '<space>j', [[<Cmd>lua require('harpoon.ui').nav_file(1)<CR>]], opts)
    keymap('n', '<space>k', [[<Cmd>lua require('harpoon.ui').nav_file(2)<CR>]], opts)
    keymap('n', '<space>l', [[<Cmd>lua require('harpoon.ui').nav_file(3)<CR>]], opts)
    keymap('n', '<space>;', [[<Cmd>lua require('harpoon.ui').nav_file(4)<CR>]], opts)
  end
}
