--- RegisterInput
-- Register entity's callbacks for key presses / key releases

local System = require 'lib/system'

local Input = require 'src/services/input'

local components = {
  '_entity',
  '=input_actions'
}

local system = function(entity, input_actions)
  -- Provision "input" table to track state of all inputs
  entity.input = {}

  for key, val in pairs(input_actions) do

    local action = require('src/components/actions/' .. val)

    if action.key_press then
      Input.register_key_press(key, function()
        action.key_press(entity)
      end)
    end

    if action.key_release then
      Input.register_key_release(key, function()
        action.key_release(entity)
      end)
    end

  end

  return input_actions
end

return System(components, system)
