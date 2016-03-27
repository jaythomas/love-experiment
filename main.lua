-- local globals
local Inspect = require 'lib/inspect'
local Input = require 'src/services/input'
local Map = require 'src/services/map'
local Player = require 'src/services/player'
local Window = require 'src/services/window'

function love.load()
  -- Hard-code some default key maps:
  Input.register_key_press('up', function() Player.move('up') end)
  Input.register_key_press('left', function() Player.move('left') end)
  Input.register_key_press('down', function() Player.move('down') end)
  Input.register_key_press('right', function() Player.move('right') end)
  Input.register_key_press('w', function() Player.move('up') end)
  Input.register_key_press('a', function() Player.move('left') end)
  Input.register_key_press('s', function() Player.move('down') end)
  Input.register_key_press('d', function() Player.move('right') end)
  Map.load(require 'src/backgrounds/country-side')
end

function love.draw()
  Map.draw()
end

function love.keypressed(pressed_key)
  Input.call_key_press(pressed_key)
end
