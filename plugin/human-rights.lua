if vim.g.loaded_human_rights then
    return
end

local hm = require("human-rights")
local cmd = vim.api.nvim_create_user_command

cmd("ShowCpu", function()
    hm.show_cpu()
end, { desc = "Show CPU information" })

cmd("ShowGpu", function()
    hm.show_gpu()
end, { desc = "Show GPU information" })

cmd("ShowMemory", function()
    hm.show_memory()
end, { desc = "Show Memory size" })

cmd("ShowParallelism", function()
    hm.show_parallelism()
end, { desc = "Show vim.uv.available_parallelism()" })

cmd("ShowDisk", function()
    hm.show_disk()
end, { desc = "Show disk type(HDD or SSD)" })

cmd("CheckCpu", function()
    print(hm.check_cpu())
end, { desc = "Check CPU human-rights" })

cmd("CheckGpu", function()
    print(hm.check_gpu())
end, { desc = "Check GPU human-rights" })

cmd("CheckMemory", function()
    print(hm.check_memory())
end, { desc = "Check Memory size" })

cmd("CheckParallelism", function()
    print(hm.check_parallelism())
end, { desc = "Check vim.uv.available_parallelism()" })

cmd("CheckDisk", function()
    print(hm.check_disk())
end, { desc = "Check disk is SSD" })

vim.g.loaded_human_rights = true
