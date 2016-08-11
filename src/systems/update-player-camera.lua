--- UpdatePlayerCamera
-- Set the next frame's camera position

local System = require 'lib/system'

local Camera = require 'src/services/camera'

local components = {
  '-player_id',
  'body'
}

local system = function(body)
  local pos_x, pos_y = body:getPosition()

  Camera.set_position(pos_x, pos_y)
end

return System(components, system)
