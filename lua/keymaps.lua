local keymap = vim.keymap.set

-- paste "'"
keymap("i", "<C-v>", "'", { silent = true })

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

-- Comment
keymap("v", "<leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
	{ desc = "Toggle comment for selection" }
)
