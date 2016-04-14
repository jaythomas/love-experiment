local list = {
  require 'src/entities/lite'
}

local draw = function()
  for idx = 1, #list do
    local entity_img = list[idx].image
    if (entity_img) then
      love.graphics.draw(entity_img, entity_img:getWidth(), entity_img:getHeight())
    end
  end
end

return {
  draw = draw,
  list = list
}
