
tileType = { empty=1, corner=2, corridor=3, threeWay=4, fourWay=5 }
wallType = { none=1, single=2, double=3, doubleFirstHalf=4, doubleSecondHalf=5 }
lineWidth = 2
pathWidthRatio = 0.75
largeCornerRatio = 0.2
smallCornerRatio = 0.1
doubleLineGapRatio = 0.1
wallColor = {0.13, 0.13, 0.87, 1}

function createTile(type, row, col, width, rotDeg, wallTypes)
  local rendererMap = { function() end, renderCorner, renderCorridor, renderThreeWay, renderFourWay }
  local rotRad = rotDeg * math.pi / 180

  local tile = {}
  tile.rotation = rotRad
  tile.type = type
  tile.draw = getRenderer(row, col, width, rotRad, wallTypes, rendererMap[type])

  return tile
end

function getRenderer(row, col, width, rotation, wallTypes, renderer)
  return function ()
    local center = width / 2
    local startPoint = { x = (col - 1) * width, y = (row - 1) * width }
    local lineOffset = lineWidth / 2
    local marginTopLeft = center - center * pathWidthRatio + lineOffset
    local marginBottomRight = width - marginTopLeft
    local largeCornerRadius = width * largeCornerRatio
    local smallCornerRadius = width * smallCornerRatio
    local doubleLineGap = width * doubleLineGapRatio
    local harness = {
      width = width,
      largeCornerRadius = largeCornerRadius,
      smallCornerRadius = smallCornerRadius,
      doubleLineGap = doubleLineGap,
      marginTopLeft = marginTopLeft,
      marginBottomRight = marginBottomRight,
      wallTypes = wallTypes
    }

    love.graphics.setLineWidth(lineWidth)
    love.graphics.setColor(wallColor)

    love.graphics.translate(startPoint.x, startPoint.y)
    love.graphics.translate(center, center)
    love.graphics.rotate(rotation)
    love.graphics.translate(-center, -center)

    renderer(harness)

    love.graphics.translate(center, center)
    love.graphics.rotate(-rotation)
    love.graphics.translate(-center, -center)
    love.graphics.translate(-startPoint.x, -startPoint.y)
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
