return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter.configs"

    ts.setup {
      auto_install = false,
      sync_install = false,
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = true,
        disable = {},
      },
      ensure_installed = {
        "javascript",
        "tsx",
        "toml",
        "json",
        "yaml",
        "css",
        "scss",
        "html",
        "lua",
        "rust",
        "markdown",
        "markdown_inline",
        "svelte",
        "vue",
        "php",
        "go"
      },
    }

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}
