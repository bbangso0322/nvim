return {
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },

        opts = {
            interactions = {
                chat = {
                    adapter = {
                        name = "gemini",
                        model = "gemini-2.5-flash",
                    },
                },
                inline = {
                    adapter = "anthropic",
                },
                cmd = {
                    adapter = "openai",
                },
            },

            adapters = {
                http = {
                    gemini = function()
                        return require("codecompanion.adapters").extend("gemini", {
                            env = {
                                api_key = env.GEMINI_API_KEY,
                            },
                        })
                    end,
                },
            },
        },
    }
}
