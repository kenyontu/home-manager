local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.number = false
--vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.updatetime = 300

-- Force the gutter to stay open instead of constantly openning and closing
--vim.opt.signcolumn = "yes"
vim.opt.signcolumn = "no"

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key keymaps
keymap("n", "<space>w", ":w<CR>", opts)
keymap("n", "<space>q", ":q<CR>", opts)

-- Clears search highlight
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- Change panes
keymap("n", "<C-j>", "<C-W>j")
keymap("n", "<C-k>", "<C-W>k")
keymap("n", "<C-h>", "<C-W>h")
keymap("n", "<C-l>", "<C-W>l")

-- Diagnostics
keymap("n", "<leader>d", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Open definition in a vertical split
keymap("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>")

-- Disabling keybinds that I don"t use to avoid misclicks
keymap("n", "Q", "<Nop>", opts)
keymap("n", "q", "<Nop>", opts)
keymap("i", "<F1>", "<Nop>", opts)
keymap("i", "<F2>", "<Nop>", opts)
keymap("i", "<F3>", "<Nop>", opts)
keymap("i", "<F4>", "<Nop>", opts)
keymap("i", "<F5>", "<Nop>", opts)
keymap("i", "<F6>", "<Nop>", opts)
keymap("i", "<F7>", "<Nop>", opts)
keymap("i", "<F8>", "<Nop>", opts)
keymap("i", "<F9>", "<Nop>", opts)
keymap("i", "<F10>", "<Nop>", opts)
keymap("i", "<F11>", "<Nop>", opts)
keymap("i", "<F12>", "<Nop>", opts)

-- Center after a jump
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Runs :w when typing :W 
vim.api.nvim_create_user_command("W", "w", {})

-- Runs :q when typing :Q 
vim.api.nvim_create_user_command("Q", "q", {})

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
