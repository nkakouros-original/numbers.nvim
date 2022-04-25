# numbers.nvim

Disables relative line numbers when they don't make sense, e.g. when entering
insert mode.

A Neovim plugin written exclusively in Lua.

Inspired by [numbers.vim](https://github.com/myusuf3/numbers.vim).

## Installation

Run the `setup()` function from the `numbers` module, e.g:

```lua
lua require('numbers').setup()
```

## Configuration

Pass a table to the `setup` function with any of the following options:

```lua
{
  excluded_filetypes = {
    'nerdtree',
    'unite',
    -- etc
  }
}
```
