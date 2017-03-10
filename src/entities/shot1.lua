return {
  acceleration = 300,
  body = {
    fixed_rotation = true,
    offset_x = -3,
    offset_y = 2,
    type = 'dynamic'
  },
  damage = 100,
  defense = 0,
  fixture = {
    category = -32,
    density = 0,
    friction = 0,
    mask = -65499
    --mask = (((0xFFFF) ~4) ~32)
  },
  health = 1,
  max_speed = 300,
  on_spawn = { 'move-up-begin' },
  player_shot = true,
  shape = {
    --points = {
      --12, 4,
      --20, 4,
      --24, 16,
      --20, 28,
      --12, 28,
      --8, 16
    --},
    --type = 'polygon'
    height = 4,
    offset_x = 3,
    offset_y = 3,
    width = 4,
    type = 'rectangle'
  },
  sprites = 'shot1'
}
