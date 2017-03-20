--- UnregisterPlayer
-- Let GameState be aware of this player

local GameState = require 'src/services/game-state'
local System = require 'lib/system'

local components = {
  'player_id'
}

local system = function(player_id)
  GameState.set_player(player_id, nil)
end

return System(components, system)
