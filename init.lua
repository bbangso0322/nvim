local function load_env()
    local env_file = vim.fn.stdpath("config") .. "/.env"
    local f = io.open(env_file, "r")
    if not f then return end

    _G.env = {}
    for line in f:lines() do
        -- 주석(#)이거나 빈 줄은 제외하고 'KEY=VALUE' 형태만 파싱
        local key, value = line:match("^%s*([^#%s%][^=]+)%s*=%s*(.-)%s*$")
        if key and value then
            -- 따옴표 제거 (예: "value" -> value)
            value = value:gsub("^%s*[\"'](.*)[\"']%s*$", "%1")
            _G.env[key] = value
        end
    end
    f:close()
end

load_env()

require("config")
