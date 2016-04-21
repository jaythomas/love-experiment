local Sprite = require 'src/services/sprite'

local name = 'lite'

local entity = {
  sprite = Sprite.list[name].image,
  animation = Sprite.list[name].animation,
  input_direction = {
    down = false,
    left = false,
    right = false,
    up = false
  },
  player_id = 1,
  position = {
    x = 0,
    y = 0
  },
  velocity = {
    x = 0,
    y = 0
  },
  max_speed = 110,
}

return entity
