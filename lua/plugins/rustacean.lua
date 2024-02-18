-- return {
--   'mrcjkb/rustaceanvim',
--   version = '^4', -- Recommended
--   ft = { 'rust' },
-- }

return {
  'simrat39/rust-tools.nvim',
  config = function()
    require('user.rust').setup()
  end
}
