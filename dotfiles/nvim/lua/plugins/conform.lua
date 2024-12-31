return {
  'stevearc/conform.nvim',
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        toml = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        rust = { "rustfmt" },
        css = { "prettierd", "prettier", stop_after_first = true },
        dart = { "dart_fmt" },
        vue = { "prettierd", "prettier", stop_after_first = true },
        php = { "prettierd", "prettier", stop_after_first = true },
        go = { "gofmt" },
      },
      formatters = {
        rustfmt = {
          meta = {
            url = "https://github.com/rust-lang/rustfmt",
            description = "A tool for formatting Rust code according to style guidelines.",
          },
          command = "rustfmt",
          args = { "--edition", "2021" } 
        }
      },
      --format_on_save = {
      --  timeout_ms = 500,
      --  lsp_fallback = true,
      --},
    }) 

   
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf, quiet = true })
      end
    })
  end
}
