
tileTypes = { empty=1, corner=2, corridor=3, threeWay=4, fourWay=5 }
pathWidthRatio = 0.5

function createTile(row, col, width)
  local tile = {}
  tile.rotation = love.math.random(0, 3) * math.pi / 2
  -- TODO: enable all types here
  -- tile.type = love.math.random(1, 5)
  tile.type = love.math.random(2, 3)
  tile.draw = getRenderer(tile.type, row, col, width, tile.rotation)
  return tile
end

function getRenderer(tileType, row, col, width, rotation)
  if tileType == tileTypes.corner then
    return createCornerRenderer(row, col, width, rotation)
  elseif tileType == tileTypes.corridor then
    return createCorridorRenderer(row, col, width, rotation)
  else
    return function () end
  end
end

function createCornerRenderer(row, col, width, rotation)
  return function ()
    local lineWidth = 3
    local lineOffset = lineWidth / 2
    local center = width / 2
    local startPoint = { x = (col - 1) * width, y = (row - 1) * width }
    local leftLineX = center - center * pathWidthRatio + lineOffset
    local topLineY = leftLineX
    local rightLineX = center + center * pathWidthRatio - lineOffset
    local bottomLineY = rightLineX
    love.graphics.setLineWidth(lineWidth)

    love.graphics.translate(startPoint.x, startPoint.y)
    love.graphics.translate(center, center)
    love.graphics.rotate(rotation)
    love.graphics.translate(-center, -center)

    love.graphics.setColor(0, 1, 1, 1)
    love.graphics.line(leftLineX, topLineY, width, topLineY)
    love.graphics.line(leftLineX, topLineY, leftLineX, width)
    -- love.graphics.arc("line", "open", center + lineOffset, center + lineOffset, center, math.pi, 3 * math.pi / 2)

    love.graphics.line(rightLineX, bottomLineY, width, bottomLineY)
    love.graphics.line(rightLineX, bottomLineY, rightLineX, width)
    -- love.graphics.arc("line", "open" x, y, radius, math.pi, 3 * math.pi / 2)

    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.rectangle("line", 0, 0, width, width)

    love.graphics.translate(center, center)
    love.graphics.rotate(-rotation)
    love.graphics.translate(-center, -center)
    love.graphics.translate(-startPoint.x, -startPoint.y)
  end
end

function createCorridorRenderer(row, col, width, rotation)
  return function ()
    local lineWidth = 3
    local lineOffset = lineWidth / 2
    local center = width / 2
    local startPoint = { x = (col - 1) * width, y = (row - 1) * width }
    local leftLineX = center - center * pathWidthRatio + lineOffset
    local rightLineX = center + center * pathWidthRatio - lineOffset
    love.graphics.setLineWidth(lineWidth)

    love.graphics.translate(startPoint.x, startPoint.y)
    love.graphics.translate(center, center)
    love.graphics.rotate(rotation)
    love.graphics.translate(-center, -center)


    love.graphics.setColor(0, 1, 1, 1)
    love.graphics.line(leftLineX, 0, leftLineX, width)
    love.graphics.line(rightLineX, 0, rightLineX, width)

    love.graphics.setLineWidth(1)
    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.rectangle("line", 0, 0, width, width)
    love.graphics.translate(center, center)
    love.graphics.rotate(-rotation)
    love.graphics.translate(-center, -center)
    love.graphics.translate(-startPoint.x, -startPoint.y)
  end
end
