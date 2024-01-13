local opts = require("plugins.lsp.lspconfig.handlers").opts
local pid = vim.fn.getpid()

local mason_bin_dir = vim.fn.stdpath("data") .. "/mason/bin/"
local omnisharp_bin = mason_bin_dir .. "omnisharp"

require("lspconfig")["omnisharp"].setup({
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  capabilities = opts.capabilities,
  on_attach = function(_, bufnr)
    opts.on_attach(nil, bufnr)

    local dap = require("dap")
    dap.adapters.coreclr = {
      type = "executable",
      command = mason_bin_dir .. "netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          local ddl = vim.fn.getcwd() .. "/bin/Debug/"
          vim.ui.input({ prompt = "Path to dll: " .. ddl }, function(input)
            ddl = ddl .. input
          end)
          return ddl
        end,
      },
    }
  end,
})
