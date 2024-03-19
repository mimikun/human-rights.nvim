local cpu = require("human-rights.cpu")
local gpu = require("human-rights.gpu")
local memory = require("human-rights.memory")
local parallelism = require("human-rights.parallelism")
local disk = require("human-rights.disk")

---@type table
local DEFAULT_HUMAN_RIGHTS = {
    cpu = {
        "Ryzen 9 7950X",
        "i9-14900K",
    },
    gpu = {
        "RTX 4090",
    },
    memory = {
        -- 31GB
        linux = 33285996544,
        -- 31GB
        windows = 33285996544,
    },
    parallelism = 24,
    disk = "SSD",
}

local M = {}
M.human_rights = DEFAULT_HUMAN_RIGHTS

M.show_cpu = cpu.show_cpu
M.show_gpu = gpu.show_gpu
M.show_memory = memory.show_memory
M.show_parallelism = parallelism.show_parallelism
M.show_disk = disk.show_disk

M.check_cpu = cpu.check_cpu
M.check_gpu = gpu.check_gpu
M.check_memory = memory.check_memory
M.check_parallelism = parallelism.check_parallelism
M.check_disk = disk.check_disk

function M.setup(opts)
    if opts and opts.human_rights then
        M.human_rights = opts.human_rights
    end
end

return M
