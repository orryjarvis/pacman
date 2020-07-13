
tileTypes = { empty=1, corner=2, corridor=3, threeWay=4, fourWay=5 }
lineWidth = 3
pathWidthRatio = 0.5

function createTile(row, col, width)
  local tile = {}
  local rendererMap = { function() end, createCornerRenderer, createCorridorRenderer, createThreeWayRenderer, createFourWayRenderer }
  tile.rotation = love.math.random(0, 3) * math.pi / 2
  tile.type = love.math.random(1, 5)
  tile.draw = getRenderer(row, col, width, tile.rotation, rendererMap[tile.type])
  return tile
end

function getRenderer(row, col, width, rotation, renderer)
  return function ()
    local center = width / 2
    local startPoint = { x = (col - 1) * width, y = (row - 1) * width }
    local lineOffset = lineWidth / 2
    local marginTopLeft = center - center * pathWidthRatio + lineOffset
    local marginBottomRight = width - marginTopLeft
    local harness = { width = width, marginTopLeft = marginTopLeft, marginBottomRight = marginBottomRight }

    love.graphics.setLineWidth(lineWidth)
    love.graphics.setColor(0, 1, 1, 1)

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
  love.graphics.line(0, harness.marginTopLeft, harness.marginTopLeft, harness.marginTopLeft)
  love.graphics.line(harness.marginTopLeft, harness.marginTopLeft, harness.marginTopLeft, 0)
  -- love.graphics.arc("line", "open", center + lineOffset, center + lineOffset, center, math.pi, 3 * math.pi / 2)

  love.graphics.line(harness.marginBottomRight, 0, harness.marginBottomRight, harness.marginTopLeft)
  love.graphics.line(harness.marginBottomRight, harness.marginTopLeft, harness.width, harness.marginTopLeft)
  -- love.graphics.arc("line", "open", center + lineOffset, center + lineOffset, center, math.pi, 3 * math.pi / 2)

  love.graphics.line(0, harness.marginBottomRight, harness.marginTopLeft, harness.marginBottomRight)
  love.graphics.line(harness.marginTopLeft, harness.marginBottomRight, harness.marginTopLeft, harness.width)
  -- love.graphics.arc("line", "open" x, y, radius, math.pi, 3 * math.pi / 2)

  love.graphics.line(harness.width, harness.marginBottomRight, harness.marginBottomRight, harness.marginBottomRight)
  love.graphics.line(harness.marginBottomRight, harness.marginBottomRight, harness.marginBottomRight, harness.width)
  -- love.graphics.arc("line", "open" x, y, radius, math.pi, 3 * math.pi / 2)

  love.graphics.setColor(1, 1, 0, 1)
  love.graphics.rectangle("line", 0, 0, harness.width, harness.width)
end

function createThreeWayRenderer(harness)
  love.graphics.line(0, harness.marginTopLeft, harness.width, harness.marginTopLeft)
  -- love.graphics.arc("line", "open", center + lineOffset, center + lineOffset, center, math.pi, 3 * math.pi / 2)

  love.graphics.line(0, harness.marginBottomRight, harness.marginTopLeft, harness.marginBottomRight)
  love.graphics.line(harness.marginTopLeft, harness.marginBottomRight, harness.marginTopLeft, harness.width)
  -- love.graphics.arc("line", "open" x, y, radius, math.pi, 3 * math.pi / 2)

  love.graphics.line(harness.width, harness.marginBottomRight, harness.marginBottomRight, harness.marginBottomRight)
  love.graphics.line(harness.marginBottomRight, harness.marginBottomRight, harness.marginBottomRight, harness.width)
  -- love.graphics.arc("line", "open" x, y, radius, math.pi, 3 * math.pi / 2)

  love.graphics.setColor(1, 1, 0, 1)
  love.graphics.rectangle("line", 0, 0, harness.width, harness.width)
end

function createCornerRenderer(harness)
  love.graphics.line(harness.marginTopLeft, harness.marginTopLeft, harness.width, harness.marginTopLeft)
  love.graphics.line(harness.marginTopLeft, harness.marginTopLeft, harness.marginTopLeft, harness.width)
  -- love.graphics.arc("line", "open", center + lineOffset, center + lineOffset, center, math.pi, 3 * math.pi / 2)

  love.graphics.line(harness.marginBottomRight, harness.marginBottomRight, harness.width, harness.marginBottomRight)
  love.graphics.line(harness.marginBottomRight, harness.marginBottomRight, harness.marginBottomRight, harness.width)
  -- love.graphics.arc("line", "open" x, y, radius, math.pi, 3 * math.pi / 2)

  love.graphics.setColor(1, 1, 0, 1)
  love.graphics.rectangle("line", 0, 0, harness.width, harness.width)
end

function createCorridorRenderer(harness)
    love.graphics.line(harness.marginTopLeft, 0, harness.marginTopLeft, harness.width)
    love.graphics.line(harness.marginBottomRight, 0, harness.marginBottomRight, harness.width)

    love.graphics.setLineWidth(1)
    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.rectangle("line", 0, 0, harness.width, harness.width)
end
