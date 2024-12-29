return {
  'echasnovski/mini.surround',
  version = '*',
  config = function ()
    require('mini.surround').setup(
      {
        search_method = 'cover_or_next',
      })
  end
}
