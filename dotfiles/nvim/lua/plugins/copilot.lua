return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  enabled = true,
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          accept = false,
          jump_prev = false,
          jump_next = false,
          refresh = false,
          open = false,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-g>",
          accept_word = false,
          accept_line = false,
          next = false,
          prev = false,
          dismiss = false,
        },
      },
    })

  end
}

