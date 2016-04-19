local list = {
  require 'src/entities/lite'
}

local draw = function()
  for idx = 1, #list do
    local entity = list[idx]
    if (entity.animation) then
      entity.animation:draw(entity.sprite, entity.pos_x, entity.pos_y)
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
