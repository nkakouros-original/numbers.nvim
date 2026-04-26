local M = {}

M.options = {
  excluded_filetypes = {
    NvimTree = true,
    ["neo-tree"] = true,
    TelescopePrompt = true,
    lazy = true,
    mason = true,
    lspinfo = true,
    checkhealth = true,
    help = true,
    qf = true,
    man = true,
    alpha = true,
    dashboard = true,
    Outline = true,
    aerial = true,
    Trouble = true,
    fzf = true,
    oil = true,
    toggleterm = true,
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
  excluded_buftypes = {
    terminal = true,
    nofile = true,
    prompt = true,
    quickfix = true,
  },
  norelative_events = {
    "InsertEnter",
    "WinLeave",
    "FocusLost",
  },
  relative_events = {
    "VimEnter",
    "InsertLeave",
    "WinEnter",
    "FocusGained",
    "BufEnter",
    "BufNewFile",
    "BufReadPost",
  },
}

M.set_numbering = function(relative)
  if M.options.excluded_filetypes[vim.bo.filetype] or M.options.excluded_buftypes[vim.bo.buftype] then
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    return
  end
  vim.opt_local.number = vim.go.number
  vim.opt_local.relativenumber = relative
end

M.setup = function(options)
  options = options or {}

  if options.excluded_filetypes then
    M.options.excluded_filetypes = {}
    for _, v in ipairs(options.excluded_filetypes) do
      M.options.excluded_filetypes[v] = true
    end
  end

  if options.excluded_buftypes then
    M.options.excluded_buftypes = {}
    for _, v in ipairs(options.excluded_buftypes) do
      M.options.excluded_buftypes[v] = true
    end
  end

  vim.api.nvim_create_augroup("NumbersAutocmds", { clear = true })

  vim.api.nvim_create_autocmd(M.options.norelative_events, {
    group = "NumbersAutocmds",
    callback = function()
      M.set_numbering(false)
    end,
  })

  vim.api.nvim_create_autocmd(M.options.relative_events, {
    group = "NumbersAutocmds",
    callback = function()
      M.set_numbering(true)
    end,
  })

  M.set_numbering(true)
end

return M
