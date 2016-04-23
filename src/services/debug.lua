local Inspect = require 'lib/inspect'

local debug = function(...)
  local t = {...}

  for i = 1, #t do
    t[i] = Inspect(t[i])
    print(t[i])
  end
end

return debug
