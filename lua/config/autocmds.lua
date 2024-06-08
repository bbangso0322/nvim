local path_vimwiki = require("config.var").path_vimwiki

local function augroup(name)
    return vim.api.nvim_create_augroup("my_cmd_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufNewFile", {
    group = augroup("vimwiki_newfile"),
    pattern = { path_vimwiki .. "/*.md" },
    callback = function()
        local templates = {
            "---",
            "date: " .. os.date("%Y. %m. %d. %H:%M:%S"),
            "last_modified_at: ",
            "tags: ",
            "---",
            ""
        }

        vim.api.nvim_buf_set_lines(0, 0, 1, false, templates)
        vim.fn.setpos(".", vim.fn.getpos("$"))
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("vimwiki_savefile"),
    pattern = { path_vimwiki .. "/*.md"},
    callback = function()
        local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)     
        local modified = {}

        -- TODO: 현재 전체 라인을 다 탐색하는데, last_modified_at이 포함된 줄만 변경하도록
        for i, line in pairs(content) do
            if string.match(line, "last_modified_at") then
                line = "last_modified_at: " .. os.date("%Y. %m. %d. %H:%M:%S")
            end

            modified[#modified + 1] = line
        end
        
        vim.api.nvim_buf_set_lines(0, 0, -1, true, modified)
    end
})

