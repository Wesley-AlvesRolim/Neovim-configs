local merge = require("utils").merge

local function keymap(mode, keys, callback, opts)
	local default_opts = {
		silent = true,
		noremap = true,
	}
	if type(opts) == "table" then
		opts = merge(default_opts, opts)
	else
		opts = default_opts
	end
	vim.keymap.set(mode, keys, callback, opts)
end

-- quit
keymap("n", "<leader>q", ":q<CR>", { desc = "[Q]uit" })

-- save
keymap("n", "<leader>w", ":w<CR>", { desc = "[W]rite" })
keymap("i", "<C-s>", "<C-c>:w<CR>", { desc = "[S]ave" })

-- Move current line / block with Alt-j/k like vscode.
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Window swap
keymap("n", "<C-H>", "<C-w>h")
keymap("n", "<C-L>", "<C-w>l")
keymap("n", "<C-J>", "<C-w>j")
keymap("n", "<C-K>", "<C-w>k")

-- Nvim.Tree
keymap({ "n", "i" }, "<C-B>", ":NvimTreeToggle<CR>")

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
