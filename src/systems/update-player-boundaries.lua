--- UpdatePlayerBoundaries
-- Make sure players don't run out of the camera boundaries

local Camera = require 'src/services/camera'
local System = require 'lib/system'

local components = {
  '-player_id',
  'body',
  'sprite'
}

local system = function(body, sprite)
  local pos_x, pos_y = body:getPosition()
  local vel_x, vel_y = body:getLinearVelocity()
  local width, height = sprite:getDimensions()

  if (pos_x <= Camera.get_boundary_left() and vel_x < 0) then
    vel_x = 0
  end

  if (pos_x + width >= Camera.get_boundary_right() and vel_x > 0) then
    vel_x = 0
  end

  if (pos_y <= Camera.get_boundary_top() and vel_y < 0) then
    vel_y = 0
  end

  if (pos_y + height >= Camera.get_boundary_bottom() and vel_y > 0) then
    vel_y = 0
  end

  body:setLinearVelocity(vel_x, vel_y)
end

return System(components, system)
