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
    getBackgroundColor = noop,
    getBlendMode = noop,
    getCanvas = noop,
    getCanvasFormats = noop,
    getColor = noop,
    getColorMask = noop,
    getCompressedImageFormats = noop,
    getDefaultFilter = noop,
    getDimensions = noop,
    getFont = noop,
    getHeight = noop,
    getLineJoin = noop,
    getLineStyle = noop,
    getLineWidth = noop,
    getPointSize = noop,
    getRendererInfo = noop,
    getScissor = noop,
    getShader = noop,
    getStats = noop,
    getStencilTest = noop,
    getSupported = noop,
    getSystemLimits = noop,
    getWidth = noop,
    intersectScissor = noop,
    isActive = noop,
    isGammaCorrect = noop,
    isWireframe = noop,
    line = noop,
    newCanvas = noop,
    newFont = noop,
    newImage = noop,
    newImageFont = noop,
    newMesh = noop,
    newParticleSystem = noop,
    newQuad = noop,
    newScreenshot = noop,
    newShader = noop,
    newSpriteBatch = noop,
    newText = noop,
    newVideo = noop,
    origin = noop,
    points = noop,
    polygon = noop,
    pop = noop,
    present = noop,
    print = noop,
    printf = noop,
    push = noop,
    rectangle = noop,
    reset = noop,
    rotate = noop,
    scale = noop,
    setBackgroundColor = noop,
    setBlendMode = noop,
    setCanvas = noop,
    setColor = noop,
    setColorMask = noop,
    setDefaultFilter = noop,
    setFont = noop,
    setLineJoin = noop,
    setLineStyle = noop,
    setLineWidth = noop,
    setNewFont = noop,
    setPointSize = noop,
    setScissor = noop,
    setShader = noop,
    setStencilTest = noop,
    setWireframe = noop,
    shear = noop,
    stencil = noop,
    translate = noop
  },
  physics = {
    body = {
      applyAngularImpulse = noop,
      applyForce = noop,
      applyLinearImpulse = noop,
      applyTorque = noop,
      destroy = noop,
      getAngle = noop,
      getAngularDamping = noop,
      getAngularVelocity = noop,
      getContactList = noop,
      getFixtureList = noop,
      getGravityScale = noop,
      getInertia = noop,
      getJointList = noop,
      getLinearDamping = noop,
      getLinearVelocity = noop,
      getLinearVelocityFromLocalPoint = noop,
      getLinearVelocityFromWorldPoint = noop,
      getLocalCenter = noop,
      getLocalPoint = noop,
      getLocalVector = noop,
      getMass = noop,
      getMassData = noop,
      getPosition = noop,
      getType = noop,
      getUserData = noop,
      getWorld = noop,
      getWorldCenter = noop,
      getWorldPoint = noop,
      getWorldPoints = noop,
      getWorldVector = noop,
      getX = noop,
      getY = noop,
      isActive = noop,
      isAwake = noop,
      isBullet = noop,
      isDestroyed = noop,
      isFixedRotation = noop,
      isSleepingAllowed = noop,
      resetMassData = noop,
      setActive = noop,
      setAngle = noop,
      setAngularDamping = noop,
      setAngularVelocity = noop,
      setAwake = noop,
      setBullet = noop,
      setFixedRotation = noop,
      setGravityScale = noop,
      setInertia = noop,
      setLinearDamping = noop,
      setLinearVelocity = noop,
      setMass = noop,
      setMassData = noop,
      setPosition = noop,
      setSleepingAllowed = noop,
      setType = noop,
      setUserData = noop,
      setX = noop,
      setY = noop
    },
    contact = noop,
    fixture = {
      destroy = noop,
      getBody = noop,
      getBoundingBox = noop,
      getCategory = noop,
      getDensity = noop,
      getFilterData = noop,
      getFriction = noop,
      getGroupIndex = noop,
      getMask = noop,
      getMassData = noop,
      getRestitution = noop,
      getShape = noop,
      getUserData = noop,
      isDestroyed = noop,
      isSensor = noop,
      rayCast = noop,
      setCategory = noop,
      setDensity = noop,
      setFilterData = noop,
      setFriction = noop,
      setGroupIndex = noop,
      setMask = noop,
      setRestitution = noop,
      setSensor = noop,
      setUserData = noop,
      testPoint = noop
    },
    joint = {
      destroy = noop,
      getAnchors = noop,
      getBodies = noop,
      getCollideConnected = noop,
      getReactionForce = noop,
      getReactionTorque = noop,
      getType = noop,
      getUserData = noop,
      isDestroyed = noop,
      setUserData = noop
    },
    newBody = noop,
    newFixture = noop,
    newWorld = noop,
    setMeter = noop,
    shape = noop,
    world = {
      destroy = noop,
      getBodyCount = noop,
      getBodyList = noop,
      getCallbacks = noop,
      getContactCount = noop,
      getContactFilter = noop,
      getContactList = noop,
      getGravity = noop,
      getJointCount = noop,
      getJointList = noop,
      isDestroyed = noop,
      isLocked = noop,
      isSleepingAllowed = noop,
      queryBoundingBox = noop,
      rayCast = noop,
      setCallbacks = noop,
      setContactFilter = noop,
      setGravity = noop,
      setSleepingAllowed = noop,
      translateOrigin = noop,
      update = noop
    }
  }
}

if (love) then
  return love
end

return mock
