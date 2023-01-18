local function autocmd(events, command)
   vim.api.nvim_create_autocmd(events, { group = "NumbersAutocmds", callback = command })
end

M = {}

M.options = {
   excluded_filetypes = {
      unite = true,
      tagbar = true,
      startify = true,
      gundo = true,
      vimshell = true,
      w3m = true,
      nerdtree = true,
      Mundo = true,
      MundoDiff = true,
   },
   norelative_events = {
      "BufLeave",
      "FocusLost",
      "InsertEnter",
      "CmdlineEnter",
      "WinLeave",
      "BufNewFile",
      "BufReadPost",
   },
   relative_events = {
      "BufEnter",
      "FocusGained",
      "InsertLeave",
      "CmdlineLeave",
      "WinEnter",
   },
}

function M.set_numbering(relative)
   if M.options.excluded_filetypes[vim.api.nvim_buf_get_option(0, "filetype")] then
      vim.o.number = false
      vim.o.relativenumber = false
   elseif vim.o.nu then
      vim.o.relativenumber = relative and vim.api.nvim_get_mode().mode ~= "i"
      vim.cmd "redraw"
   end
end

function M.setup(options)
   options = options or {}
   if options.excluded_filetypes then
      M.options.excluded_filetypes = {}

      for _, v in pairs(options.excluded_filetypes) do
         M.options.excluded_filetypes[v] = true
      end
   end

   vim.api.nvim_create_augroup("NumbersAutocmds", { clear = true })

   autocmd(M.options.norelative_events, function()
      M.set_numbering(false)
   end)
   autocmd(M.options.relative_events, function()
      M.set_numbering(true)
   end)
end

return M