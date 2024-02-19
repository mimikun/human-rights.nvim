local M = {}

function M.show_parallelism()
    local uv = vim.uv and vim.uv or vim.loop
    ---@type number
    local parallelism = uv.available_parallelism()
    print(parallelism)
end

return M
