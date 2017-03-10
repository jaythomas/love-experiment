return {
  acceleration = 140,
  body = {
    fixed_rotation = true,
    type = 'dynamic'
  },
  damage = 100,
  defense = 1,
  fixture = {
    category = -8,
    density = 50,
    friction = 100,
    -- mask = (((0xFFFF) ~8) ~32)
    mask = -65496
  },
  enemy = true,
  health = 100,
  max_speed = 100,
  on_begin_contact = {
    'collide',
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
