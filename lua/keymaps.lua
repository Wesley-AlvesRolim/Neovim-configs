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

-- Increment/Decrement numbers
keymap("n", "<A-+>", "<C-A>", { desc = "Increment" })
keymap("n", "<A-->", "<C-X>", { desc = "Decrement" })

-- Resize Windows
keymap("n", "<C-Up>", ":horizontal resize +3<CR>")
keymap("n", "<C-Down>", ":horizontal resize -3<CR>")
keymap("n", "<C-Left>", ":vertical resize +3<CR>")
keymap("n", "<C-Right>", ":vertical resize -3<CR>")

-- Move current line / block with Alt-j/k like vscode.
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Nvim.Tree
keymap({ "n" }, "<C-B>", ":NvimTreeToggle<CR>")

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>so", builtin.oldfiles, { desc = "[S]earch [O]ld files: Find recently opened files" })
keymap("n", "<leader>sb", builtin.buffers, { desc = "[S]earch Buffers: Find existing buffers" })
keymap(
  "n",
  "<leader>sz",
  builtin.current_buffer_fuzzy_find,
  { desc = "[S]earch Fu[z]zilly: Fuzzily search in current buffer]" }
)

keymap("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap(
  "n",
  "<leader>sa",
  "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
  { desc = "[S]earch [A]ll" }
)
keymap("n", "<leader>sh", builtin.help_tags, { desc = "Help page" })
keymap("n", "<leader>cm", builtin.git_commits, { desc = "Git [c]o[m]mits" })
keymap("n", "<leader>gs", builtin.git_status, { desc = "[G]it [s]tatus" })
keymap("n", "<leader>ma", builtin.marks, { desc = "telescope bookmarks" })
