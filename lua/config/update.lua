local function auto_update_config()
  local config_path = vim.fn.stdpath("config")

  local function is_git_repo(path)
    local git_dir = path .. "/.git"
    local stat = vim.loop.fs_stat(git_dir)
    return stat and stat.type == "directory"
  end

  if is_git_repo(config_path) then
    local Job = require("plenary.job")
    Job:new({
      command = "git",
      args = { "pull", "--ff-only" },
      cwd = config_path,
      on_exit = function(j, return_val)
        if return_val == 0 then
          vim.schedule(function()
            print("[nvim] config auto-updated from git ✅")
            vim.cmd("source " .. config_path .. "/init.lua")
          end)
        else
          vim.schedule(function()
            print("[nvim] git pull failed ❌: " .. table.concat(j:stderr_result(), "\n"))
          end)
        end
      end,
    }):start()
  end
end

auto_update_config()
