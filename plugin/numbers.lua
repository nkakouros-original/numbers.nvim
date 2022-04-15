local function autocmd(events, command)
  vim.api.nvim_create_autocmd(events, {group="NumbersAutocmds", command=command})
end

local norelative_events = {
  "InsertEnter",
  "WinLeave",
  "FocusLost",
  "BufNewFile",
  "BufReadPost",
}

local relative_events = {
  "InsertLeave",
  "WinEnter",
  "FocusGained",
}

vim.api.nvim_create_augroup("NumbersAutocmds", {clear=true})

autocmd(norelative_events, "set number | set norelativenumber")
autocmd(relative_events, "set number | set relativenumber")
