vim.api.nvim_create_autocmd('FileType', {
  pattern = "go",
  group = group,
  callback = function()
    require('go').setup({
      gofmt = 'gopls',
    })
  end,
})
