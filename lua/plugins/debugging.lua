return
    {
      'mfussenegger/nvim-dap',
      dependencies = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-neotest/nvim-nio',
        -- insert dap dependency specific to the language you want to debug
        'Samsung/netcoredbg',
      },
      config = function()
        local dap = require "dap"
        local ui = require "dapui"

        ui.setup()

        if not dap.adapters["netcoredbg"] then
          dap.adapters["netcoredbg"] = {
            type = "executable",
            command = vim.fn.exepath("netcoredbg"),
            args = { "--interpreter=vscode" },
            options = {
              detached = false,
            },
          }
        end
        for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
          if not dap.configurations[lang] then
            dap.configurations[lang] = {
              {
                type = "netcoredbg",
                name = "Launch file",
                request = "launch",
                ---@diagnostic disable-next-line: redundant-parameter
                program = function()
                  return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
              },
            }
          end
        end

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

        dap.listeners.before.attach.dapui_config = function()
          ui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
          ui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
          ui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
          ui.close()
        end
      end
    }

