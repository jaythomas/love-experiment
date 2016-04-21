-- Apply velocity on the x/y axis based on
-- active <input_direction>s on the player.
local System = require 'lib/system'

local components = {
  '-player_id',
  'input_direction',
  'velocity'
}

local system = function(input_direction, velocity)
  if (input_direction.left and not input_direction.right) then
    velocity.x = -1
  elseif (input_direction.right and not input_direction.left) then
    velocity.x = 1
  else
    velocity.x = 0
  end

  if (input_direction.up and not input_direction.down) then
    velocity.y = -1
  elseif (input_direction.down and not input_direction.up) then
    velocity.y = 1
  else
    velocity.y = 0
  end
end

return System(components, system)
