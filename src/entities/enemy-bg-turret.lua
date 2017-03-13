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
  shape = {
    height = 11,
    offset_x = 8,
    offset_y = 9,
    width = 12,
    type = 'rectangle'
  },
  sprites = 'bg-turret'
}
