local icons = require("config.icons")

return {
  setup = function()
    require("gitsigns").setup({
      signs = {
        add = { text = icons.git.add.text },
        change = { text = icons.git.change.text },
        delete = { text = icons.git.delete.text },
        topdelete = { text = icons.git.topdelete.text },
        changedelete = { text = icons.git.changedelete.text },
        untracked = { text = icons.git.untracked.text },
      },
    })
  end,
}
