return {
  "metakirby5/codi.vim",
  config = function()
    vim.g["codi#virtual_text"] = 0
    vim.g["codi#autocmd"] = "InsertLeave"
    vim.g["codi#width"] = 60
    vim.g["codi#rightalign"] = 0
    vim.g["codi#autoclose"] = 1
  end
}
