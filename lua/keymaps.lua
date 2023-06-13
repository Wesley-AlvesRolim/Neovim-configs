local keymap = vim.keymap.set
local del_keymap = vim.keymap.del
local opts = {
	silent = true,
	noremap = true,
}

-- quit
keymap("n", "<leader>q", ":q<CR>", opts)

-- save
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("i", "<C-s>", "<C-c>:w<CR>", opts)

-- Move current line / block with Alt-j/k like vscode.
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Window swap
keymap("n", "<C-H>", "<C-w>h", opts)
keymap("n", "<C-L>", "<C-w>l", opts)
keymap("n", "<C-J>", "<C-w>j", opts)
keymap("n", "<C-K>", "<C-w>k", opts)

-- Nvim.Tree
keymap({ "n", "i" }, "<C-B>", ":NvimTreeToggle<CR>", opts)

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

-- Pomodoro
local pomodoro_opts = opts
pomodoro_opts.desc = "[P]omodoro [T]imer"
del_keymap("n", "\\p", opts)
keymap({ "n", "i" }, "<leader>pt", require("pomodoro").display_popup, pomodoro_opts)
