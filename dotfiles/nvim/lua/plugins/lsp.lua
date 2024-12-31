return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
      -- Enable completion triggered by <c-x><c-o>
      --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
      -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      -- vim.keymap.set('n', '<space>wl', function()
      --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, bufopts)
      -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      -- vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, bufopts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      -- vim.keymap.set('n', '<space>f',function() vim.lsp.buf.format { async = true } end, bufopts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig.configs'

    lspconfig['ts_ls'].setup{
      capabilities = capabilities,
    }

    lspconfig['rust_analyzer'].setup {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          check = {
            extraArgs = {"-r"}
          }
        }
      },
    }

    lspconfig['tailwindcss'].setup {
      capabilities = capabilities,
      filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ", "rust" },
      init_options = {
        userLanguages = {
          rust = "html"
        }
      },
      experimental = {
        classRegex = {
          [[class="([^"]*)]],
          "class=\\s+\"([^\"]*)",
          "\\.\\s+\"([^\"]*)",
          "\\w+((?:\\.\\s*\\S+\\s*)*)",
          "\\.\"?([^.\"]+)\"?"
        },
      },
    }

    lspconfig.html.setup {
      capabilities = capabilities,
    }

    lspconfig['cssls'].setup {
      capabilities = capabilities,
    }

    lspconfig["prismals"].setup {
      capabilities = capabilities,
    }

    lspconfig["dartls"].setup {}

    lspconfig["svelte"].setup {}

    lspconfig["volar"].setup {}

    --[[
    lspconfig["phpactor"].setup {
      n_attach = on_attach,
      init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
      }
    }
    ]]--
    
    lspconfig["phpactor"].setup {}

    lspconfig["gopls"].setup {}

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      }
    )

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = {
        -- prefix = '●'
      },
      update_in_insert = true,
      float = {
        source = "always", -- Or "if_many"
      },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        --vim.keymap.set('n', '<space>wl', function()
        --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        --vim.keymap.set('n', '<space>f', function()
        --  vim.lsp.buf.format { async = true }
        --end, opts)
      end,
    })

    -- ####################
    -- ## lspsaga
    -- ####################
    --require("lspsaga").setup({})

    --keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    --keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
    --keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
    --keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
    --keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
    --keymap("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts)
    --keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

    -- Disabling since I only need to jump between errors
    -- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    -- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

    -- Jump between errors 
    --keymap("n", "<space>e", function()
    --  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    --end, opts)
    --keymap("n", "<space>r", function()
    --  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    --end, opts)


    -- //////////////
    -- Toggleterm
    -- //////////////


  end
}
