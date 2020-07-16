function love.load(arg)
  require('board')
  require('player')
  initializeBoard()
  initializePlayer()
end

function love.update(dt)
  updatePlayer(dt)
end


function love.draw()
  love.graphics.setBackgroundColor(0, 0, 0, 1)
  drawBoard()
  drawPlayer()
end
