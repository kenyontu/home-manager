return {
  "akinsho/toggleterm.nvim", 
  version = "*",
  config = function()
    require("toggleterm").setup()

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "tab",
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    local theway = Terminal:new({
      cmd = "the-way search",
      direction = "tab",
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _theway_toggle()
      theway:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<space>s", "<cmd>lua _theway_toggle()<CR>", {noremap = true, silent = true})


    -- nvim-comment
    require("nvim_comment").setup()

    -- Aerial
    require('aerial').setup()

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')

    keymap('n', '<space>t', ':ToggleTerm dir=git_dir direction=float<CR>', opts)
    keymap('n', '<leader>t', ':ToggleTermSendCurrentLine<CR>')
    keymap('v', '<leader>t', ':ToggleTermSendVisualLines<CR>')

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      -- <esc> is used by lazygit, so we cannot remap it
      --keymap('t', '<esc>', [[<C-\><C-n>]], opts)
      keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

  end
}
