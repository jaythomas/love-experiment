-- Apply velocity on the x/y axis based on
-- active <input_direction>s on the player.
local System = require 'lib/system'

local components = {
  '-player_id',
  'body',
  'input_direction',
  'max_speed'
}

local system = function(body, input_direction, max_speed)
  local force_x = 0
  local force_y = 0

  if (input_direction.left and not input_direction.right) then
    force_x = -1
  elseif (input_direction.right and not input_direction.left) then
    force_x = 1
  end

  if (input_direction.up and not input_direction.down) then
    force_y = -1
  elseif (input_direction.down and not input_direction.up) then
    force_y = 1
  end

  body:applyForce(
    (force_x * max_speed),
    (force_y * max_speed)
  )
end

return System(components, system)
