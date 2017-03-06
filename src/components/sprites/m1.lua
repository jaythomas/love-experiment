-- Repeat the last two frames of a turn,
-- skipping the first two transition frames
local hold_full_turn = function(animation)
  animation:gotoFrame(3)
end

return {
  -- All paths are relative to the projects root folder.
  path = 'img/ship-m1.png',
  -- The width of each sprite action (all frames). For instance,
  -- if your sprite action is two frames side by side, each 16
  -- pixels wide, then your sprit action's width is 32 pixels.
  width = 16,
  -- The height of each sprite action (all frames). For instance,
  -- if your sprite action is two frames stacked, each 24 pixels
  -- in height, then your sprite action's height is 48 pixels.
  height = 26,
  -- You can specify a range of frames to complete an animation
  -- on the top level of the sprite component or within each
  -- sprite action. The sprite actions are checked first,
  -- then the sprite component top level, or it defaults
  -- to frame { 1, 1 }, meaning a non-animated sprite.
  -- Frames are a table of columns and rows represented by
  -- numbers or strings. Some examples:
  -- { 3, 8, 5, 1 } = 2 frames, 1st in column 3 row 8, 2nd in column 5 row 1
  -- { '2-5', '3-5', 1, 1 } 13 frames, 3 in column 2 row 3-5, 3 in column 3
  -- row 3-5... etc., and ending on 1 frame on column 1 row 1
  frames = { 3, '1-2' },
  -- Likewise, you can set the length of time to display each frame on
  -- the top level of the sprite component or within each sprite action.
  duration = 0.1,
  -- Space between frames
  gap = 0,
  -- The x/y offset– where the top-left corner of the sprites begin.
  x = 0,
  y = 0,
  -- Sprites are divided into actions, where each action
  -- corresponds to an entity action. When the entity
  -- is performing that action, the spite or sprite
  -- animation that corresponds to that is drawn.
  actions = {
    default = {
      -- All properties except 'img' can be
      -- set per sprite action as necessary.
      frames = { 1, '1-2' },
      gap = 0,
      x = 32
    },
    explode = {
      duration = 0.1,
      frames = { '6-10', 1 }
    },
    move_left = {
      frames = { 2, '1-2', 1, '1-2' },
      on_loop = hold_full_turn,
      gap = 0
    },
    move_right = {
      frames = { 4, '1-2', 5, '1-2' },
      on_loop = hold_full_turn,
      gap = 0
    }
  }
}
