--- Window
-- Some constant variables calculated ahead of time.

local Love = require 'src/services/love'

local width, height = Love.graphics:getDimensions()
print(width, height)

return {
  height = height,
  width = width
}
