return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      '*'; -- Highlight all files
      css = { rgb_fn = true; }; -- Enable parsing rgb() functions in CSS.
    })
  end
}
