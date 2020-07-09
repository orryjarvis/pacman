function love.load(arg)
  require('board')
  initializeBoard()
end

function love.update(dt)
  -- body...
end


function love.draw()
  love.graphics.setBackgroundColor(0, 0, 0, 1)
  for i,r in ipairs(grid) do
    for j,c in ipairs(r) do
        c.draw()
    end
  end
end
