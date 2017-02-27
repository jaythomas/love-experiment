--- MoveRight - generic player movement

local System = require 'lib/system'

local components = {
  '=input',
  '=sprite',
  'sprites'
}

local key_press_system = function(input, _, sprites)
  input.right = true
  if input.left then
    return input, sprites.actions.default:clone()
  end
  return input, sprites.actions.move_right:clone()
end

local key_release_system = function(input, _, sprites)
  input.right = false
  if input.left then
    return input, sprites.actions.move_left:clone()
  end
  return input, sprites.actions.default:clone()
end

return {
  key_press = System(components, key_press_system),
  key_release = System(components, key_release_system)
}
