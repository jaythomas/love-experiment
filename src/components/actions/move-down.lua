--- MoveDown - generic player movement

local System = require 'lib/system'

local components = {
  '=input'
}

local key_press_system = function(input)
  input.down = true
  return input
end

local key_release_system = function(input)
  input.down = false
  return input
end

return {
  key_press = System(components, key_press_system),
  key_release = System(components, key_release_system)
}
