local M = {}

function M.show_cpu()
    local uv = vim.uv and vim.uv or vim.loop
    local cpu_info = uv.cpu_info()
    local cpu_name = cpu_info[1].model
    print(cpu_name)
end

return M
