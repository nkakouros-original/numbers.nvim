local function autocmd(events, command)
  vim.api.nvim_create_autocmd(events, {group='NumbersAutocmds', command=command})
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
    'InsertEnter',
    'WinLeave',
    'FocusLost',
    'BufNewFile',
    'BufReadPost',
  },
  relative_events = {
    'InsertLeave',
    'WinEnter',
    'FocusGained',
  },
}


M.set_numbering = function(relative)
  if M.options.excluded_filetypes[vim.api.nvim_buf_get_option(0, 'filetype')] then
    vim.opt.number = false
    vim.opt.relativenumber = false
    return
  end
  vim.opt.number = true
  vim.opt.relativenumber = relative
end

M.setup = function(options)
  options = options or {}
  if options.excluded_filetypes then
    M.options.excluded_filetypes = {}

    for _, v in pairs(options.excluded_filetypes) do
      M.options.excluded_filetypes[v] = true
    end
  end

  vim.api.nvim_create_augroup('NumbersAutocmds', {clear=true})

  autocmd(M.options.norelative_events, 'lua require("numbers").set_numbering(false)')
  autocmd(M.options.relative_events, 'lua require("numbers").set_numbering(true)')
end

return M
