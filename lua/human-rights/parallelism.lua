local M = {}

local uv = vim.uv and vim.uv or vim.loop
---@type number
M.parallelism = uv.available_parallelism()

function M.show_parallelism()
    print(M.parallelism)
end

function M.check_parallelism()
    return false
end

return M
