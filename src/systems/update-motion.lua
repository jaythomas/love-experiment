local System = require 'lib/system'

local components = {
  'position',
  'velocity',
  'max_speed'
}

local system = function(pos, vel, max_speed, dt)
  pos.x = pos.x + ((vel.x * max_speed) * dt)
  pos.y = pos.y + ((vel.y * max_speed) * dt)
end

return System(components, system)
