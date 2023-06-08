local keymap = vim.keymap.set

-- paste "'"
keymap("i", "<C-v>", "'", { silent = true })

-- Move current line / block with Alt-j/k like vscode.
keymap("n", "<A-j>", ":m .+1<CR>==", { silent = true })
keymap("n", "<A-k>", ":m .-2<CR>==", { silent = true })
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", { silent = true })
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", { silent = true })
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true })

-- Nvim.Tree
keymap("n", "<C-B>", ":NvimTreeToggle<CR>", { silent = true })
keymap("i", "<C-B>", "<C-c>:NvimTreeToggle<CR>", { silent = true })

-- save
keymap("n", "<leader>w", ":w<CR>", { silent = true })
keymap("i", "<C-s>", "<C-c>:w<CR>", { silent = true })

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
keymap("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
keymap("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily search in current buffer]" })

keymap("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
