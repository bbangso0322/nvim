return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,
    init = function()
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN]  = '',
                    [vim.diagnostic.severity.INFO]  = '',
                    [vim.diagnostic.severity.HINT]  = '󰌵',
                },
            }
        })


    -- git_status = {
    --   symbols = {
    --     -- Change type
    --     added = "", -- or "✚"
    --     modified = "", -- or ""
    --     deleted = "✖", -- this can only be used in the git_status source
    --     renamed = "󰁕", -- this can only be used in the git_status source
    --     -- Status type
    --     untracked = "",
    --     ignored = "",
    --     unstaged = "󰄱",
    --     staged = "",
    --     conflict = "",
    --   },
    -- },
    end,
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_hidden = false,
                }
            }
        })
    end,
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neo-tree toggle", },
        { "<leader>r", "<cmd>Neotree reveal<cr>", desc = "Neo-tree reveal", }
    }
}
