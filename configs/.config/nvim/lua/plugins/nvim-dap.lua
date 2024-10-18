-- ~/.config/nvim/lua/plugins/nvim-dap.lua

return {
    "mfussenegger/nvim-dap",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        -- Initialize mason and mason-nvim-dap
        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = { "codelldb", "delve" },
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })

        -- UI setup
        dapui.setup()

        -- Listeners to auto-open/close dap-ui
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

        -- Python setup
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    return "/usr/bin/python"
                end,
            },
        }

        -- Go setup
        dap.configurations.go = {
            {
                type = "delve",
                name = "Debug",
                request = "launch",
                program = "${file}"
            },
        }

        -- C, C++, and Rust setup using codelldb
        dap.configurations.c = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c
    end,
}
