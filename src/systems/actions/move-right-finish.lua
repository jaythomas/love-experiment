--- MoveRightFinish - generic player movement

local System = require 'lib/system'

local components = {
  '!dead',
  '=input',
  '=sprite',
  'sprites'
}

local system = function(input, _, sprites)
  input.right = false
  if input.left then
    return input, sprites.actions.move_left:clone()
  end
  return input, sprites.actions.default:clone()
end

return System(components, system)
