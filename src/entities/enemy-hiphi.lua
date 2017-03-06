return {
  acceleration = 140,
  body = {
    fixed_rotation = true,
    type = 'dynamic'
  },
  damage = 100,
  defense = 1,
  fixture = {
    density = 50,
    friction = 100
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
    height = 16,
    offset_x = 16,
    offset_y = 16,
    width = 16,
    type = 'rectangle'
  },
  sprites = 'hiphi'
}
