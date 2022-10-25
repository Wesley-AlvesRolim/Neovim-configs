-- paste "'"
vim.api.nvim_set_keymap("i", "<C-v>", "'", { silent = true })

-- Nvim.Tree
vim.api.nvim_set_keymap("n", "<C-B>", ":NvimTreeToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-B>", "<C-c>:NvimTreeToggle<CR>", { silent = true })

-- save CTRL + s
vim.api.nvim_set_keymap("i", "<C-s>", "<C-c>:w<CR>", { silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.git_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- Coc
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)

