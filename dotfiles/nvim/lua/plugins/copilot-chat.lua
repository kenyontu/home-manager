return {
  "CopilotC-Nvim/CopilotChat.nvim",
  enabled = false,
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" }
  },
  build = "make tiktoken",
}
