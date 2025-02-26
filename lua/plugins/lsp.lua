return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local servers = {
                "lua_ls",
                "clangd",
                "cmake",
                "cssls",
                "ts_ls",
                "jdtls",
                "pyright",
                "gradle_ls",
                "html",
            }

            local function on_attach(client, bufnr)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to Reference" })
                vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
                vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to Type definition" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
            end

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = servers
            })

            local lspconfig = require("lspconfig")

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    on_attach = on_attach,
                })
            end
        end
    }
}
