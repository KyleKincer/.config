-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-b>", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-CR>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-m>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
