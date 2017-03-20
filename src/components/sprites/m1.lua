-- Repeat the last two frames of a turn,
-- skipping the first two transition frames
local hold_full_turn = function(animation)
  animation:gotoFrame(3)
end

return {
  -- All paths are relative to the projects root folder.
  path = 'img/ship-m1.png',
  width = 16,
  height = 26,
  frames = { 3, '1-2' },
  duration = 0.1,
  -- Sprites are divided into actions, where each action
  -- corresponds to an entity action. See sprites/README.
  actions = {
    default = {
      frames = { 1, '1-2' },
      x = 32
    },
    explode = {
      duration = 0.1,
      frames = { '6-10', 1 }
    },
    move_left = {
      frames = { 2, '1-2', 1, '1-2' },
      on_loop = hold_full_turn
    },
    move_right = {
      frames = { 4, '1-2', 5, '1-2' },
      on_loop = hold_full_turn
    }
  }
}
