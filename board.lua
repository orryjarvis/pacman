require('tileFactory')

grid = {}
numRows = 15
numCols = 10

function initializeBoard()
  cellWidth = math.min(love.graphics.getWidth() / numCols, love.graphics.getHeight() / numRows)

  for r=1,numRows do
    row = {}
    for c=1,numCols do

      local cell = createTile(r, c, cellWidth)

      table.insert(row, cell)
    end
    table.insert(grid, row)
  end
end

function drawBoard()
  for i,r in ipairs(grid) do
    for j,c in ipairs(r) do
        c.draw()
    end
  end
end
