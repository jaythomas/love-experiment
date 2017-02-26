return {
  acceleration = 140,
  body = {
    fixed_rotation = true,
    type = 'dynamic'
  },
  fixture = {
    friction = 0
  },
  input_actions = {
    dpdown = 'move-down',
    dpleft = 'move-left',
    dpright = 'move-right',
    dpup = 'move-up',
    down = 'move-down',
    left = 'move-left',
    right = 'move-right',
    up = 'move-up'
  },
  max_speed = 120,
  player_id = 1,
  shape = {
    points = {
      12, 4,
      20, 4,
      24, 16,
      20, 28,
      12, 28,
      8, 16
    },
    type = 'polygon'
    --height = 32,
    --offset_x = 32,
    --offset_y = 46,
    --width = 32,
    --type = 'rectangle'
  },
  sprites = 'm1'
}
