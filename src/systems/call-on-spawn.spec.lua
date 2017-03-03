describe('systems/call-on-spawn', function()

  local system = require 'src/systems/call-on-spawn'

  describe('it should be a function', function()
    assert(type(system) == 'function')
  end)

end)
