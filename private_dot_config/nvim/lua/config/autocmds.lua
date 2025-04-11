-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set filetype yaml for eruby-yaml
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = "*.yml",
  command = "setlocal filetype=yaml",
})
-- Map the custom gf function to gf in Rails files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "eruby", "html.erb" },
  callback = function()
    vim.keymap.set("n", "gf", ":Railsgf<cr>", { buffer = true, noremap = true, silent = true })
  end,
})
