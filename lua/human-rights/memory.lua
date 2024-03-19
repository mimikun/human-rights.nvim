local M = {}

local uv = vim.uv and vim.uv or vim.loop
---@type number
M.total_memory = uv.get_total_memory()

function M.show_memory()
    print(M.total_memory)
end

function M.check_memory()
    return false
end

return M
