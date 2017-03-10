--- RegisterBody
-- Build entity's box2d body when spawning

local System = require 'lib/system'

local Love = require 'src/services/love'
local World = require 'src/services/world'

local components = {
  '=body'
}

local system = function(body, pos_x, pos_y)

  local new_body = Love.physics.newBody(
    World,
    pos_x + (body.offset_x or 0),
    pos_y + (body.offset_y or 0),
    body.type
  )
  if body.fixed_rotation then
    new_body:setFixedRotation(true)
  end
  return new_body
end

return System(components, system)
