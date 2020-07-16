
tileTypes = { empty=1, corner=2, corridor=3, threeWay=4, fourWay=5 }
lineWidth = 2
pathWidthRatio = 0.75
largeCornerRatio = 0.2
smallCornerRatio = 0.1
wallColor = {0.13, 0.13, 0.87, 1}

function createTile(type, row, col, width, rotDeg)
  local rendererMap = { function() end, createCornerRenderer, createCorridorRenderer, createThreeWayRenderer, createFourWayRenderer }
  local rotRad = rotDeg * math.pi / 180

  local tile = {}
  tile.rotation = rotRad
  tile.type = type
  tile.draw = getRenderer(row, col, width, rotRad, rendererMap[type])

  return tile
end

function getRenderer(row, col, width, rotation, renderer)
  return function ()
    local center = width / 2
    local startPoint = { x = (col - 1) * width, y = (row - 1) * width }
    local lineOffset = lineWidth / 2
    local marginTopLeft = center - center * pathWidthRatio + lineOffset
    local marginBottomRight = width - marginTopLeft
    local largeCornerRadius = width * largeCornerRatio
    local smallCornerRadius = width * smallCornerRatio
    local harness = { width = width, largeCornerRadius = largeCornerRadius, smallCornerRadius = smallCornerRadius, marginTopLeft = marginTopLeft, marginBottomRight = marginBottomRight }

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

function createFourWayRenderer(harness)
  love.graphics.line(0, harness.marginTopLeft, harness.marginTopLeft - harness.smallCornerRadius, harness.marginTopLeft)
  love.graphics.line(harness.marginTopLeft, harness.marginTopLeft - harness.smallCornerRadius, harness.marginTopLeft, 0)
  love.graphics.arc("line", "open", harness.marginTopLeft - harness.smallCornerRadius, harness.marginTopLeft - harness.smallCornerRadius, harness.smallCornerRadius, 0, math.pi / 2)

  love.graphics.line(harness.marginBottomRight, 0, harness.marginBottomRight, harness.marginTopLeft - harness.smallCornerRadius)
  love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft, harness.width, harness.marginTopLeft)
  love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft - harness.smallCornerRadius, harness.smallCornerRadius, math.pi / 2, math.pi)

  love.graphics.line(0, harness.marginBottomRight, harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight)
  love.graphics.line(harness.marginTopLeft, harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft, harness.width)
  love.graphics.arc("line", "open", harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, 3 * math.pi / 2, 2 * math.pi)

  love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width, harness.marginBottomRight)
  love.graphics.line(harness.marginBottomRight, harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width)
  love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
end

function createThreeWayRenderer(harness)
  love.graphics.line(0, harness.marginTopLeft, harness.width, harness.marginTopLeft)

  love.graphics.line(0, harness.marginBottomRight, harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight)
  love.graphics.line(harness.marginTopLeft, harness.marginBottomRight + harness.smallCornerRadius, harness.marginTopLeft, harness.width)
  love.graphics.arc("line", "open", harness.marginTopLeft - harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, 3 * math.pi / 2, 2 * math.pi)

  love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width, harness.marginBottomRight)
  love.graphics.line(harness.marginBottomRight, harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width)
  love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
end

function createCornerRenderer(harness)
  love.graphics.line(harness.marginTopLeft + harness.largeCornerRadius, harness.marginTopLeft, harness.width, harness.marginTopLeft)
  love.graphics.line(harness.marginTopLeft, harness.marginTopLeft + harness.largeCornerRadius, harness.marginTopLeft, harness.width)
  love.graphics.arc("line", "open", harness.marginTopLeft + harness.largeCornerRadius, harness.marginTopLeft + harness.largeCornerRadius, harness.largeCornerRadius, math.pi, 3 * math.pi / 2)

  love.graphics.line(harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width, harness.marginBottomRight)
  love.graphics.line(harness.marginBottomRight, harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight, harness.width)
  love.graphics.arc("line", "open", harness.marginBottomRight + harness.smallCornerRadius, harness.marginBottomRight + harness.smallCornerRadius, harness.smallCornerRadius, math.pi, 3 * math.pi / 2)
end

function createCorridorRenderer(harness)
    love.graphics.line(harness.marginTopLeft, 0, harness.marginTopLeft, harness.width)
    love.graphics.line(harness.marginBottomRight, 0, harness.marginBottomRight, harness.width)
end
