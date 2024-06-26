return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = { "BufReadPost", "BufNewFile"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    

    config = function()
        local cmp = require("cmp")
        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        cmp.setup({
            snippet = {
                expand = function(args)
                    -- add snippet engine you need
                    -- example:
                    -- luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = function(fallback)
                    if cmp.visible() then
                    cmp.select_next_item()
                    else
                    fallback()
                    end
                end,
                ['<S-Tab>'] = function(fallback)
                    if cmp.visible() then
                    cmp.select_prev_item()
                    else
                    fallback()
                    end
                end,
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Esc>'] = cmp.mapping.close(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path", max_item_count = 3},
            }, {
                { name = "buffer", max_item_count = 3 },
            })
        })
    end
}
