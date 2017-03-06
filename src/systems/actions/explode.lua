--- Explode
-- Replace entity's sprite with an explosion.

local System = require 'lib/system'

local components = {
  '_entity',
  '=sprite',
  'sprites'
}

local system = function(entity, _, sprites)
  local sprite = sprites.actions.explode:clone()
  sprite.onLoop = function(animation)
    animation:pause()
    entity.destroyed = true
  end
    -- Let the game loop remove this entity next go around
  return sprite
end

return System(components, system)
