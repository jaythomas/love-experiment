-- A wrapper for the love global so that we can later mock it

local noop = function() end

local mock = {
  event = {
    clear = noop,
    poll = noop,
    pump = noop,
    push = noop,
    quit = noop,
    wait = noop
  },
  graphics = {
    arc = noop,
    circle = noop,
    clear = noop,
    discard = noop,
    draw = noop,
    ellipse = noop,
    newCanvas = noop,
    newFont = noop,
    newImage = noop,
    newImageFont = noop,
    newMesh = noop,
    newParticleSystem = noop,
    newQuad = noop,
    newShader = noop,
    newSpriteBatch = noop,
    newText = noop,
    newVideo = noop,
    points = noop,
    polygon = noop,
    present = noop,
    print = noop,
    printf = noop,
    quad = noop,
    rectangle = noop,
    setNewFont = noop,
    stencil = noop,
    triangle = noop
  }
}

if (love) then
  return love
end

return mock
