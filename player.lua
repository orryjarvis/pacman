player = {}
function initializePlayer()
  player.speed = 180
  player.x = 100
  player.y = 100
  player.animationState = 0
  player.direction = 0
  player.size = math.min(love.graphics.getWidth() / numCols, love.graphics.getHeight() / numRows) * 0.3
end

function updatePlayer(dt)
  local nextAnimationState = mod(player.animationState + 1, 4)
  if love.keyboard.isDown("w") and player.y > 0 then
    player.y = player.y - player.speed * dt
    player.animationState = nextAnimationState
    player.direction = 3
  end
  if love.keyboard.isDown("a") and player.x > 0 then
    player.x = player.x - player.speed * dt
    player.animationState = nextAnimationState
    player.direction = 2
  end
  if love.keyboard.isDown("s") and player.y < love.graphics.getHeight() then
    player.y = player.y + player.speed * dt
    player.animationState = nextAnimationState
    player.direction = 1
  end
  if love.keyboard.isDown("d") and player.x < love.graphics.getWidth() then
    player.x = player.x + player.speed * dt
    player.animationState = nextAnimationState
    player.direction = 0
  end
  player.animationState = 0
end

function mod(a, b)
  return a - math.floor(a/b)*b
end

function drawPlayer()
  love.graphics.setLineWidth(0)
  local facing = math.pi * player.direction / 2
  local open = math.pi / 4
  local halfOpen = open / 2
  love.graphics.setColor(1, 1, 0, 1)
  love.graphics.circle("fill", player.x, player.y, player.size / 2)
  love.graphics.setColor(0, 0, 0, 1)
  if player.animationState == 1 or player.animationState == 3 then
   love.graphics.arc("fill", player.x, player.y, player.size / 2, facing - halfOpen, facing + halfOpen)
  elseif player.animationState == 2 then
   love.graphics.arc("fill", player.x, player.y, player.size / 2, facing + open, facing - open)
 end
end
