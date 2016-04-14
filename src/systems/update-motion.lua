local System = require 'lib/system'

local components = {
  'position',
  'velocity'
}

local system = function(pos, vel, dt)
  pos.x = pos.x + vel.x * dt
  pos.y = pos.y + vel.y * dt
end

return System(components, system)
