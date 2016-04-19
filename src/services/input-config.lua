local Input = require 'src/services/input'
local Player = require 'src/services/player'

local actions = {
  player_down = {
    label = 'Move down',
    fn = function() Player.move('down') end
  },
  player_left = {
    label = 'Move left',
    fn = function() Player.move('left') end
  },
  player_right = {
    label = 'Move right',
    fn = function() Player.move('right') end
  },
  player_up = {
    label = 'Move up',
    fn = function() Player.move('up') end
  }
}

local update = function()
  -- Hard-code some default key maps:
  Input.register_key_press('up', actions.player_up.fn)
  Input.register_key_press('left', actions.player_left.fn)
  Input.register_key_press('down', actions.player_down.fn)
  Input.register_key_press('right', actions.player_right.fn)
  Input.register_key_press('w', actions.player_up.fn)
  Input.register_key_press('a', actions.player_left.fn)
  Input.register_key_press('s', actions.player_down.fn)
  Input.register_key_press('d', actions.player_right.fn)
end

return {
  update = update
}
