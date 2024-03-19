local M = {}

local uv = vim.uv and vim.uv or vim.loop
---@type string
local os_name = uv.os_uname().sysname

---@type boolean
local is_windows = os_name == "Windows_NT"
---@type boolean
local is_mac = os_name == "Darwin"

if is_windows then
    -- Windows
    -- NOTE: VERY SLOW

    ---@type string
    local raw_cmd = "(Get-PhysicalDisk | Select-Object MediaType).MediaType"
    ---@type string
    local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'

    ---@type string
    local tmp = vim.fn.system(pwsh_cmd)
    M.media_type = string.gsub(tmp, "%s+", "")
elseif is_mac then
    -- Mac
    M.media_type = "Mac"
else
    -- Linux
    ---@type table
    local lsblk_result = vim.fn.systemlist("lsblk -o ROTA | sed -e 's/\\s//g' | sed '/ROTA/d' | uniq")
    ---@type string
    local tmp = lsblk_result[1]
    M.media_type = tmp == "1" and "HDD" or "SSD"
end

function M.show_disk()
    print(M.media_type)
end

---@return boolean
function M.check_disk()
    local mt = M.media_type
    if mt == "SSD" then
        return true
    else
        return false
    end
end

return M
