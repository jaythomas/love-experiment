describe('services/input', function()

  local service

  -- Tear down stateful service between tests
  before_each(function()
    service = require 'src/services/input'
  end)
  after_each(function()
    service = nil
    package.loaded['src/services/input'] = nil
  end)

  describe('register_key_press/call_key_press', function()
    it('should exist', function()
      assert.equal(type(service.register_key_press), 'function')
      assert.equal(type(service.call_key_press), 'function')
    end)

    it('should retain and invoke callbacks', function()
      local callbacks = {
        down_fn_1 = function() end,
        down_fn_2 = function() end,
        up_fn_1 = function() end,
        up_fn_2 = function() end
      }

      spy.on(callbacks, 'down_fn_1')
      spy.on(callbacks, 'down_fn_2')
      spy.on(callbacks, 'up_fn_1')
      spy.on(callbacks, 'up_fn_2')

      service.register_key_press('down', callbacks.down_fn_1)
      service.register_key_press('down', callbacks.down_fn_2)
      service.register_key_press('up', callbacks.up_fn_1)
      service.register_key_press('up', callbacks.up_fn_2)
      service.call_key_press('down')
      service.call_key_press('down')
      service.call_key_press('up')
      service.call_key_press('up')

      assert.spy(callbacks.down_fn_1).called(2)
      assert.spy(callbacks.down_fn_2).called(2)
      assert.spy(callbacks.up_fn_1).called(2)
      assert.spy(callbacks.up_fn_2).called(2)
    end)
  end)

  describe('register_key_release/call_key_release', function()
    it('should exist', function()
      assert.equal(type(service.register_key_release), 'function')
      assert.equal(type(service.call_key_release), 'function')
    end)

    it('should retain and invoke callbacks', function()
      local callbacks = {
        down_fn_1 = function() end,
        down_fn_2 = function() end,
        up_fn_1 = function() end,
        up_fn_2 = function() end
      }

      spy.on(callbacks, 'down_fn_1')
      spy.on(callbacks, 'down_fn_2')
      spy.on(callbacks, 'up_fn_1')
      spy.on(callbacks, 'up_fn_2')

      service.register_key_release('down', callbacks.down_fn_1)
      service.register_key_release('down', callbacks.down_fn_2)
      service.register_key_release('up', callbacks.up_fn_1)
      service.register_key_release('up', callbacks.up_fn_2)
      service.call_key_release('down')
      service.call_key_release('down')
      service.call_key_release('up')
      service.call_key_release('up')

      assert.spy(callbacks.down_fn_1).called(2)
      assert.spy(callbacks.down_fn_2).called(2)
      assert.spy(callbacks.up_fn_1).called(2)
      assert.spy(callbacks.up_fn_2).called(2)
    end)
  end)

end)
