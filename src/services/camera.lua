--- Camera
-- Translation layer between coordinates and drawn graphics

local Love = require 'src/services/love'

local pos_x = 0
local pos_y = 0
local rotation = 0
local scale_x = 1
local scale_y = 1

local move = function(dx, dy)
  pos_x = pos_x + (dx or 0)
  pos_y = pos_y + (dy or 0)
end

local rotate = function(dr)
  rotation = rotation + dr
end

local scale = function(sx, sy)
  sx = sx or 1
  scale_x = scale_x * sx
  -- If no second argument was provided,
  -- do equal scaling for x and y
  scale_y = scale_y * (sy or sx)
end

local set = function()
  Love.graphics.push()
  Love.graphics.rotate(-rotation)
  Love.graphics.scale(1 / scale_x, 1 / scale_y)
  Love.graphics.translate(-pos_x, -pos_y)
end

local set_position = function(x, y)
  pos_x = x or pos_x
  pos_y = y or pos_y
end

local set_scale = function(sx, sy)
  scale_x = sx or (scale_x)
  scale_y = sy or (scale_y)
end

local unset = function()
  Love.graphics.pop()
end

return {
  move = move,
  rotate = rotate,
  scale = scale,
  set = set,
  set_position = set_position,
  set_scale = set_scale,
  unset = unset
}
