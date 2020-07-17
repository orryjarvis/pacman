player = {}
lengthOfAnimationState = 0.25
playerToPathRatio = 0.85
function initializePlayer()
  player.speed = 180
  player.animationState = 0
  player.direction = 0
  player.dt = 0
  local cellWidth = math.min(love.graphics.getWidth() / numCols, love.graphics.getHeight() / numRows)
  local cellHalf = cellWidth / 2
  local collisionMargin = cellHalf - cellHalf * pathWidthRatio + lineWidth
  player.collisionSize = cellWidth - 2 * collisionMargin
  player.drawSize = player.collisionSize * playerToPathRatio
  player.body = love.physics.newBody(world, cellHalf, cellHalf)
  player.shape = love.physics.newCircleShape(player.collisionSize / 2)
  player.fixture = love.physics.newFixture(player.body, player.shape)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
end

function updatePlayer(dt)
  if player.dt + dt > lengthOfAnimationState then
    nextAnimationState = math.fmod(player.animationState + 1, 4)
  else
    nextAnimationState = player.animationState
  end
  local nextDt = math.fmod(player.dt + dt, lengthOfAnimationState)
  if love.keyboard.isDown("w") and player.body:getY() > 0 then
    player.body:setY(player.body:getY() - player.speed * dt)
    player.animationState = nextAnimationState
    player.dt = nextDt
    player.direction = 3
  end
  if love.keyboard.isDown("a") and player.body:getX() > 0 then
    player.body:setX(player.body:getX() - player.speed * dt)
    player.animationState = nextAnimationState
    player.dt = nextDt
    player.direction = 2
  end
  if love.keyboard.isDown("s") and player.body:getY() < love.graphics.getHeight() then
    player.body:setY(player.body:getY() + player.speed * dt)
    player.animationState = nextAnimationState
    player.dt = nextDt
    player.direction = 1
  end
  if love.keyboard.isDown("d") and player.body:getX() < love.graphics.getWidth() then
    player.body:setX(player.body:getX() + player.speed * dt)
    player.animationState = nextAnimationState
    player.dt = nextDt
    player.direction = 0
  end
  if not love.keyboard.isDown("d") and not love.keyboard.isDown("w") and not love.keyboard.isDown("s") and not love.keyboard.isDown("a") then
    player.animationState = 0
    player.dt = 0
  end
end

function drawPlayer()
  love.graphics.setLineWidth(0)
  local facing = math.pi * player.direction / 2
  local open = math.pi / 4
  local halfOpen = open / 2
  love.graphics.setColor(1, 1, 0, 1)
  if player.animationState == 0 then
  love.graphics.circle("fill", player.body:getX(), player.body:getY(), player.drawSize / 2)
  elseif player.animationState == 1 or player.animationState == 3 then
    love.graphics.arc("fill", "pie", player.body:getX(), player.body:getY(), player.drawSize / 2, facing + halfOpen, 2* math.pi + facing - halfOpen)
  elseif player.animationState == 2 then
   love.graphics.arc("fill", "pie", player.body:getX(), player.body:getY(), player.drawSize / 2, facing + open, 2* math.pi + facing - open)
 end
end
--
-- function beginContact(a, b, coll)
--   player.grounded = true
-- end
--
-- function endContact(a, b, coll)
--   local x, y = player.body:getLinearVelocity()
--   player.grounded = false
-- end
