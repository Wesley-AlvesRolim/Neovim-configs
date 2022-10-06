-- paste "'"
vim.api.nvim_set_keymap("i", "<C-v>", "'", { silent = true })

-- Nvim.Tree
vim.api.nvim_set_keymap("n", "<C-B>", ":NvimTreeFocus<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-B>", "<C-c>:NvimTreeFocus<CR>", { silent = true })

-- save CTRL + s
vim.api.nvim_set_keymap("i", "<C-s>", "<C-c>:w<CR>", { silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.git_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

