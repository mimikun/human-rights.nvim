local M = {}

local uv = vim.uv and vim.uv or vim.loop
---@type string
local os_name = uv.os_uname().sysname

---@type string
local is_windows = os_name == "Windows_NT"
---@type string
local is_mac = os_name == "Darwin"

function M.show_disk()
    ---@type string
    local media_type
    if is_windows then
        -- Windows
        -- NOTE: VERY SLOW

        ---@type string
        local raw_cmd = "(Get-PhysicalDisk | Select-Object MediaType).MediaType"
        ---@type string
        local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'

        ---@type string
        local tmp = vim.fn.system(pwsh_cmd)
        media_type = string.gsub(tmp, "%s+", "")
    elseif is_mac then
        -- Mac
        media_type = "Mac"
    else
        -- Linux
        ---@type table
        local lsblk_result = vim.fn.systemlist("lsblk -o ROTA | sed -e 's/\\s//g' | sed '/ROTA/d' | uniq")
        ---@type string
        local tmp = lsblk_result[1]
        media_type = tmp == "1" and "HDD" or "SSD"
    end
    print(media_type)
end

return M
