--- MoveLeftFinish - generic player movement

local System = require 'lib/system'

local components = {
  '=input',
  '=sprite',
  'sprites'
}

local system = function(input, _, sprites)
  input.left = false
  if input.right then
    return input, sprites.actions.move_right:clone()
  end
  return input, sprites.actions.default:clone()
end

return System(components, system)
