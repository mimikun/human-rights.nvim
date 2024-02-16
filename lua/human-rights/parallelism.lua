local M = {}

function M.show_parallelism()
    local uv = vim.uv and vim.uv or vim.loop
    print(uv.available_parallelism())
end

return M
