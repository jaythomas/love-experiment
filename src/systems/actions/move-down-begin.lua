--- MoveDownBegin - generic player movement
local System = require 'lib/system'

local components = { '=input' }

local system = function(input)
  input.down = true
  return input
end

return System(components, system)
