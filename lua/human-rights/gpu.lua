local M = {}

local uv = vim.uv and vim.uv or vim.loop
---@type string
local os_name = uv.os_uname().sysname

---@type boolean
local is_windows = os_name == "Windows_NT"
---@type boolean
local is_mac = os_name == "Darwin"
---@type boolean
local is_wsl = vim.fn.has("wsl") == 1

function M.show_gpu()
    local gpu_name
    if is_windows then
        -- Windows
        -- NOTE: VERY SLOW
        ---@type string
        local raw_cmd = "(wmic path win32_VideoController get name)"
        ---@type string
        local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'
        ---@type string
        local tmp = vim.fn.systemlist(pwsh_cmd)
        gpu_name = tmp[2]
    elseif is_wsl then
        -- WSL
        gpu_name = "Unknown: WSL cannot get it"
    elseif is_mac then
        -- Mac
        gpu_name = "Unknown: Mac cannot get it"
    else
        -- Linux
        gpu_name = "Unknown: Linux cannot get it"
    end
    print(gpu_name)
end

return M
