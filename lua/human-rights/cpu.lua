local M = {}

local uv = vim.uv and vim.uv or vim.loop
M.cpu_info = uv.cpu_info()
M.cpu_name = M.cpu_info[1].model

function M.show_cpu()
    print(M.cpu_name)
end

function M.check_cpu()
    return false
end

return M
