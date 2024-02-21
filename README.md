# human-rights.nvim

A neovim plugin to check and display whether your machine have **human rights**.

## Features

- Show system information
  - CPU, GPU, Memory, Parallelism and Disk
- Check human rights
  - TRUE or FALSE

### Commands

- `ShowCpu` to Show CPU information
- `ShowGpu` to Show GPU information
- `ShowMemory` to Show Memory size
- `ShowParallelism` to Show vim.uv.available_parallelism()
- `ShowDisk` to Show disk type(HDD or SSD)

## Setup

### System requirements

- Neovim nightly or HEAD
  - Testing only on nightly and HEAD

### Install

#### lazy.nvim

```lua
{
    "mimikun/human-rights.nvim",
    -- default
    opts = {
        cpu = {
            "Ryzen 9 7950X",
            "i9-14900K",
        },
        gpu = {
            "RTX 4090",
        }
        memory = {
            -- 31GB
            linux = 33285996544,
            -- 31GB
            windows = 33285996544,
        },
        parallelism = 24,
        -- No one really uses HDDs, right?
        disk = "SSD",
    },
}
```

## TODO

- [ ] Add check human rights feature
