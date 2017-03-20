describe('services/util', function()

  local Util

  before_each(function()
    Util = require 'services/util'
  end)

  describe('angle', function()
    it('should exist', function()
      assert.equal(type(Util.angle), 'function')
    end)

    it('should return the arctangent radians between two vectors', function()
      assert.equal(Util.angle(2, 4, 6, 8), 0.785398163397448279)
      assert.equal(Util.angle(-12, 14, 16, -32), -1.0240074859056491619)
    end)
  end)

  describe('copy', function()
    it('should exist', function()
      assert.equal(type(Util.copy), 'function')
    end)

    it('should return copies of tables with keys', function()
      local a = { foo = 'bar' }
      local b = a
      local c = Util.copy(a)
      a.foo = 'baz'
      assert.equal(b.foo, 'baz')
      assert.equal(c.foo, 'bar')
    end)

    it('should return copies of tables with indexes', function()
      local a = { 'foo', 'bar' }
      local b = a
      local c = Util.copy(a)
      a[1] = 'baz'
      assert.equal(b[1], 'baz')
      assert.equal(c[1], 'foo')
    end)

    it('should return deep copies of tables', function()
      local a = {
        foo = {
          bar = {
            'baz'
          }
        }
      }
      local b = Util.copy(a)
      assert.same(a, b)
    end)

    it('should return strings', function()
      local str = 'Foobar123'
      assert.equal(Util.copy(str), 'Foobar123')
    end)

    it('should return integers', function()
      local int = 7
      assert.equal(Util.copy(int), 7)
    end)

    it('should return booleans', function()
      local bool = true
      assert.equal(Util.copy(bool), true)
    end)

    it('should return nils', function()
      assert.equal(Util.copy(nil), nil)
    end)
  end)

  describe('distance', function()
    it('should exist', function()
      assert.equal(type(Util.distance), 'function')
    end)

    it('should return the squared distance (pixels) between two points', function()
      assert.equal(Util.distance(0, 0, 2, 2), 8)
      assert.equal(Util.distance(0, 0, 2, 4), 20)
    end)

    it('should return the distance (pixels) between two points', function()
      assert.equal(Util.distance(0, 0, 2, 2, false), 2.8284271247461903)
      assert.equal(Util.distance(0, 0, 2, 4, false), 4.47213595499958)
    end)

    it('should return 0 for identical points', function()
      assert.equal(Util.distance(2, 4, 2, 4), 0)
    end)
  end)

  describe('push', function()
    it('should exist', function()
      assert.equal(type(Util.push), 'function')
    end)

    it('should modify the given table', function()
      local t = { 1, 2 }
      Util.push(t, 3)
      assert.equal(t[1], 1)
      assert.equal(t[2], 2)
      assert.equal(t[3], 3)
    end)

    it('should accept a list of elements to push', function()
      local t = { 1 }
      Util.push(t, 2, 3)
      assert.equal(t[1], 1)
      assert.equal(t[2], 2)
      assert.equal(t[3], 3)
    end)

    it('should ignore nil values', function()
      local t = { 1 }
      Util.push(t, nil, 2)
      assert.equal(t[1], 1)
      assert.equal(t[2], 2)
      assert.equal(t[3], nil)
    end)
  end)

  describe('reduce', function()
    it('should exist', function()
      assert.equal(type(Util.reduce), 'function')
    end)

    it('should reduce an array to a combinator\'s value', function()
      local array = { 1, 2, 3 }
      local combinator = function(a, b)
        return a + b
      end

      assert.equal(Util.reduce(array, combinator), 6)
      assert.equal(Util.reduce(array, combinator, 3), 9)
    end)

    it('should throw an error if no values were passed in', function()
      local combinator = function(a, b)
        return a + b
      end

      assert.errors(function()
        Util.reduce()
      end)
      assert.errors(function()
        Util.reduce({}, combinator)
      end)
    end)
  end)

  describe('split', function()
    it('should exist', function()
      assert.equal(type(Util.split), 'function')
    end)

    it('should split a string with the given separator', function()
      local str = 'foo-bar-baz'
      local expectation = { 'foo', 'bar', 'baz' }
      assert.same(Util.split(str, '-'), expectation)
      str = 'foo bar baz'
      assert.same(Util.split(str, ' '), expectation)
      str = 'foo%bar%baz'
      assert.same(Util.split(str, '%'), expectation)
      str = 'foo$bar$baz'
      assert.same(Util.split(str, '$'), expectation)
    end)

    it('should split a string with a multi-character separator', function()
      local str = 'foo%%%bar%%%baz'
      local expectation = { 'foo', 'bar', 'baz' }
      assert.same(Util.split(str, '%%%'), expectation)
    end)

    it('should default to a whitespace separator if none is given', function()
      local str = 'foo bar baz'
      local expectation = { 'foo', 'bar', 'baz' }
      assert.same(Util.split(str), expectation)
    end)

    it('should assert that the separator is at least one character', function()
      local str = 'foo bar baz'
      assert.errors(function()
        Util.split(str, '')
      end)
    end)
  end)

end)
