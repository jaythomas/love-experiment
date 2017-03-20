--- UpdateBgTurret
-- Make the turret's sprite follow the player

local GameState = require 'src/services/game-state'
local System = require 'lib/system'
--local Timer = require 'lib/timer'
local Util = require 'src/services/util'

local components = {
  'body',
  '=sprite',
  'sprites'
}

local system = function(body, sprite, sprites)
  local pos_x, pos_y = body:getPosition()

  local players = GameState.get_players()

  -- Don't bother updating the sprite
  if #players == 0 then
    return sprite
  end

  local targets = Util.map(players, function(player)
    local player_pos_x, player_pos_y = player.body:getPosition()
    return {
      pos_x = player_pos_x,
      pos_y = player_pos_y
    }
  end)

  local closest_target = Util.reduce(targets, function(a, b)
    if a.pos_x + a.pos_y > b.pos_x + b.pos_y then
      return a
    end
    return b
  end)

  local tangent = Util.angle(
    closest_target.pos_x,
    closest_target.pos_y,
    pos_x,
    pos_y
  )
  local index = math.floor(((tangent * 100) / math.pi) / 12) + 8
  if index < 1 then
    index = 16
  end
  -- Turret sprites are in indexed order
  -- to make things more convenient.
  return sprites.actions[index]
end

return System(components, system)
