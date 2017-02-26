--- UpdateCamera
-- Set the next frame's camera position

local System = require 'lib/system'

local Camera = require 'src/services/camera'

local components = {
  '-player_id',
  'body',
  'sprite'
}

local system = function(body, sprite)
  local _, player_pos_y = body:getPosition()
  local _, player_height = sprite:getDimensions()

  local camera_pos_x, camera_pos_y = Camera.get_position()

  local boundary_bottom = Camera.get_boundary_bottom()
  local boundary_top = Camera.get_boundary_top()

  if player_pos_y < boundary_top then
    camera_pos_y = camera_pos_y - (boundary_top - player_pos_y)
  elseif player_pos_y + player_height > boundary_bottom then
    camera_pos_y = camera_pos_y - (boundary_bottom - (player_pos_y + player_height))
  end

  -- Floor the values to avoid screen-tearing floats
  Camera.set_position(
    math.floor(camera_pos_x),
    math.floor(camera_pos_y)
  )
end

return System(components, system)
