local map = vim.keymap.set

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "clangd",
                    "cmake",
                    "autotools_ls",
                    "cssls",
                    "jdtls",
                    "pyright"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.clangd.setup({})
            lspconfig.cmake.setup({})
            lspconfig.autotools_ls.setup({})
            lspconfig.cssls.setup({})
            lspconfig.jdtls.setup({})
            lspconfig.pyright.setup({})

            map("n", "K", vim.lsp.buf.hover, { desc = "hover" })
            map("n", "gd", vim.lsp.buf.definition, {})
            map("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end
    }
}

