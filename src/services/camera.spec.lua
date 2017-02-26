describe('services/camera', function()

  local service

  -- Mock Love dependency
  before_each(function()
    local love_mock = {
      graphics = {
        getDimensions = function()
          return 200, 100
        end,
        push = function()
        end,
        rotate = function()
        end,
        scale = function()
        end,
        translate = function()
        end
      }
    }
    package.loaded['src/services/love'] = love_mock
  end)
  after_each(function()
    package.loaded['src/services/love'] = nil
  end)

  -- Tear down stateful service between tests
  before_each(function()
    service = require 'src/services/camera'
  end)
  after_each(function()
    service = nil
    package.loaded['src/services/camera'] = nil
  end)

  describe('set_position and get_position', function()
    it('should exist', function()
      assert.equal(type(service.set_position), 'function')
      assert.equal(type(service.get_position), 'function')
    end)

    it('should should retain the state of the given positions', function()
      local pos_x, pos_y = 12, 45
      service.set_position(pos_x, pos_y)
      local result_pos_x, result_pos_y = service.get_position()
      assert.equal(pos_x, result_pos_x)
      assert.equal(pos_y, result_pos_y)
    end)
  end)

end)
