return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mxsdev/nvim-dap-vscode-js",
    {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
    },
    "rcarriga/nvim-dap-ui"
  },
  config = function()
    -- DAP
    local dap, dapui = require("dap"), require("dapui")

    -- Set keymaps to control the debugger
    vim.keymap.set('n', '<F5>', require 'dap'.continue)
    vim.keymap.set('n', '<F10>', require 'dap'.step_over)
    vim.keymap.set('n', '<F11>', require 'dap'.step_into)
    vim.keymap.set('n', '<F12>', require 'dap'.step_out)
    vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
    vim.keymap.set('n', '<leader>B', function()
      require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end)

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end

    require("dap-vscode-js").setup({
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
      -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
      -- log_file_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug/" .. "src/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    })

    -- DAP UI
    dapui.setup()

    vim.keymap.set('n', '<leader>ui', dapui.toggle)
  end
}
