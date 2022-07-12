# numbers.nvim

Neovim plugin that automatically disables relative line numbers when they don't make sense (e.g., when entering
insert mode). Written exclusively in Lua.

![demo](https://user-images.githubusercontent.com/56180050/177167997-652a43b1-c94a-4b73-94d6-e4b85fbd4606.gif)

## Requirements

- Neovim 0.7 or later

## Installation

Use your favorite package manager and run the `setup()` function from the `numbers` module. Example with [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
   "nkakouros-original/numbers.nvim",
   config = function()
      require("numbers").setup()
   end
}
```

## Configuration

Pass a table to the `setup` function with any of the following options:

```lua
require("numbers").setup({
   excluded_filetypes = {
      'nerdtree',
      'unite',
      -- etc
   }
})
```

## Acknowledgments

- https://github.com/myusuf3/numbers.vim
- https://github.com/jeffkreeftmeijer/vim-numbertoggle
- https://github.com/sitiom/nvim-numbertoggle
