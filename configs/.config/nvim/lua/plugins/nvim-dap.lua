return {
    "mfussenegger/nvim-dap",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        require("dap-python").setup("~/.venv/bin/python")
        require("dap-go").setup()
        require("dapui").setup()
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
    end,
}
