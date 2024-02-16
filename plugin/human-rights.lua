if vim.g.loaded_human_rights then
    return
end

local hm = require("human-rights")

vim.api.nvim_create_user_command("ShowCpu", function()
    hm.show_cpu()
end, { desc = "Show CPU information" })

vim.api.nvim_create_user_command("ShowMemory", function()
    hm.show_memory()
end, { desc = "Show Memory size" })

vim.api.nvim_create_user_command("ShowParallelism", function()
    hm.show_parallelism()
end, { desc = "Show vim.uv.available_parallelism()" })

vim.api.nvim_create_user_command("ShowDisk", function()
    hm.show_disk()
end, { desc = "Show disk type(HDD or SSD)" })

vim.g.loaded_human_rights = true
