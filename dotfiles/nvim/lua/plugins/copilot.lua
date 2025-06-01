return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  enabled = false,
  config = function()
    local copilot = require("copilot")

    copilot.setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-g>",
          accept_word = false,
          accept_line = false,
          next = "<C-m>",
          prev = "<C-n>",
          dismiss = false,
        },
      },
    })


    local opts = { noremap = true, silent = true }
    vim.keymap.set('i', '<C-m>', function()
      require("copilot").next()
      end,
      opts
    )
  end
}

