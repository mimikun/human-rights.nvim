local M = {}

function M.show_cpu()
    local uv = vim.uv and vim.uv or vim.loop
    ---@type string
    local cpu_info = uv.cpu_info()
    ---@type string
    local cpu_name = cpu_info[1].model
    print(cpu_name)
end

return M
