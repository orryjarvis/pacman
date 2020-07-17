
tileType = { empty=1, corner=2, corridor=3, threeWay=4, fourWay=5 }
wallType = { none=1, single=2, double=3, doubleFirstHalf=4, doubleSecondHalf=5 }
lineWidth = 2
pathWidthRatio = 0.75
largeCornerRatio = 0.2
smallCornerRatio = 0.1
doubleLineGapRatio = 0.1
wallColor = {0.13, 0.13, 0.87, 1}

function createTile(world, type, row, col, width, rotDeg, wallTypes)
  local rendererMap = { function() end, renderCorner, renderCorridor, renderThreeWay, renderFourWay }
  local wallGeneratorMap = { function() return {} end, createCornerWalls, createCorridorWalls, createThreeWayWalls, createFourWayWalls }
  local rotRad = rotDeg * math.pi / 180
  local harness = getDataHarness(row, col, width, wallTypes)

  local tile = {}
  tile.rotation = rotRad
  tile.type = type
  tile.draw = getRenderer(harness, rotRad, rendererMap[type])
  tile.walls = wallGeneratorMap[type](world, harness, rotDeg)

  return tile
end

function createCornerWalls(world, harness, rotDeg)
  local rectCenter = harness.collisionMargin / 2
  local walls = {}

  if (rotDeg == 0 or rotDeg == 90) then
    local wall = {}
    wall.width = harness.width
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.center, harness.startPoint.y + rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 180 or rotDeg == 270) then
    local wall = {}
    wall.width = harness.width
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.center, harness.startPoint.y + harness.width - rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 0 or rotDeg == 270) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.width
    wall.body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + harness.center)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 90 or rotDeg == 180) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.width
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + harness.center)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 0) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + harness.width - rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  elseif (rotDeg == 90) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + harness.width - rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  elseif (rotDeg == 180) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  else
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  return walls
end

function createCorridorWalls(world, harness, rotDeg)
  local rectCenter = harness.collisionMargin / 2
  local walls = { {}, {} }

  if (rotDeg == 0 or rotDeg == 180) then
    walls[1].width = harness.collisionMargin
    walls[1].height = harness.width
    walls[1].body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + harness.center)
    walls[1].shape = love.physics.newRectangleShape(walls[1].width, walls[1].height)
    walls[1].fixture = love.physics.newFixture(walls[1].body, walls[1].shape)

    walls[2].width = harness.collisionMargin
    walls[2].height = harness.width
    walls[2].body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + harness.center)
    walls[2].shape = love.physics.newRectangleShape(walls[2].width, walls[2].height)
    walls[2].fixture = love.physics.newFixture(walls[2].body, walls[2].shape)
  else
    walls[1].width = harness.width
    walls[1].height = harness.collisionMargin
    walls[1].body = love.physics.newBody(world, harness.startPoint.x + harness.center, harness.startPoint.y + rectCenter)
    walls[1].shape = love.physics.newRectangleShape(walls[1].width, walls[1].height)
    walls[1].fixture = love.physics.newFixture(walls[1].body, walls[1].shape)

    walls[2].width = harness.width
    walls[2].height = harness.collisionMargin
    walls[2].body = love.physics.newBody(world, harness.startPoint.x + harness.center, harness.startPoint.y + harness.width - rectCenter)
    walls[2].shape = love.physics.newRectangleShape(walls[2].width, walls[2].height)
    walls[2].fixture = love.physics.newFixture(walls[2].body, walls[2].shape)
  end

  return walls
end

function createThreeWayWalls(world, harness, rotDeg)
  local rectCenter = harness.collisionMargin / 2
  local walls = {}

  if (rotDeg == 0) then
    local wall = {}
    wall.width = harness.width
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.center, harness.startPoint.y + rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  elseif (rotDeg == 180) then
    local wall = {}
    wall.width = harness.width
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.center, harness.startPoint.y + harness.width - rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  elseif (rotDeg == 90) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.width
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + harness.center)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  else
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.width
    wall.body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + harness.center)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 0 or rotDeg == 90) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + harness.width - rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 180 or rotDeg == 270) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 0 or rotDeg == 270) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + harness.width - rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  if (rotDeg == 90 or rotDeg == 180) then
    local wall = {}
    wall.width = harness.collisionMargin
    wall.height = harness.collisionMargin
    wall.body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + rectCenter)
    wall.shape = love.physics.newRectangleShape(wall.width, wall.height)
    wall.fixture = love.physics.newFixture(wall.body, wall.shape)
    table.insert(walls, wall)
  end

  return walls
end

