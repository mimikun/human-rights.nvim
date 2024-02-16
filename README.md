# human-rights.nvim

A neovim plugin to check and display whether your machine have **human rights**.

## Features

- Show system information
  - CPU, Memory, Parallelism, Disk
- Check human rights
  - TRUE or FALSE

### Commands

- `ShowCpu` to Show CPU information
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
{ "mimikun/human-rights.nvim" }
```
