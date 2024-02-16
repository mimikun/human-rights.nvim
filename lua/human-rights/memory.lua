local M = {}

function M.show_memory()
    local uv = vim.uv and vim.uv or vim.loop
    local total_memory = uv.get_total_memory()
    print(total_memory)
end

return M
