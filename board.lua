require('tileFactory')

grid = {}
numRows = 11
numCols = 10

function initializeBoard(world)
  local cellWidth = math.min(love.graphics.getWidth() / numCols, love.graphics.getHeight() / numRows)

  table.insert(grid, createRow1(world, cellWidth))
  table.insert(grid, createRow2(world, cellWidth))
  table.insert(grid, createRow3(world, cellWidth))
  table.insert(grid, createRow4(world, cellWidth))
  table.insert(grid, createRow5(world, cellWidth))
  table.insert(grid, createRow6(world, cellWidth))
  table.insert(grid, createRow7(world, cellWidth))
  table.insert(grid, createRow8(world, cellWidth))
  table.insert(grid, createRow9(world, cellWidth))
  table.insert(grid, createRow10(world, cellWidth))
  table.insert(grid, createRow11(world, cellWidth))
end

function drawBoard()
  for i,r in ipairs(grid) do
    for j,c in ipairs(r) do
      c.draw()

      love.graphics.setColor(1, 1, 1, 1)

      for k,w in ipairs(c.walls) do
        love.graphics.rectangle("fill", w.body:getX() - (w.width / 2), w.body:getY() - (w.height / 2), w.width, w.height)
      end
    end
  end
end

function createRow1(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corner,   1, 1,  cellWidth, 0,  { wallType.double, wallType.single })
  row[2]  = createTile(world, tileType.corridor, 1, 2,  cellWidth, 90, { wallType.double, wallType.single })
  row[3]  = createTile(world, tileType.threeWay, 1, 3,  cellWidth, 0,  { wallType.double, wallType.single, wallType.single })
  row[4]  = createTile(world, tileType.corridor, 1, 4,  cellWidth, 90, { wallType.double, wallType.single })
  row[5]  = createTile(world, tileType.corner,   1, 5,  cellWidth, 90, { wallType.doubleFirstHalf, wallType.single })
  row[6]  = createTile(world, tileType.corner,   1, 6,  cellWidth, 0,  { wallType.doubleSecondHalf, wallType.single })
  row[7]  = createTile(world, tileType.corridor, 1, 7,  cellWidth, 90, { wallType.double, wallType.single })
  row[8]  = createTile(world, tileType.threeWay, 1, 8,  cellWidth, 0,  { wallType.double, wallType.single, wallType.single })
  row[9]  = createTile(world, tileType.corridor, 1, 9,  cellWidth, 90, { wallType.double, wallType.single })
  row[10] = createTile(world, tileType.corner,   1, 10, cellWidth, 90, { wallType.double, wallType.single })

  return row
end

