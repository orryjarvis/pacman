require('tileFactory')

grid = {}
numRows = 15
numCols = 10

function initializeBoard()
  local cellWidth = math.min(love.graphics.getWidth() / numCols, love.graphics.getHeight() / numRows)

  table.insert(grid, createRow1(cellWidth))
  table.insert(grid, createRow2(cellWidth))
  table.insert(grid, createRow3(cellWidth))
  table.insert(grid, createRow4(cellWidth))
  table.insert(grid, createRow5(cellWidth))
  table.insert(grid, createRow6(cellWidth))
  table.insert(grid, createRow7(cellWidth))
  table.insert(grid, createRow8(cellWidth))
  table.insert(grid, createRow9(cellWidth))
  table.insert(grid, createRow10(cellWidth))
  table.insert(grid, createRow11(cellWidth))
end

function drawBoard()
  for i,r in ipairs(grid) do
    for j,c in ipairs(r) do
        c.draw()
    end
  end
end

function createRow1(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corner,   1, 1,  cellWidth, 0)
  row[2]  = createTile(tileTypes.corridor, 1, 2,  cellWidth, 90)
  row[3]  = createTile(tileTypes.threeWay, 1, 3,  cellWidth, 0)
  row[4]  = createTile(tileTypes.corridor, 1, 4,  cellWidth, 90)
  row[5]  = createTile(tileTypes.corner,   1, 5,  cellWidth, 90)
  row[6]  = createTile(tileTypes.corner,   1, 6,  cellWidth, 0)
  row[7]  = createTile(tileTypes.corridor, 1, 7,  cellWidth, 90)
  row[8]  = createTile(tileTypes.threeWay, 1, 8,  cellWidth, 0)
  row[9]  = createTile(tileTypes.corridor, 1, 9,  cellWidth, 90)
  row[10] = createTile(tileTypes.corner,   1, 10, cellWidth, 90)

  return row
end

function createRow2(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corridor, 2, 1,  cellWidth, 0)
  row[2]  = createTile(tileTypes.empty,    2, 2,  cellWidth, 0)
  row[3]  = createTile(tileTypes.corridor, 2, 3,  cellWidth, 0)
  row[4]  = createTile(tileTypes.empty,    2, 4,  cellWidth, 0)
  row[5]  = createTile(tileTypes.corridor, 2, 5,  cellWidth, 0)
  row[6]  = createTile(tileTypes.corridor, 2, 6,  cellWidth, 0)
  row[7]  = createTile(tileTypes.empty,    2, 7,  cellWidth, 0)
  row[8]  = createTile(tileTypes.corridor, 2, 8,  cellWidth, 0)
  row[9]  = createTile(tileTypes.empty,    2, 9,  cellWidth, 0)
  row[10] = createTile(tileTypes.corridor, 2, 10, cellWidth, 0)

  return row
end

function createRow3(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.threeWay, 3, 1,  cellWidth, 270)
  row[2]  = createTile(tileTypes.corridor, 3, 2,  cellWidth, 90)
  row[3]  = createTile(tileTypes.fourWay,  3, 3,  cellWidth, 0)
  row[4]  = createTile(tileTypes.threeWay, 3, 4,  cellWidth, 0)
  row[5]  = createTile(tileTypes.threeWay, 3, 5,  cellWidth, 180)
  row[6]  = createTile(tileTypes.threeWay, 3, 6,  cellWidth, 180)
  row[7]  = createTile(tileTypes.threeWay, 3, 7,  cellWidth, 0)
  row[8]  = createTile(tileTypes.fourWay,  3, 8,  cellWidth, 0)
  row[9]  = createTile(tileTypes.corridor, 3, 9,  cellWidth, 90)
  row[10] = createTile(tileTypes.threeWay, 3, 10, cellWidth, 90)

  return row
end

function createRow4(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corner,   4, 1,  cellWidth, 270)
  row[2]  = createTile(tileTypes.corridor, 4, 2,  cellWidth, 90)
  row[3]  = createTile(tileTypes.threeWay, 4, 3,  cellWidth, 90)
  row[4]  = createTile(tileTypes.corner,   4, 4,  cellWidth, 270)
  row[5]  = createTile(tileTypes.corner,   4, 5,  cellWidth, 90)
  row[6]  = createTile(tileTypes.corner,   4, 6,  cellWidth, 0)
  row[7]  = createTile(tileTypes.corner,   4, 7,  cellWidth, 180)
  row[8]  = createTile(tileTypes.threeWay, 4, 8,  cellWidth, 270)
  row[9]  = createTile(tileTypes.corridor, 4, 9,  cellWidth, 90)
  row[10] = createTile(tileTypes.corner,   4, 10, cellWidth, 180)

  return row
end

function createRow5(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.empty,    5, 1,  cellWidth, 0)
  row[2]  = createTile(tileTypes.empty,    5, 2,  cellWidth, 0)
  row[3]  = createTile(tileTypes.corridor, 5, 3,  cellWidth, 0)
  row[4]  = createTile(tileTypes.corner,   5, 4,  cellWidth, 0)
  row[5]  = createTile(tileTypes.threeWay, 5, 5,  cellWidth, 180)
  row[6]  = createTile(tileTypes.threeWay, 5, 6,  cellWidth, 180)
  row[7]  = createTile(tileTypes.corner,   5, 7,  cellWidth, 90)
  row[8]  = createTile(tileTypes.corridor, 5, 8,  cellWidth, 0)
  row[9]  = createTile(tileTypes.empty,    5, 9,  cellWidth, 0)
  row[10] = createTile(tileTypes.empty,    5, 10, cellWidth, 0)

  return row
end

