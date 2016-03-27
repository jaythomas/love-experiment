-- local globals
local Backgrounds
local BackgroundQuadInfo

local BackgroundMap
local BackgroundTileW
local BackgroundTileHh

local draw = function()
  local draw_background = function(table, quad_info, tile_w, tile_h, images)
    for col_index, col in ipairs(table) do
      for row_index, char in ipairs(col) do
        local info = quad_info[char]
        local img = images[info['img_idx']]['file']
        local pos_x = (col_index - 1) * tile_w
        local pos_y = (row_index - 1) * tile_h
        love.graphics.draw(
          img,
          info['quad'],
          pos_x,
          pos_y
        )
      end
    end
  end

  draw_background(BackgroundMap, BackgroundQuadInfo, BackgroundTileW, BackgroundTileH, Backgrounds)
end

local load = function(map_config)
  local get_images = function(image_table)
    for key, val in pairs(image_table) do
      local image = love.graphics.newImage(val)
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
      quad_info[key]['quad'] = love.graphics.newQuad(
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
    map = {}
    -- Parser will match texte between whitespaces and new lines
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

  Backgrounds = get_images(map_config.images)
  BackgroundQuadInfo = build_quads(map_config.quad_info, map_config.tile_w, map_config.tile_h, Backgrounds)

  BackgroundMap = build_map(map_config.background_string)
  BackgroundTileW = map_config.tile_w
  BackgroundTileH = map_config.tile_h

end

return {
  draw = draw,
  load = load
}
