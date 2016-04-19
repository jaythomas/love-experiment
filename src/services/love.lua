-- A wrapper for the love global so that we can later mock it

local noop = function() end

local mock = {
  graphics = {
    draw = noop,
    newImage = noop,
    newQuad = noop
  }
}

if (love) then
  return love
end

return mock
