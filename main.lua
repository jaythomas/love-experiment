--- This is the main Love file, containing all the pieces of the game loop.

-- Services
local Args = require 'src/services/args'
local Camera = require 'src/services/camera'
local Entity = require 'src/services/entity'
local Input = require 'src/services/input'
local Love = require 'src/services/love'
local Map = require 'src/services/map'
local World = require 'src/services/world'

-- Systems
local UpdateCamera = require 'src/systems/update-camera'
local UpdateEntityAnimation = require 'src/systems/update-entity-animation'
local UpdateEntityVelocity = require 'src/systems/update-entity-velocity'
local UpdateInputVelocity = require 'src/systems/update-input-velocity'
local UpdatePlayerBoundaries = require 'src/systems/update-player-boundaries'

-- Functions to initialize on game boot
function Love.load(args)
  Args.load(args)
  Map.load('stage0')
  -- Press esc to close game
  Input.register_key_press('escape', function()
    Love.event.quit()
  end)
end

-- Functions to run on re-draw
function Love.draw()
  Camera.set()
  Map.draw()
  -- TODO - this could be an entity
  if Input.is_paused() then
    Love.graphics.print('-paused-', Camera.get_position())
  end
  Camera.unset()
end

-- Gamepad/Joystick dpad button press event
-- joystick (joystick table) https://love2d.org/wiki/Joystick
-- button (string)
function Love.gamepadpressed(_, button)
  Input.call_key_press(button)
end

-- Gamepad/Joystick dpad button release event
-- joystick (joystick table) https://love2d.org/wiki/Joystick
-- button (string)
function Love.gamepadreleased(_, button)
  Input.call_key_release(button)
end

-- All active callbacks for pressing a key
-- pressedKey (string)
function Love.keypressed(pressed_key)
  Input.call_key_press(pressed_key)
end

-- All active callbacks for releasing a key
-- releasedKey (string)
function Love.keyreleased(released_key)
  Input.call_key_release(released_key)
end

-- Calculations to re-run on going through another loop
-- dt (integer) delta time (in seconds)
function Love.update(dt)
  if Input.is_paused() then
    return
  end
  for _, entity in ipairs(Entity.list) do
    UpdateCamera(entity)
    UpdateEntityVelocity(entity)
    UpdateInputVelocity(entity)
    UpdatePlayerBoundaries(entity)
    UpdateEntityAnimation(entity, dt)
  end
  World:update(dt)
end
