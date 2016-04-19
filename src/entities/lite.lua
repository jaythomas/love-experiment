local Sprite = require 'src/services/sprite'

local name = 'lite'

local entity = {
  pos_x = 0,
  pos_y = 0,
  vel_x = 0,
  vel_y = 0,
  speed = 12,
  sprite = Sprite.list[name].image,
  animation = Sprite.list[name].animation
}

return entity
