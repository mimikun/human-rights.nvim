local cpu = require("human-rights.cpu")
local memory = require("human-rights.memory")
local parallelism = require("human-rights.parallelism")
local disk = require("human-rights.disk")

local M = {}

M.show_cpu = cpu.show_cpu
M.show_memory = memory.show_memory
M.show_parallelism = parallelism.show_parallelism
M.show_disk = disk.show_disk

return M
