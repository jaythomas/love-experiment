return {
  acceleration = 140,
  body = {},
  damage = 100,
  defense = 1,
  fixture = {
    category = 1,
    density = 10,
    friction = 0,
    mask = 65535 - 1 - 2
  },
  health = 100,
  input_actions = {
    dpdown = {
      key_press = 'move-down-begin',
      key_release = 'move-down-finish'
    },
    dpleft = {
      key_press = 'move-left-begin',
      key_release = 'move-left-finish'
    },
    dpright = {
      key_press = 'move-right-begin',
      key_release = 'move-right-finish'
    },
    dpup = {
      key_press = 'move-up-begin',
      key_release = 'move-up-finish'
    },
    down = {
      key_press = 'move-down-begin',
      key_release = 'move-down-finish'
    },
    left = {
      key_press = 'move-left-begin',
      key_release = 'move-left-finish'
    },
    right = {
      key_press = 'move-right-begin',
      key_release = 'move-right-finish'
    },
    up = {
      key_press = 'move-up-begin',
      key_release = 'move-up-finish'
    },
    ['return'] = {
      key_press = 'toggle-pause'
    },
    x = {
      key_press = 'shot1'
    }
  },
  max_speed = 120,
  on_begin_contact = {
    'update-health',
    'flash-damage',
    'call-on-death'
  },
  on_death = {
    'explode',
    'unregister-player'
  },
  on_spawn = {
    'register-player'
  },
  player_id = 1,
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
    height = 12,
    offset_x = 8,
    offset_y = 8,
    width = 12,
    type = 'rectangle'
  },
  sprites = 'm1'
}
