--- Main Love filee, containing all the pieces of the game loop.

-- Load world before anything else.
local World = require 'src/services/world'

--- Libs
--local Event = require 'lib/event'

--- Services
local Background = require 'src/services/background'
local Camera = require 'src/services/camera'
--local Debug = 'src/services/debug'
local Entity = require 'src/services/entity'
local InputConfig = require 'src/services/input-config'
local Input = require 'src/services/input'
local Love = require 'src/services/love'

--local Window = require 'src/services/window'
--- Systems
local DrawBackground = require 'src/systems/draw-background'
local DrawEntities = require 'src/systems/draw-entities'
local LoadBackground = require 'src/systems/load-background'
local UpdateEntities = require 'src/systems/update-entities'
local UpdatePlayerCamera = require 'src/systems/update-player-camera'
local UpdatePlayerVelocity = require 'src/systems/update-player-velocity'

--- Functions to initialize on game boot
function Love.load()
  InputConfig.update()
  LoadBackground(Background.list)
end

--- Functions to run on re-draw
function Love.draw()
  Camera.set()
  DrawBackground(Background.list)
  DrawEntities(Entity.list)
  Camera.unset()
end

--- All active callbacks for pressing a key
function Love.keypressed(pressed_key)
  Input.call_key_press(pressed_key)
end

--- All active callback for releasing a key
function Love.keyreleased(released_key)
  Input.call_key_release(released_key)
end

--- Calculations to re-run on going through another loop
-- @int delta time
function Love.update(dt)
  UpdatePlayerCamera(Entity.list)
  UpdateEntities(Entity.list, dt)
  UpdatePlayerVelocity(Entity.list)
  World:update(dt)
end
