local images = {
  countryside = 'img/countryside.png'
}

local background_string = [[
  ....bb......
  .f..bb......
  ....bb......
  ....ww..f...
  ............
  ............
  .f..........
  ........f...
  ............
  ............
  ....f.......
  ............
]]

local quads = {
  ['.'] = { -- grass
    img_idx = 'countryside',
    pos_x = 0,
    pos_y = 0
  },
  ['w'] = { -- wood panel
    img_idx = 'countryside',
    pos_x = 32,
    pos_y = 0
  },
  ['f'] = { --flowers
    img_idx = 'countryside',
    pos_x = 0,
    pos_y = 32
  },
  ['b'] = { -- boxtop
    img_idx = 'countryside',
    pos_x = 32,
    pos_y = 32
  }
}

return {
  images = images,
  background_string = background_string,
  quads = quads,
  tile_w = 32,
  tile_h = 32
}
