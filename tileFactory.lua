
tileTypes = { empty=1, corner=2, corridor=3, threeWay=4, fourWay=5 }

-- tileTypes = {
--   empty=1, topleft=2, topright=3,
--   bottomleft=4, bottomright=5, left=6,
--   top=7, right=8, bottom=9,
-- }

function createTile(row, col, width)
  local tile = {}
  tile.rotation = love.math.random(0, 3) * math.pi / 2
  tile.type = love.math.random(1, 5)
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

-- function getRotation(cell)
--   if cell.placement == tileTypes.top or cell.placement == tileTypes.topright then
--     return math.pi / 2
--   elseif cell.placement == tileTypes.right or cell.placement == tileTypes.bottomright then
--     return math.pi
--   elseif cell.placement == tileTypes.bottom or cell.placement == tileTypes.bottomleft then
--     return 3 * math.pi / 2
--   else
--     return 0
--   end
-- end

function createCornerRenderer(row, col, width, rotation)
  return function ()
    local lineWidth = 3
    local lineOffset = lineWidth / 2
    local center = width / 2
    local startPoint = { x = (col - 1) * width, y = (row - 1) * width }
    love.graphics.setLineWidth(lineWidth)

    love.graphics.translate(startPoint.x, startPoint.y)
    love.graphics.translate(center, center)
    love.graphics.rotate(rotation)
    love.graphics.translate(-center, -center)

    love.graphics.line(center, lineOffset, width, lineOffset)
    love.graphics.line(lineOffset, center, lineOffset, width)
    love.graphics.arc("line", "open", center + lineOffset, center + lineOffset, center, math.pi, 3 * math.pi / 2)

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
    love.graphics.setLineWidth(lineWidth)

    love.graphics.translate(startPoint.x, startPoint.y)
    love.graphics.translate(center, center)
    love.graphics.rotate(rotation)
    love.graphics.translate(-center, -center)

    love.graphics.line(lineOffset, 0, lineOffset, width)

    love.graphics.translate(center, center)
    love.graphics.rotate(-rotation)
    love.graphics.translate(-center, -center)
    love.graphics.translate(-startPoint.x, -startPoint.y)
  end
end

-- function drawcell(row, col, type, rotation)
--   if type == tileTypes.empty then
--     return
--   end
--   local lineWidth = 3
--   local lineOffset = lineWidth / 2
--   local center = cellWidth / 2
--   local startPoint = { x = (col - 1) * cellWidth, y = (row - 1) * cellWidth }
--   love.graphics.setLineWidth(lineWidth)
--
--   love.graphics.translate(startPoint.x, startPoint.y)
--   love.graphics.translate(center, center)
--   love.graphics.rotate(rotation)
--   love.graphics.translate(-center, -center)
--
--   if cell.placement == tileTypes.topright or cell.placement == tileTypes.topleft or cell.placement == tileTypes.bottomleft or cell.placement == tileTypes.bottomright then
--     love.graphics.line(center, lineOffset, cellWidth, lineOffset)
--     love.graphics.line(lineOffset, center, lineOffset, cellWidth)
--     love.graphics.arc("line", "open",center + lineOffset, center + lineOffset, center, math.pi, 3 * math.pi / 2)
--   else
--     love.graphics.line(lineOffset, 0, lineOffset, cellWidth)
--   end
--
--   love.graphics.translate(center, center)
--   love.graphics.rotate(-rotation)
--   love.graphics.translate(-center, -center)
--   love.graphics.translate(-startPoint.x, -startPoint.y)
-- end
