--- MoveRightBegin - generic player movement

local System = require 'lib/system'

local components = {
  '=input',
  '=sprite',
  'sprites'
}

local system = function(input, _, sprites)
  input.right = true
  if input.left then
    return input, sprites.actions.default:clone()
  end
  return input, sprites.actions.move_right:clone()
end

return System(components, system)
