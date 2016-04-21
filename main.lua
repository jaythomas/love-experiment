-- Libs
--local Event = require 'lib/event'
--local Inspect = require 'lib/inspect'
-- Services
local Background = require 'src/services/background'
local Entity = require 'src/services/entity'
local InputConfig = require 'src/services/input-config'
local Input = require 'src/services/input'
local Love = require 'src/services/love'
--local Window = require 'src/services/window'
-- Systems
local UpdateMotion = require 'src/systems/update-motion'
local UpdatePlayerVelocity = require 'src/systems/update-player-velocity'

function Love.load()
  InputConfig.update()
  Background.load('country_side')
end

function Love.draw()
  Background.draw()
  Entity.draw()
end

function Love.keypressed(pressed_key)
  Input.call_key_press(pressed_key)
end

function Love.keyreleased(released_key)
  Input.call_key_release(released_key)
end

function Love.update(dt)
  Entity.update(dt)
  UpdatePlayerVelocity(Entity.list)
  UpdateMotion(Entity.list, dt)
end
