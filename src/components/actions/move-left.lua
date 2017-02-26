--- MoveLeft - generic player movement

local System = require 'lib/system'

local begin_components = {
  '=input',
  '=sprite',
  'sprites'
}

local begin_system = function(input, _, sprites)
  input.left = true
  if input.right then
    return input, sprites.actions.default:clone()
  end
  return input, sprites.actions.move_left:clone()
end

local finish_components = {
  '=input',
  '=sprite',
  'sprites'
}

local finish_system = function(input, _, sprites)
  input.left = false
  if input.right then
    return input, sprites.actions.move_right:clone()
  end
  return input, sprites.actions.default:clone()
end

return {
  begin = System(begin_components, begin_system),
  finish = System(finish_components, finish_system)
}
