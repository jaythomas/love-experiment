-- local globals
local Inspect = require 'lib/inspect'
local Map = require 'src/services/map'
local Window = require 'src/services/window'

function love.load()
  Map.load(require 'src/backgrounds/country-side')
end

function love.draw()
  Map.draw()
end

function love.keypressed(pressed_key)
  local Player = {
    ['move'] = function(direction)
      print(direction)
    end
  }

  local key_map = {
    ['escape'] = love.event.quit,
    ['up'] = function() Player.move('up') end,
    ['down'] = function() Player.move('down') end,
    ['left'] = function() Player.move('left') end,
    ['right'] = function() Player.move('right') end,
    ['w'] = function() Player.move('up') end,
    ['a'] = function() Player.move('left') end,
    ['s'] = function() Player.move('down') end,
    ['d'] = function() Player.move('right') end
  }

  local key_function = key_map[pressed_key]

  if (key_function) then
    key_function()
  end
end