function createFourWayWalls(world, harness, rotDeg)
  local rectCenter = harness.collisionMargin / 2
  local walls = { {}, {}, {}, {} }

  for i=1,4 do
    walls[i].width = harness.collisionMargin
    walls[i].height = harness.collisionMargin
  end

  walls[1].body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + rectCenter)
  walls[1].shape = love.physics.newRectangleShape(harness.collisionMargin, harness.collisionMargin)
  walls[2].body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + rectCenter)
  walls[2].shape = love.physics.newRectangleShape(harness.collisionMargin, harness.collisionMargin)
  walls[3].body = love.physics.newBody(world, harness.startPoint.x + rectCenter, harness.startPoint.y + harness.width - rectCenter)
  walls[3].shape = love.physics.newRectangleShape(harness.collisionMargin, harness.collisionMargin)
  walls[4].body = love.physics.newBody(world, harness.startPoint.x + harness.width - rectCenter, harness.startPoint.y + harness.width - rectCenter)
  walls[4].shape = love.physics.newRectangleShape(harness.collisionMargin, harness.collisionMargin)

  for i=1,4 do
    walls[i].fixture = love.physics.newFixture(walls[i].body, walls[i].shape)
  end

  return walls
end

function getDataHarness(row, col, width, wallTypes)
  local center = width / 2
  local startPoint = { x = (col - 1) * width, y = (row - 1) * width }
  local lineOffset = lineWidth / 2
  local collisionMargin = center - center * pathWidthRatio + lineWidth
  local marginTopLeft = center - center * pathWidthRatio + lineOffset
  local marginBottomRight = width - marginTopLeft
  local largeCornerRadius = width * largeCornerRatio
  local smallCornerRadius = width * smallCornerRatio
  local doubleLineGap = width * doubleLineGapRatio

  return {
    width = width,
    center = center,
    startPoint = startPoint,
    largeCornerRadius = largeCornerRadius,
    smallCornerRadius = smallCornerRadius,
    doubleLineGap = doubleLineGap,
    marginTopLeft = marginTopLeft,
    marginBottomRight = marginBottomRight,
    collisionMargin = collisionMargin,
    wallTypes = wallTypes,
  }
end

function getRenderer(harness, rotation, renderer)
  return function ()
    love.graphics.setLineWidth(lineWidth)
    love.graphics.setColor(wallColor)

    love.graphics.translate(harness.startPoint.x, harness.startPoint.y)
    love.graphics.translate(harness.center, harness.center)
    love.graphics.rotate(rotation)
    love.graphics.translate(-harness.center, -harness.center)

    renderer(harness, wallTypes)

    love.graphics.translate(harness.center, harness.center)
    love.graphics.rotate(-rotation)
    love.graphics.translate(-harness.center, -harness.center)
    love.graphics.translate(-harness.startPoint.x, -harness.startPoint.y)
  end
end

function renderFourWay(harness)
  if (harness.wallTypes[1] ~= wallType.none) then
    love.graphics.line(0, harness.marginTopLeft, harness.marginTopLeft - harness.smallCornerRadius, harness.marginTopLeft)
    love.graphics.line(harness.marginTopLeft, harness.marginTopLeft - harness.smallCornerRadius, harness.marginTopLeft, 0)
    love.graphics.arc("line", "open", harness.marginTopLeft - harness.smallCornerRadius, harness.marginTopLeft - harness.smallCornerRadius, harness.smallCornerRadius, 0, math.pi / 2)
  end

  if (harness.wallTypes[1] == wallType.double) then
    love.graphics.line(0, harness.marginTopLeft - harness.doubleLineGap, harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.marginTopLeft - harness.doubleLineGap)
    love.graphics.line(harness.marginTopLeft - harness.doubleLineGap, harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.marginTopLeft - harness.doubleLineGap, 0)
    love.graphics.arc("line", "open", harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.smallCornerRadius, 0, math.pi / 2)
  end

  if (harness.wallTypes[2] ~= wallType.none) then
    love.graphics.line(harness.marginBottomRight, 0, harness.marginBottomRight, harness.marginTopLeft - harness.smallCornerRadius)
    love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft, harness.width, harness.marginTopLeft)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft - harness.smallCornerRadius, harness.smallCornerRadius, math.pi / 2, math.pi)
  end

  if (harness.wallTypes[2] == wallType.double) then
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap, 0, harness.marginBottomRight + harness.doubleLineGap, harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius)
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginTopLeft - harness.doubleLineGap, harness.width, harness.marginTopLeft - harness.doubleLineGap)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.smallCornerRadius, math.pi / 2, math.pi)
  end

  if (harness.wallTypes[3] ~= wallType.none) then
    love.graphics.line(0, harness.marginBottomRight, harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight)
    love.graphics.line(harness.marginTopLeft, harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft, harness.width)
    love.graphics.arc("line", "open", harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, 3 * math.pi / 2, 2 * math.pi)
  end

  if (harness.wallTypes[3] == wallType.double) then
    love.graphics.line(0, harness.marginBottomRight + harness.doubleLineGap, harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap)
    love.graphics.line(harness.marginTopLeft - harness.doubleLineGap, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginTopLeft - harness.doubleLineGap, harness.width)
    love.graphics.arc("line", "open", harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.smallCornerRadius, 3 * math.pi / 2, 2 * math.pi)
  end

  if (harness.wallTypes[4] ~= wallType.none) then
    love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width, harness.marginBottomRight)
    love.graphics.line(harness.marginBottomRight, harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
  end

  if (harness.wallTypes[4] == wallType.double) then
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap, harness.width, harness.marginBottomRight + harness.doubleLineGap)
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap, harness.width)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
  end
