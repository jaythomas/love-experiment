--- Input service
-- Store and process callbacks for input actions

local Util = require 'src/services/util'

local service = {}

-- Buffer key releases to trigger when unpausing
local pause_buffer
local press_callbacks = {}
local release_callbacks = {}

local call_key_press = function(pressed_key)
  if service.is_paused() then
    -- Special exception for the pause key
    if pressed_key == 'return' then
      service.toggle_paused()
      return
    end
    -- Remove any buffered key releases because the player
    -- pressed the key back down while still paused.
    pause_buffer[pressed_key] = nil
    return
  end

  local array = press_callbacks[pressed_key]

  if (array) then
    local i = 1
    while array[i] do
      array[i]()
      i = i + 1
    end
  end
end

local call_key_release = function(released_key)
  if service.is_paused() then
    pause_buffer[released_key] = true
    return
  end

  local array = release_callbacks[released_key]

  if (array) then
    local i = 1
    while array[i] do
      array[i]()
      i = i + 1
    end
  end
end

local is_paused = function()
  return type(pause_buffer) == 'table'
end

local register_key_press = function(key, fn)
  if not press_callbacks[key] then
    press_callbacks[key] = {}
  end
  table.insert(press_callbacks[key], fn)
  return fn
end

local register_key_release = function(key, fn)
  if not release_callbacks[key] then
    release_callbacks[key] = {}
  end
  table.insert(release_callbacks[key], fn)
  return fn
end

local toggle_paused = function()
  if is_paused() then
    -- Copy the pause buffer so we can go ahead
    -- and unpause the game by removing the buffer
    local pause_buffer_copy = Util.copy(pause_buffer)
    pause_buffer = nil
    -- Pause buffer removed, call any key releases
    for k, _ in pairs(pause_buffer_copy) do
      service.call_key_release(k)
    end
  else
    pause_buffer = {}
  end
end

service.call_key_press = call_key_press
service.call_key_release = call_key_release
service.is_paused = is_paused
service.register_key_press = register_key_press
service.register_key_release = register_key_release
service.toggle_paused = toggle_paused
return service
