--- MoveUpBegin - generic player movement

local System = require 'lib/system'

local components = {
  '!dead',
  '=input'
}

local system = function(input)
  input.up = true
  return input
end

return System(components, system)
