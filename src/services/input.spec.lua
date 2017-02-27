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

  describe('is_paused/toggle_paused', function()
    it('should exist', function()
      assert(type(service.is_paused) == 'function')
      assert(type(service.toggle_paused) == 'function')
    end)

    it('should toggle the paused state', function()
      assert(service.is_paused() == false)
      service.toggle_paused()
      assert(service.is_paused())
    end)
  end)

  describe('register_key_press/call_key_press', function()
    it('should exist', function()
      assert(type(service.register_key_press) == 'function')
      assert(type(service.call_key_press) == 'function')
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
      assert(type(service.register_key_release) == 'function')
      assert(type(service.call_key_release) == 'function')
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
