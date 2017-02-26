--- MoveDown - generic player movement

local System = require 'lib/system'

local begin_components = {
  '=input'
}

local begin_system = function(input)
  input.down = true
  return input
end

local finish_components = {
  '=input'
}

local finish_system = function(input)
  input.down = false
  return input
end

return {
  begin = System(begin_components, begin_system),
  finish = System(finish_components, finish_system)
}
