local Love = require 'src/services/love'

local list = {
  require 'src/entities/big-bang-bar',
  require 'src/entities/lite'
}

local draw = function()
  for idx = 1, #list do
    local entity = list[idx]
    if (entity.animation) then
      --entity.animation:draw(entity.sprite, entity.position.x, entity.position.y)
      entity.animation:draw(
        entity.sprite,
        entity.body:getX(),
        entity.body:getY(),
        entity.body:getAngle()
      )
      Love.graphics.setColor(160, 72, 14, 255)
      Love.graphics.polygon(
        'fill',
        entity.body:getWorldPoints(
          entity.shape:getPoints()
        )
      )
    elseif (entity.polygon) then
      Love.graphics.setColor(72, 160, 14, 255)
      Love.graphics.polygon(
        'fill',
        entity.body:getWorldPoints(
          entity.shape:getPoints()
        )
      )
    end
  end
end

local update = function(dt)
  for idx = 1, #list do
    local entity = list[idx]
    if (entity.animation) then
      entity.animation:update(dt)
    end
  end
end

return {
  draw = draw,
  list = list,
  update = update
}
