-- Cannon directions:
--
--      12
--    11  13
--   10    14
--   9      15
--  8        16
--   7       1
--    6     2
--     5   3
--       4

return {
  path = 'img/enemy-bg-turret.png',
  width = 44,
  height = 44,
  gap = 2,
  -- Center turret bearing needs to be top-left
  offset_x = -22,
  offset_y = -22,
  actions = {
    default = {
      frames = { 1, 1 }
    },
    {
      frames = { 14, 1 }
    },
    {
      frames = { 15, 1 }
    },
    {
      frames = { 16, 1 }
    },
    {
      frames = { 1, 1 }
    },
    {
      frames = { 2, 1 }
    },
    {
      frames = { 3, 1 }
    },
    {
      frames = { 4, 1 }
    },
    {
      frames = { 5, 1 }
    },
    {
      frames = { 6, 1 }
    },
    {
      frames = { 7, 1 }
    },
    {
      frames = { 8, 1 }
    },
    {
      frames = { 9, 1 }
    },
    {
      frames = { 10, 1 }
    },
    {
      frames = { 11, 1 }
    },
    {
      frames = { 12, 1 }
    },
    {
      frames = { 13, 1 }
    }
  }
}
