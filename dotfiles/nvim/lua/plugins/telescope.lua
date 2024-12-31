return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    -- A plugin for displaying the outline of the current file in a floating window
    "stevearc/aerial.nvim",
  },

  config = function()

    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'
    local fb_actions = telescope.extensions.file_browser.actions

    local function telescope_buffer_dir()
      return vim.fn.expand('%:p:h')
    end

    telescope.setup {
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
            --["-"] = fb_actions.goto_parent_dir,
            ["d"] = actions.delete_buffer,
          },
        },
      },
      extensions = {
        file_browser = {
          path = "%:p:h",
          grouped = true,
          --hijack_netrw = true,
          hide_parent_dir = true,
          hidden = true,
          initial_mode = "normal",
          no_ignore = true,
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/{.git,node_modules}/*" },
        }
      }
    }

    telescope.load_extension("file_browser")
    telescope.load_extension("aerial")

    -- Keybinds

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    --keymap("n", "<C-p>", [[<Cmd>lua require("telescope.builtin").git_files()<CR>]], opts)
    -- File browser
    --keymap("n", "-", [[<Cmd>lua require("telescope").extensions.file_browser.file_browser({})<CR>]], opts)
    -- Aerial
    keymap("n", "<space>fo", [[<Cmd>lua require("telescope").extensions.aerial.aerial()<CR>]], opts)
    keymap('n', '<space><space>', builtin.find_files, opts)
    keymap('n', '<space>fg', builtin.live_grep, opts)
    keymap('n', '<space>b', "<Cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<CR>", opts)
  end
}
