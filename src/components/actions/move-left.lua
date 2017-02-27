--- MoveLeft - generic player movement

local System = require 'lib/system'

local components = {
  '=input',
  '=sprite',
  'sprites'
}

local key_press_system = function(input, _, sprites)
  input.left = true
  if input.right then
    return input, sprites.actions.default:clone()
  end
  return input, sprites.actions.move_left:clone()
end

local key_release_system = function(input, _, sprites)
  input.left = false
  if input.right then
    return input, sprites.actions.move_right:clone()
  end
  return input, sprites.actions.default:clone()
end

return {
  key_press = System(components, key_press_system),
  key_release = System(components, key_release_system)
}
