local function rebuild_project(co, path)
  local spinner = require("easy-dotnet.ui-modules.spinner").new()
  spinner:start_spinner "Building"
  vim.fn.jobstart(string.format("dotnet build %s", path), {
    on_exit = function(_, return_code)
      if return_code == 0 then
        spinner:stop_spinner "Built successfully"
      else
        spinner:stop_spinner("Build failed with exit code " .. return_code, vim.log.levels.ERROR)
        error "Build failed"
      end
      coroutine.resume(co)
    end,
  })
  coroutine.yield()
end

return {
  "mfussenegger/nvim-dap",
  enabled = true,
  config = function()
    local dap = require "dap"
    local dotnet = require "easy-dotnet"
    local dapui = require "dapui"
    dap.set_log_level "TRACE"

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end


    vim.keymap.set("n", "q", function()
      dap.close()
      dapui.close()
    end, {})

    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, {})
    vim.keymap.set("n", "<leader>dj", dap.down, {})
    vim.keymap.set("n", "<leader>dk", dap.up, {})
    vim.keymap.set("n", "<leader>dh", require("dap.ui.widgets").hover, {})

    vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "DEBUG: Toggle breakpoint" })
    vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "DEBUG: Run to cursor" })

    vim.keymap.set("n", "<space>g?", function()
        ui.eval(nil, { enter = true })
    end, { desc = "DEBUG: Eval value under cursor" })

    vim.keymap.set("n", "<F6>", dap.continue, { desc = "DEBUG: Start/Continue" })
    vim.keymap.set("n", "<F7>", dap.step_into, { desc = "DEBUG: Step into" })
    vim.keymap.set("n", "<F8>", dap.step_over, { desc = "DEBUG: Step over" })
    vim.keymap.set("n", "<F9>", dap.step_out, { desc = "DEBUG: Step out" })
    vim.keymap.set("n", "<F10>", dap.step_back, { desc = "DEBUG: Step back" })
    vim.keymap.set("n", "<F11>", dap.restart, { desc = "DEBUG: Restart" })
    vim.keymap.set("n", "<F12>", dap.close, { desc = "DEBUG: Stop" })

    local function file_exists(path)
      local stat = vim.loop.fs_stat(path)
      return stat and stat.type == "file"
    end

    local debug_dll = nil

    local function ensure_dll()
      if debug_dll ~= nil then
        return debug_dll
      end
local dll = dotnet.get_debug_dll()
      debug_dll = dll
      return dll
    end

    for _, value in ipairs { "cs", "fsharp" } do
      dap.configurations[value] = {
        {
          type = "coreclr",
          name = "Program",
          request = "launch",
          env = function()
            local dll = ensure_dll()
            local vars = dotnet.get_environment_variables(dll.project_name, dll.absolute_project_path)
            return vars or nil
          end,
          program = function()
            local dll = ensure_dll()
            local co = coroutine.running()
            rebuild_project(co, dll.project_path)
            if not file_exists(dll.target_path) then
              error("Project has not been built, path: " .. dll.target_path)
            end
            return dll.target_path
          end,
          cwd = function()
            local dll = ensure_dll()
            return dll.absolute_project_path
          end,
        },
      }

      dap.listeners.before["event_terminated"]["easy-dotnet"] = function()
        debug_dll = nil
      end

      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.exepath("netcoredbg"),
        args = { "--interpreter=vscode" },
        options = { detached = false, },
      }
    end
  end,
  dependencies = {
    { "nvim-neotest/nvim-nio", },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
    },
    { 'Samsung/netcoredbg', },
    { 'theHamsta/nvim-dap-virtual-text', },
  },
}
