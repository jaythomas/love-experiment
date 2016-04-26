local Love = require 'src/services/love'

local list = {
  country_side = require 'src/backgrounds/country-side'
}

local current_background = {
  id = nil
}

local draw = function()
  local draw_background = function(table, quads, tile_w, tile_h, images)
    for col_index, col in ipairs(table) do
      for row_index, char in ipairs(col) do
        local info = quads[char]
        local img = images[info['img_idx']]['file']
        local pos_x = (col_index - 1) * tile_w
        local pos_y = (row_index - 1) * tile_h
        Love.graphics.draw(
          img,
          info['quad'],
          pos_x,
          pos_y
        )
      end
    end
  end

  draw_background(
    current_background.map,
    current_background.quads,
    current_background.tile_w,
    current_background.tile_h,
    current_background.images
  )
end

local load = function(background_id)

  local get_images = function(image_table)
    for key, val in pairs(image_table) do
      local image = Love.graphics.newImage(val)
      image_table[key] = {
        file = image,
        width = image:getWidth(),
        height = image:getHeight()
      }
    end
    return image_table
  end

  local build_quads = function(quad_info, tile_w, tile_h, images)
    for key, val in pairs(quad_info) do
      quad_info[key]['quad'] = Love.graphics.newQuad(
        val['pos_x'],
        val['pos_y'],
        tile_w,
        tile_h,
        images[val['img_idx']]['width'],
        images[val['img_idx']]['height']
      )
    end
    return quad_info
  end

  local build_map = function(map_string)
    local map = {}
    -- Parser will match text between whitespaces and new lines
    local parser = '[^\n%s]+'
    local map_width = #(map_string:match(parser))
    for x = 1, map_width, 1 do
      map[x] = {}
    end
    local row_index = 1
    for row in map_string:gmatch(parser) do
      assert(#row == map_width,
        'Map is not aligned: width of row ' ..
        tostring(row_index) ..
        ' should be ' ..
        tostring(map_width) ..
        ', but it is ' ..
        tostring(#row)
      )
      local col_index = 1
      for char in row:gmatch('.') do
        map[col_index][row_index] = char
        col_index = col_index + 1
      end
      row_index = row_index + 1
    end
    return map
  end

  local config = list[background_id]

  current_background.id = background_id
  current_background.images = get_images(config.images)
  current_background.tile_w = config.tile_w
  current_background.tile_h = config.tile_h

  current_background.quads = build_quads(
    config.quads,
    config.tile_w,
    config.tile_h,
    current_background.images
  )

  current_background.map = build_map(config.background_string)
end

return {
  draw = draw,
  load = load
}