end

function renderThreeWay(harness)
  if (harness.wallTypes[1] ~= wallType.none) then
    love.graphics.line(0, harness.marginTopLeft, harness.width, harness.marginTopLeft)
  end

  if (harness.wallTypes[1] == wallType.double) then
    love.graphics.line(0, harness.marginTopLeft - harness.doubleLineGap, harness.width, harness.marginTopLeft - harness.doubleLineGap)
  end

  if (harness.wallTypes[2] ~= wallType.none) then
    love.graphics.line(0, harness.marginBottomRight, harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight)
    love.graphics.line(harness.marginTopLeft, harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft, harness.width)
    love.graphics.arc("line", "open", harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, 3 * math.pi / 2, 2 * math.pi)
  end

  if (harness.wallTypes[2] == wallType.double) then
    love.graphics.line(0, harness.marginBottomRight + harness.doubleLineGap, harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap)
    love.graphics.line(harness.marginTopLeft - harness.doubleLineGap, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginTopLeft - harness.doubleLineGap, harness.width)
    love.graphics.arc("line", "open", harness.marginTopLeft - harness.doubleLineGap - harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.smallCornerRadius, 3 * math.pi / 2, 2 * math.pi)
  end

  if (harness.wallTypes[3] ~= wallType.none) then
    love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width, harness.marginBottomRight)
    love.graphics.line(harness.marginBottomRight, harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
  end

  if (harness.wallTypes[3] == wallType.double) then
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap, harness.width, harness.marginBottomRight + harness.doubleLineGap)
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap, harness.width)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
  end
end

function renderCorner(harness)
  if (harness.wallTypes[1] ~= wallType.none) then
    love.graphics.line(harness.marginTopLeft + harness.smallCornerRadius, harness.marginTopLeft, harness.width, harness.marginTopLeft)
    love.graphics.line(harness.marginTopLeft, harness.marginTopLeft + harness.smallCornerRadius, harness.marginTopLeft, harness.width)
    love.graphics.arc("line", "open", harness.marginTopLeft + harness.smallCornerRadius, harness.marginTopLeft + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
  end

  if (harness.wallTypes[1] == wallType.double) then
    love.graphics.line(harness.marginTopLeft - harness.doubleLineGap + harness.largeCornerRadius, harness.marginTopLeft - harness.doubleLineGap, harness.width, harness.marginTopLeft - harness.doubleLineGap)
    love.graphics.line(harness.marginTopLeft - harness.doubleLineGap, harness.marginTopLeft - harness.doubleLineGap + harness.largeCornerRadius, harness.marginTopLeft - harness.doubleLineGap, harness.width)
    love.graphics.arc("line", "open", harness.marginTopLeft - harness.doubleLineGap + harness.largeCornerRadius, harness.marginTopLeft - harness.doubleLineGap + harness.largeCornerRadius, harness.largeCornerRadius, math.pi, 3 * math.pi / 2)
  elseif (harness.wallTypes[1] == wallType.doubleFirstHalf) then
    love.graphics.line(harness.marginTopLeft - harness.doubleLineGap, 0, harness.marginTopLeft - harness.doubleLineGap, harness.width)
  elseif (harness.wallTypes[1] == wallType.doubleSecondHalf) then
    love.graphics.line(0, harness.marginTopLeft - harness.doubleLineGap, harness.width, harness.marginTopLeft - harness.doubleLineGap)
  end

  if (harness.wallTypes[2] ~= wallType.none) then
    love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width, harness.marginBottomRight)
    love.graphics.line(harness.marginBottomRight, harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
  end

  if (harness.wallTypes[2] == wallType.double) then
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap, harness.width, harness.marginBottomRight + harness.doubleLineGap)
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap, harness.width)
    love.graphics.arc("line", "open", harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.marginBottomRight + harness.doubleLineGap + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
  end
end

function renderCorridor(harness)
  if (harness.wallTypes[1] ~= wallType.none) then
    love.graphics.line(harness.marginTopLeft, 0, harness.marginTopLeft, harness.width)
  end

  if (harness.wallTypes[1] == wallType.double) then
    love.graphics.line(harness.marginTopLeft - harness.doubleLineGap, 0, harness.marginTopLeft - harness.doubleLineGap, harness.width)
  end

  if (harness.wallTypes[2] ~= wallType.none) then
    love.graphics.line(harness.marginBottomRight, 0, harness.marginBottomRight, harness.width)
  end

  if (harness.wallTypes[2] == wallType.double) then
    love.graphics.line(harness.marginBottomRight + harness.doubleLineGap, 0, harness.marginBottomRight + harness.doubleLineGap, harness.width)
  end
end
