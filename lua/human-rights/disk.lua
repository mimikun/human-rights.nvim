local M = {}

local uv = vim.uv and vim.uv or vim.loop
local os_name = uv.os_uname().sysname

local is_windows = os_name == "Windows_NT"
local is_mac = os_name == "Darwin"

function M.show_disk()
    local media_type
    if is_windows then
        -- Windows
        -- NOTE: VERY SLOW
        local raw_cmd = "(Get-PhysicalDisk | Select-Object MediaType).MediaType"
        local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'

        local tmp = vim.fn.system(pwsh_cmd)
        media_type = string.gsub(tmp, "%s+", "")
    elseif is_mac then
        -- Mac
        media_type = "Mac"
    else
        -- Linux
        local lsblk_result = vim.fn.systemlist("lsblk -o ROTA | sed -e 's/\\s//g' | sed '/ROTA/d' | uniq")
        local tmp = lsblk_result[1]
        media_type = tmp == "1" and "HDD" or "SSD"
    end
    print(media_type)
end

return M
