--- Shot1
-- Not sure what kind of attack this is yet

local Entity = require 'src/services/entity'
local System = require 'lib/system'

local components = {
  'body',
  '!dead',
  'draw_layer',
  'sprite'
}

local system = function(body, draw_layer, sprite)
  local pos_x, pos_y = body:getPosition()
  local width, _ = sprite:getDimensions()

  -- Re-align shot position to center of body
  pos_x = pos_x + math.floor(width / 2)

  Entity.spawn({
    name = 'shot1',
    pos_x = pos_x,
    pos_y = pos_y
  }, draw_layer)
end

return System(components, system)
