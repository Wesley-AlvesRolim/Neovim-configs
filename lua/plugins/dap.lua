local merge = require("utils").merge
local opts = { mode = "n", noremap = true, silent = true }

local function map(keymap, module, desc)
  return merge({
    keymap,
    function()
      require("dap")[module]()
    end,
    desc = "DAP: " .. desc,
  }, opts)
end

local M = {
  "mfussenegger/nvim-dap",
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "go" },
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    "theHamsta/nvim-dap-virtual-text",
    "LiadOz/nvim-dap-repl-highlights",
  },
  keys = {
    merge({
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "DAP UI: toggle",
    }, opts),
    map("<F5>", "continue", "Continue"),
    map("<S-F5>", "terminate", "Terminate"),
    map("<F9>", "toggle_breakpoint", "Breakpoint"),
    map("<S-F9>", "clear_breakpoints", "Clear Breakpoint"),
    map("<F10>", "step_over", "Step Over"),
    map("<F11>", "step_into", "Step Into"),
    map("<S-F11>", "step_out", "Step Out"),
  },
}

M.config = function()
  local dap = require("dap")
  local dapui = require("dapui")
  local dap_vt = require("nvim-dap-virtual-text")

  dap_vt.setup({})
  dapui.setup()
  require("nvim-dap-repl-highlights").setup()

  M.config_icons()
  M.config_listeners(dap, dapui)
  M.config_go(dap)
  M.config_ts(dap)
end

function M.config_listeners(dap, dapui)
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

function M.config_icons()
  local define = vim.fn.sign_define
  define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
  define("DapBreakpointRejected", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
  define("DapBreakpointCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
  define(
    "DapStopped",
    { text = " ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DapStoppedLine" }
  )
  define("DapLogPoint", { text = ".>", texthl = "", linehl = "", numhl = "" })
end

function M.config_go(dap)
  dap.adapters.go = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
      args = { "dap", "-l", "127.0.0.1:${port}" },
    },
  }
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      -- program = vim.fn.fnamemodify(".", ":p:h:gs?") .. "/src/main.go",
      program = "${file}",
    },
  }
end

function M.config_ts(dap)
  dap.adapters.firefox = {
    type = "executable",
    command = "node",
    args = {
      vim.fn.stdpath("data") .. "/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js",
    },
  }

  dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = {
      vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
    },
  }

  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {
      vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js",
    },
  }

  dap.configurations.typescript = {
    -- Working configs 🎉
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Node - Attach to process",
      type = "node2",
      request = "attach",
      processId = require("dap.utils").pick_process,
    },
    {
      name = "Firefox - Launch localhost",
      type = "firefox",
      request = "launch",
      reAttach = true,
      sourceMaps = true,
      url = "http://localhost:3000",
      -- TODO - webRoot should be set directly to workspaceFolder
      webRoot = "${workspaceFolder}/src",
      firefoxExecutable = "/usr/bin/firefox",
    },
    {
      name = "Chrome - Launch localhost",
      type = "chrome",
      request = "launch",
      runtimeExecutable = "/usr/bin/chromium",
      -- TODO - webRoot should be set directly to workspaceFolder
      webRoot = "${workspaceFolder}/src/build",
      url = "http://localhost:3000",
    }, -- Not tested configs yet 🙀
    {
      name = "Nope - Node launch file",
      type = "node2",
      request = "launch",
      runtimeExecutable = "npm",
      runtimeArgs = { "run", "dev" },
      args = { "${file}" },
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      name = "Nope - Debug with Chrome",
      type = "chrome",
      request = "attach",
      sourceMaps = true,
      program = "${file}",
      port = 9222,
      webRoot = "${workspaceFolder}/src",
    },
    {
      name = "Nope - Run npm run dev",
      command = "npm run dev",
      request = "launch",
      type = "node-terminal",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Nope - Node - Launch with pwa-node",
      program = "${file}",
      cwd = "${workspaceFolder}",
      port = 9229,
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Nope - Node - Attach with pwa-node",
      processId = require("dap.utils").pick_process,
      -- cwd = "${workspaceFolder}/src",
      -- port = 9229,
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Nope - Node - Debug Jest Tests with pwa-node",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/jest/bin/jest.js", "--runInBand" },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }

  dap.configurations.typescriptreact = dap.configurations.typescript
  dap.configurations.javascript = dap.configurations.typescript
  dap.configurations.javascriptreact = dap.configurations.typescript
end

return M
