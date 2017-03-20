return {
  body = {},
  defense = 1,
  fixture = {
    category = -8,
    mask = 65535 - 4 - 8
  },
  on_begin_contact = {
    'update-health',
    'flash-damage',
    'call-on-death'
  },
  on_spawn = {
  },
  on_update = {
    'update-bg-turret'
  },
  shape = {
    height = 12,
    width = 12,
    type = 'rectangle'
  },
  sprites = 'bg-turret'
}
