--- MoveLeft - generic player movement

local System = require 'lib/system'

local begin_components = {
  '=input',
  '=sprite',
  'sprites'
}

local begin_system = function(input, sprite, sprites)
  input.left = true
  if input.right then
    sprite = sprites.actions.default:clone()
  else
    sprite = sprites.actions.move_left:clone()
  end
  return input, sprite
end

local finish_components = {
  '=input',
  '=sprite',
  'sprites'
}

local finish_system = function(input, sprite, sprites)
  input.left = false
  if input.right then
    sprite = sprites.actions.move_right:clone()
  else
    sprite = sprites.actions.default:clone()
  end
  return input, sprite
end

return {
  begin = System(begin_components, begin_system),
  finish = System(finish_components, finish_system)
}
