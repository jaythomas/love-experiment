--- MoveUpFinish - generic player movement

local System = require 'lib/system'

local components = {
  '=input'
}

local system = function(input)
  input.up = false
  return input
end

return System(components, system)
