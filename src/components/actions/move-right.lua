--- MoveRight - generic player movement

local System = require 'lib/system'

local begin_components = {
  '=input',
  '=sprite',
  'sprites'
}
local begin_system = function(input, sprite, sprites)
  input.right = true
  if input.left then
    sprite = sprites.actions.default:clone()
  else
    sprite = sprites.actions.move_right:clone()
  end
  return input, sprite
end

local finish_components = {
  '=input',
  '=sprite',
  'sprites'
}
local finish_system = function(input, sprite, sprites)
  input.right = false
  if input.left then
    sprite = sprites.actions.move_left:clone()
  else
    sprite = sprites.actions.default:clone()
  end
  return input, sprite
end

return {
  begin = System(begin_components, begin_system),
  finish = System(finish_components, finish_system)
}
