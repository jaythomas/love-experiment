--- MoveLeftBegin - generic player movement

local System = require 'lib/system'

local components = {
  '=input',
  '=sprite',
  'sprites'
}

local system = function(input, _, sprites)
  input.left = true
  if input.right then
    return input, sprites.actions.default:clone()
  end
  return input, sprites.actions.move_left:clone()
end

return System(components, system)
