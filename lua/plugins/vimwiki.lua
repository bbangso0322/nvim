local path_vimwiki = require("config.var").path_vimwiki

vim.g.vimwiki_list = {
    {
        path = path_vimwiki,
        syntax = "markdown",
        ext = ".md"
    }
}

vim.g.vimwiki_global_ext = 0

return {
    "vimwiki/vimwiki",
}
