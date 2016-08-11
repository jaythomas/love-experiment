local Love = require 'src/services/love'
local World = require 'src/services/world'

local body = Love.physics.newBody(World, 200, 300)
local shape = Love.physics.newRectangleShape(600, 32)
local fixture = Love.physics.newFixture(body, shape)

local entity = {
  body = body,
  fixture = fixture,
  polygon = true,
  shape = shape
}

return entity
