-- window에서 사용할 경우 window환경에서 사용할  gcc설치가 필요함
-- minGW 설치 하자
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "javascript",
                    "html",
                    "css",
                    "java",
                    "python",
                    "bash",
                    "cmake",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
