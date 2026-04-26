# numbers.nvim

Automatically switches between relative and absolute line numbers based on
context. Relative numbers are active in normal mode; absolute numbers appear
in insert mode, unfocused windows, and special buffers.

Inspired by [numbers.vim](https://github.com/myusuf3/numbers.vim).

## Why

Relative line numbers are useful for motion commands (`5j`, `d3k`), but
meaningless when typing text or looking at an unfocused window. numbers.nvim
wires up the right Neovim events so the switch is automatic.

## Requirements

Neovim 0.8+

## Installation

**[lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
{
  "nkakouros-original/numbers.nvim",
  event = "VeryLazy",
  opts = {},
}
```

**[packer.nvim](https://github.com/wbthomason/packer.nvim)**

```lua
use {
  "nkakouros-original/numbers.nvim",
  config = function()
    require("numbers").setup()
  end,
}
```

## Configuration

Shown below are the defaults. Calling `setup({})` or `setup()` uses them
as-is. Passing either option replaces its default entirely rather than
merging.

```lua
require("numbers").setup({
  -- Filetypes for which line numbers are disabled entirely.
  excluded_filetypes = {
    "NvimTree", "neo-tree", "TelescopePrompt",
    "lazy", "mason", "lspinfo", "checkhealth",
    "help", "qf", "man",
    "alpha", "dashboard",
    "Outline", "aerial", "Trouble", "fzf", "oil", "toggleterm",
    -- legacy plugins
    "unite", "tagbar", "startify", "gundo",
    "vimshell", "w3m", "nerdtree", "Mundo", "MundoDiff",
  },
  -- Buffer types for which line numbers are disabled entirely.
  -- Covers terminals and scratch buffers regardless of filetype.
  excluded_buftypes = {
    "terminal", "nofile", "prompt", "quickfix",
  },
})
```

## Events

| Numbers mode | Events |
|---|---|
| Relative | `VimEnter`, `InsertLeave`, `WinEnter`, `FocusGained`, `BufEnter`, `BufNewFile`, `BufReadPost` |
| Absolute | `InsertEnter`, `WinLeave`, `FocusLost` |

## Contributing

Install [stylua](https://github.com/JohnnyMorganz/StyLua) and format before
submitting a PR:

```sh
stylua lua/
```

The CI workflow checks formatting on every push and pull request.
