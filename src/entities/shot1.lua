return {
  acceleration = 300,
  body = {
    offset_x = -3,
    offset_y = 2
  },
  damage = 100,
  defense = 0,
  fixture = {
    category = 2,
    density = 0,
    friction = 0,
    mask = 65535 - 1 - 2
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
