return {
  acceleration = 140,
  body = {},
  damage = 100,
  defense = 1,
  fixture = {
    category = -4,
    density = 50,
    friction = 100,
    mask = 65535 - 4 - 8
  },
  health = 100,
  max_speed = 100,
  on_begin_contact = {
    'update-health',
    'flash-damage',
    'call-on-death'
  },
  on_death = {
    'explode'
  },
  on_spawn = { 'move-down-begin' },
  shape = {
    height = 11,
    offset_x = 8,
    offset_y = 9,
    width = 12,
    type = 'rectangle'
  },
  sprites = 'hiphi'
}