function createRow6(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corridor, 6, 1,  cellWidth, 90)
  row[2]  = createTile(tileTypes.corridor, 6, 2,  cellWidth, 90)
  row[3]  = createTile(tileTypes.fourWay,  6, 3,  cellWidth, 0)
  row[4]  = createTile(tileTypes.threeWay, 6, 4,  cellWidth, 90)
  row[5]  = createTile(tileTypes.empty,    6, 5,  cellWidth, 0)
  row[6]  = createTile(tileTypes.empty,    6, 6,  cellWidth, 0)
  row[7]  = createTile(tileTypes.threeWay, 6, 7,  cellWidth, 270)
  row[8]  = createTile(tileTypes.fourWay,  6, 8,  cellWidth, 0)
  row[9]  = createTile(tileTypes.corridor, 6, 9,  cellWidth, 90)
  row[10] = createTile(tileTypes.corridor, 6, 10, cellWidth, 90)

  return row
end

function createRow7(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.empty,    7, 1,  cellWidth, 0)
  row[2]  = createTile(tileTypes.empty,    7, 2,  cellWidth, 0)
  row[3]  = createTile(tileTypes.corridor, 7, 3,  cellWidth, 0)
  row[4]  = createTile(tileTypes.threeWay, 7, 4,  cellWidth, 270)
  row[5]  = createTile(tileTypes.corridor, 7, 5,  cellWidth, 90)
  row[6]  = createTile(tileTypes.corridor, 7, 6,  cellWidth, 90)
  row[7]  = createTile(tileTypes.threeWay, 7, 7,  cellWidth, 90)
  row[8]  = createTile(tileTypes.corridor, 7, 8,  cellWidth, 0)
  row[9]  = createTile(tileTypes.empty,    7, 9,  cellWidth, 0)
  row[10] = createTile(tileTypes.empty,    7, 10, cellWidth, 0)

  return row
end

function createRow8(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corner,   8, 1,  cellWidth, 0)
  row[2]  = createTile(tileTypes.corridor, 8, 2,  cellWidth, 90)
  row[3]  = createTile(tileTypes.fourWay,  8, 3,  cellWidth, 0)
  row[4]  = createTile(tileTypes.threeWay, 8, 4,  cellWidth, 180)
  row[5]  = createTile(tileTypes.corner,   8, 5,  cellWidth, 90)
  row[6]  = createTile(tileTypes.corner,   8, 6,  cellWidth, 0)
  row[7]  = createTile(tileTypes.threeWay, 8, 7,  cellWidth, 180)
  row[8]  = createTile(tileTypes.fourWay,  8, 8,  cellWidth, 0)
  row[9]  = createTile(tileTypes.corridor, 8, 9,  cellWidth, 90)
  row[10] = createTile(tileTypes.corner,   8, 10, cellWidth, 90)

  return row
end

function createRow9(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corner,   9, 1,  cellWidth, 270)
  row[2]  = createTile(tileTypes.corner,   9, 2,  cellWidth, 90)
  row[3]  = createTile(tileTypes.threeWay, 9, 3,  cellWidth, 270)
  row[4]  = createTile(tileTypes.threeWay, 9, 4,  cellWidth, 0)
  row[5]  = createTile(tileTypes.threeWay, 9, 5,  cellWidth, 180)
  row[6]  = createTile(tileTypes.threeWay, 9, 6,  cellWidth, 180)
  row[7]  = createTile(tileTypes.threeWay, 9, 7,  cellWidth, 0)
  row[8]  = createTile(tileTypes.threeWay, 9, 8,  cellWidth, 90)
  row[9]  = createTile(tileTypes.corner,   9, 9,  cellWidth, 0)
  row[10] = createTile(tileTypes.corner,   9, 10, cellWidth, 180)

  return row
end

function createRow10(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corner,   10, 1,  cellWidth, 0)
  row[2]  = createTile(tileTypes.threeWay, 10, 2,  cellWidth, 180)
  row[3]  = createTile(tileTypes.corner,   10, 3,  cellWidth, 180)
  row[4]  = createTile(tileTypes.corner,   10, 4,  cellWidth, 270)
  row[5]  = createTile(tileTypes.corner,   10, 5,  cellWidth, 90)
  row[6]  = createTile(tileTypes.corner,   10, 6,  cellWidth, 0)
  row[7]  = createTile(tileTypes.corner,   10, 7,  cellWidth, 180)
  row[8]  = createTile(tileTypes.corner,   10, 8,  cellWidth, 270)
  row[9]  = createTile(tileTypes.threeWay, 10, 9,  cellWidth, 180)
  row[10] = createTile(tileTypes.corner,   10, 10, cellWidth, 90)

  return row
end

function createRow11(cellWidth)
  local row = {}

  row[1]  = createTile(tileTypes.corner,   11, 1,  cellWidth, 270)
  row[2]  = createTile(tileTypes.corridor, 11, 2,  cellWidth, 90)
  row[3]  = createTile(tileTypes.corridor, 11, 3,  cellWidth, 90)
  row[4]  = createTile(tileTypes.corridor, 11, 4,  cellWidth, 90)
  row[5]  = createTile(tileTypes.threeWay, 11, 5,  cellWidth, 180)
  row[6]  = createTile(tileTypes.threeWay, 11, 6,  cellWidth, 180)
  row[7]  = createTile(tileTypes.corridor, 11, 7,  cellWidth, 90)
  row[8]  = createTile(tileTypes.corridor, 11, 8,  cellWidth, 90)
  row[9]  = createTile(tileTypes.corridor, 11, 9,  cellWidth, 90)
  row[10] = createTile(tileTypes.corner,   11, 10, cellWidth, 180)

  return row
end
