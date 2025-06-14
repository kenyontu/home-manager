return {
  'nvimtools/none-ls.nvim',
  enabled = false,
  config = function()
    local nls = require 'null-ls'
    local nlsb = nls.builtins

    nls.setup({
      sources = {
        -- diagnostics
        --nlsb.diagnostics.eslint,
        -- nlsb.diagnostics.write_good, -- for markdown
        nlsb.diagnostics.jsonlint,
      },
    })
  end
}
