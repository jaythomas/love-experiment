local Love = require 'src/services/love'

-- Set pixels per unit of length
local meter = 32 -- (base tile size)
Love.physics.setMeter = meter

-- Create world gravity
local gravity = 9.81 * meter -- (roughly Earth gravity)
local world = Love.physics.newWorld(0, gravity, true)

--local get = function()
  --return world
--end

return world