function createRow2(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corridor, 2, 1,  cellWidth, 0, { wallType.double, wallType.single })
  row[2]  = createTile(world, tileType.empty,    2, 2,  cellWidth, 0)
  row[3]  = createTile(world, tileType.corridor, 2, 3,  cellWidth, 0, { wallType.single, wallType.single })
  row[4]  = createTile(world, tileType.empty,    2, 4,  cellWidth, 0)
  row[5]  = createTile(world, tileType.corridor, 2, 5,  cellWidth, 0, { wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.corridor, 2, 6,  cellWidth, 0, { wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.empty,    2, 7,  cellWidth, 0)
  row[8]  = createTile(world, tileType.corridor, 2, 8,  cellWidth, 0, { wallType.single, wallType.single })
  row[9]  = createTile(world, tileType.empty,    2, 9,  cellWidth, 0)
  row[10] = createTile(world, tileType.corridor, 2, 10, cellWidth, 0, { wallType.single, wallType.double })

  return row
end

function createRow3(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.threeWay, 3, 1,  cellWidth, 270, { wallType.double, wallType.single, wallType.single })
  row[2]  = createTile(world, tileType.corridor, 3, 2,  cellWidth, 90,  { wallType.single, wallType.single })
  row[3]  = createTile(world, tileType.fourWay,  3, 3,  cellWidth, 0,   { wallType.single, wallType.single, wallType.single, wallType.single })
  row[4]  = createTile(world, tileType.threeWay, 3, 4,  cellWidth, 0,   { wallType.single, wallType.single, wallType.single })
  row[5]  = createTile(world, tileType.threeWay, 3, 5,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.threeWay, 3, 6,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.threeWay, 3, 7,  cellWidth, 0,   { wallType.single, wallType.single, wallType.single })
  row[8]  = createTile(world, tileType.fourWay,  3, 8,  cellWidth, 0,   { wallType.single, wallType.single, wallType.single, wallType.single })
  row[9]  = createTile(world, tileType.corridor, 3, 9,  cellWidth, 90,  { wallType.single, wallType.single })
  row[10] = createTile(world, tileType.threeWay, 3, 10, cellWidth, 90,  { wallType.double, wallType.single, wallType.single })

  return row
end

function createRow4(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corner,   4, 1,  cellWidth, 270, { wallType.double, wallType.single })
  row[2]  = createTile(world, tileType.corridor, 4, 2,  cellWidth, 90,  { wallType.single, wallType.double })
  row[3]  = createTile(world, tileType.threeWay, 4, 3,  cellWidth, 90,  { wallType.single, wallType.single, wallType.double })
  row[4]  = createTile(world, tileType.corner,   4, 4,  cellWidth, 270, { wallType.single, wallType.single })
  row[5]  = createTile(world, tileType.corner,   4, 5,  cellWidth, 90,  { wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.corner,   4, 6,  cellWidth, 0,   { wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.corner,   4, 7,  cellWidth, 180, { wallType.single, wallType.single })
  row[8]  = createTile(world, tileType.threeWay, 4, 8,  cellWidth, 270, { wallType.single, wallType.double, wallType.single })
  row[9]  = createTile(world, tileType.corridor, 4, 9,  cellWidth, 90,  { wallType.single, wallType.double })
  row[10] = createTile(world, tileType.corner,   4, 10, cellWidth, 180, { wallType.double, wallType.single })

  return row
end

function createRow5(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.empty,    5, 1,  cellWidth, 0)
  row[2]  = createTile(world, tileType.empty,    5, 2,  cellWidth, 0)
  row[3]  = createTile(world, tileType.corridor, 5, 3,  cellWidth, 0,   { wallType.double, wallType.single })
  row[4]  = createTile(world, tileType.corner,   5, 4,  cellWidth, 0,   { wallType.single, wallType.none })
  row[5]  = createTile(world, tileType.threeWay, 5, 5,  cellWidth, 180, { wallType.none, wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.threeWay, 5, 6,  cellWidth, 180, { wallType.none, wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.corner,   5, 7,  cellWidth, 90,  { wallType.single, wallType.none })
  row[8]  = createTile(world, tileType.corridor, 5, 8,  cellWidth, 0,   { wallType.single, wallType.double })
  row[9]  = createTile(world, tileType.empty,    5, 9,  cellWidth, 0)
  row[10] = createTile(world, tileType.empty,    5, 10, cellWidth, 0)

  return row
end

function createRow6(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corridor, 6, 1,  cellWidth, 90,  { wallType.double, wallType.double })
  row[2]  = createTile(world, tileType.corridor, 6, 2,  cellWidth, 90,  { wallType.double, wallType.double })
  row[3]  = createTile(world, tileType.fourWay,  6, 3,  cellWidth, 0,   { wallType.double, wallType.single, wallType.double, wallType.single })
  row[4]  = createTile(world, tileType.threeWay, 6, 4,  cellWidth, 90,  { wallType.none, wallType.single, wallType.single })
  row[5]  = createTile(world, tileType.empty,    6, 5,  cellWidth, 0)
  row[6]  = createTile(world, tileType.empty,    6, 6,  cellWidth, 0)
  row[7]  = createTile(world, tileType.threeWay, 6, 7,  cellWidth, 270, { wallType.none, wallType.single, wallType.single })
  row[8]  = createTile(world, tileType.fourWay,  6, 8,  cellWidth, 0,   { wallType.single, wallType.double, wallType.single, wallType.double })
  row[9]  = createTile(world, tileType.corridor, 6, 9,  cellWidth, 90,  { wallType.double, wallType.double })
  row[10] = createTile(world, tileType.corridor, 6, 10, cellWidth, 90,  { wallType.double, wallType.double })

  return row
end

function createRow7(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.empty,    7, 1,  cellWidth, 0)
  row[2]  = createTile(world, tileType.empty,    7, 2,  cellWidth, 0)
  row[3]  = createTile(world, tileType.corridor, 7, 3,  cellWidth, 0,   { wallType.double, wallType.single })
  row[4]  = createTile(world, tileType.threeWay, 7, 4,  cellWidth, 270, { wallType.single, wallType.single, wallType.none })
  row[5]  = createTile(world, tileType.corridor, 7, 5,  cellWidth, 90,  { wallType.none, wallType.single })
  row[6]  = createTile(world, tileType.corridor, 7, 6,  cellWidth, 90,  { wallType.none, wallType.single })
  row[7]  = createTile(world, tileType.threeWay, 7, 7,  cellWidth, 90,  { wallType.single, wallType.none, wallType.single })
  row[8]  = createTile(world, tileType.corridor, 7, 8,  cellWidth, 0,   { wallType.single, wallType.double })
  row[9]  = createTile(world, tileType.empty,    7, 9,  cellWidth, 0)
  row[10] = createTile(world, tileType.empty,    7, 10, cellWidth, 0)

  return row
end

function createRow8(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corner,   8, 1,  cellWidth, 0,   { wallType.double, wallType.single })
  row[2]  = createTile(world, tileType.corridor, 8, 2,  cellWidth, 90,  { wallType.double, wallType.single })
  row[3]  = createTile(world, tileType.fourWay,  8, 3,  cellWidth, 0,   { wallType.double, wallType.single, wallType.single, wallType.single })
  row[4]  = createTile(world, tileType.threeWay, 8, 4,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[5]  = createTile(world, tileType.corner,   8, 5,  cellWidth, 90,  { wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.corner,   8, 6,  cellWidth, 0,   { wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.threeWay, 8, 7,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[8]  = createTile(world, tileType.fourWay,  8, 8,  cellWidth, 0,   { wallType.single, wallType.double, wallType.single, wallType.single })
  row[9]  = createTile(world, tileType.corridor, 8, 9,  cellWidth, 90,  { wallType.double, wallType.single })
  row[10] = createTile(world, tileType.corner,   8, 10, cellWidth, 90,  { wallType.double, wallType.single })

  return row
end

function createRow9(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corner,   9, 1,  cellWidth, 270, { wallType.doubleSecondHalf, wallType.single })
  row[2]  = createTile(world, tileType.corner,   9, 2,  cellWidth, 90,  { wallType.single, wallType.single })
  row[3]  = createTile(world, tileType.threeWay, 9, 3,  cellWidth, 270, { wallType.single, wallType.single, wallType.single })
  row[4]  = createTile(world, tileType.threeWay, 9, 4,  cellWidth, 0,   { wallType.single, wallType.single, wallType.single })
  row[5]  = createTile(world, tileType.threeWay, 9, 5,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.threeWay, 9, 6,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.threeWay, 9, 7,  cellWidth, 0,   { wallType.single, wallType.single, wallType.single })
  row[8]  = createTile(world, tileType.threeWay, 9, 8,  cellWidth, 90,  { wallType.single, wallType.single, wallType.single })
  row[9]  = createTile(world, tileType.corner,   9, 9,  cellWidth, 0,   { wallType.single, wallType.single })
  row[10] = createTile(world, tileType.corner,   9, 10, cellWidth, 180, { wallType.doubleFirstHalf, wallType.single })

  return row
end

function createRow10(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corner,   10, 1,  cellWidth, 0,   { wallType.doubleFirstHalf, wallType.single })
  row[2]  = createTile(world, tileType.threeWay, 10, 2,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[3]  = createTile(world, tileType.corner,   10, 3,  cellWidth, 180, { wallType.single, wallType.single })
  row[4]  = createTile(world, tileType.corner,   10, 4,  cellWidth, 270, { wallType.single, wallType.single })
  row[5]  = createTile(world, tileType.corner,   10, 5,  cellWidth, 90,  { wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.corner,   10, 6,  cellWidth, 0,   { wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.corner,   10, 7,  cellWidth, 180, { wallType.single, wallType.single })
  row[8]  = createTile(world, tileType.corner,   10, 8,  cellWidth, 270, { wallType.single, wallType.single })
  row[9]  = createTile(world, tileType.threeWay, 10, 9,  cellWidth, 180, { wallType.single, wallType.single, wallType.single })
  row[10] = createTile(world, tileType.corner,   10, 10, cellWidth, 90,  { wallType.doubleSecondHalf, wallType.single })

  return row
end

function createRow11(world, cellWidth)
  local row = {}

  row[1]  = createTile(world, tileType.corner,   11, 1,  cellWidth, 270, { wallType.double, wallType.single })
  row[2]  = createTile(world, tileType.corridor, 11, 2,  cellWidth, 90,  { wallType.single, wallType.double })
  row[3]  = createTile(world, tileType.corridor, 11, 3,  cellWidth, 90,  { wallType.single, wallType.double })
  row[4]  = createTile(world, tileType.corridor, 11, 4,  cellWidth, 90,  { wallType.single, wallType.double })
  row[5]  = createTile(world, tileType.threeWay, 11, 5,  cellWidth, 180, { wallType.double, wallType.single, wallType.single })
  row[6]  = createTile(world, tileType.threeWay, 11, 6,  cellWidth, 180, { wallType.double, wallType.single, wallType.single })
  row[7]  = createTile(world, tileType.corridor, 11, 7,  cellWidth, 90,  { wallType.single, wallType.double })
  row[8]  = createTile(world, tileType.corridor, 11, 8,  cellWidth, 90,  { wallType.single, wallType.double })
  row[9]  = createTile(world, tileType.corridor, 11, 9,  cellWidth, 90,  { wallType.single, wallType.double })
  row[10] = createTile(world, tileType.corner,   11, 10, cellWidth, 180, { wallType.double, wallType.single })

  return row
end
