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

if is_windows then
    -- Windows
    -- NOTE: VERY SLOW
    ---@type string
    local raw_cmd = "(wmic path win32_VideoController get name)"
    ---@type string
    local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'
    ---@type string[]
    local tmp = vim.fn.systemlist(pwsh_cmd)
    M.gpu_name = tmp[2]
elseif is_wsl then
    -- WSL
    M.gpu_name = "Unknown: WSL cannot get it"
elseif is_mac then
    -- Mac
    M.gpu_name = "Unknown: Mac cannot get it"
else
    -- Linux
    M.gpu_name = "Unknown: Linux cannot get it"
end

function M.show_gpu()
    print(M.gpu_name)
end

function M.check_gpu()
    return false
end

return M
