--- MoveDownFinish - generic entity movement

local System = require 'lib/system'

local components = {
  '!dead',
  '=input'
}

local system = function(input)
  input.down = false
  return input
end

return System(components, system)
