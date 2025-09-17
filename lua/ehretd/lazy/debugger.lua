return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local dapvt = require("nvim-dap-virtual-text")

        dapui.setup({
            icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
            controls = {
                icons = {
                    pause = "⏸",
                    play = "▶",
                    step_into = "⏎",
                    step_over = "⏭",
                    step_out = "⏮",
                    step_back = "b",
                    run_last = "▶▶",
                    terminate = "⏹",
                    disconnect = "⏏",
                    restart = "↻",
                    breakpoints = "⚫",
                    clear_breakpoints = "🗑️",
                    conditional_breakpoint = "🟡",
                    log_point = "🟢",
                },
            },
        })

        dapvt.setup({
            commented = false,
            virt_text_pos = "eol",
            all_frames = false,
        })

        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { "/Users/ehret/dev-tools/js-debug/src/dapDebugServer.js", "${port}" },
            }
        }

        dap.adapters["pwa-chrome"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { "/Users/ehret/dev-tools/js-debug/src/dapDebugServer.js", "${port}" },
            }
        }

        for _, language in ipairs({ "typescript", "javascript", "javascriptreact", "typescriptreact" }) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach debugger to existing `node --inspect` process",
                    processId = require("dap.utils").pick_process,
                    port = 9229,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Launch Chrome against localhost",
                    url = "http://localhost:3000",
                    webRoot = "${workspaceFolder}",
                    skipFiles = { "**/node_modules/**" },
                },
            }
        end

        require("dap-go").setup({
            delve = {
                detached = vim.fn.has("win32") == 0,
            }
        })

        local dapui_open = false

        vim.keymap.set("n", "<leader>do", function()
            if dapui_open then
                dapui.close()
                dapui_open = false
            else
                dapui.open()
                dapui_open = true
            end
        end, { desc = "Toggle DAP UI" })

        vim.keymap.set("n", "<leader>dc", function()
            dap.continue()
        end)
        vim.keymap.set("n", "<leader>o", function()
            dap.step_over()
        end)
        vim.keymap.set("n", "<leader>i", function()
            dap.step_into()
        end)
        vim.keymap.set("n", "<leader>O", function()
            dap.step_out()
        end)
        vim.keymap.set("n", "<leader>b", function()
            dap.toggle_breakpoint()
        end)
        vim.keymap.set("n", "<leader>B", function()
            dap.set_breakpoint()
        end)
        -- vim.keymap.set("n", "<leader>lp", function()
        -- 	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        -- end)
        vim.keymap.set("n", "<leader>dr", function()
            dap.repl.open()
        end)
        vim.keymap.set("n", "<leader>dl", function()
            dap.run_last()
        end)
    end,
}
