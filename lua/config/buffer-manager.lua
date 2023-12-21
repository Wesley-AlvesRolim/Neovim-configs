local utils = require("utils")
local keymap = vim.keymap.set
local opts = {
  silent = true,
  noremap = true,
}
vim.api.nvim_set_hl(0, "BufferManagerModified", { fg = "#fECDD3" })

return {
  keys = { "BO", "BL", "BS", "H", "L" },
  keymap = function()
    local bmui = require("buffer_manager.ui")
    local tmp_dir = "/tmp/buffer_manager"
    local project_dir = vim.fn.fnamemodify(".", ":p:h:gs?/?_?:gs?\\.??")
    local path = tmp_dir .. "/bm" .. project_dir
    keymap({ "n" }, "BL", function()
      bmui.load_menu_from_file(path)
    end, opts)
    keymap({ "n" }, "BS", function()
      utils.create_folder(tmp_dir)
      bmui.save_menu_to_file(path)
      vim.notify("Saved " .. path)
    end, opts)
    keymap({ "n" }, "BO", bmui.toggle_quick_menu, opts)
    keymap({ "n" }, "H", bmui.nav_prev, opts)
    keymap({ "n" }, "L", bmui.nav_next, opts)
  end,
  opts = {
    width = 100,
    heigth = 0.5,
    select_menu_item_commands = {
      v = {
        key = "<C-v>",
        command = "vsplit",
      },
      h = {
        key = "<C-h>",
        command = "split",
      },
    },
  },
}
