
enemies_controller = {}
enemies_controller.enemies = {}

createEnemyTimerMax = 0.4
createEnemyTimer = createEnemyTimerMax


playerImg = love.graphics.newImage('enemy.png')
playerImg3 = love.graphics.newImage('nave.png')
playerImg2 = love.graphics.newImage('bullet.png')

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end



function love.load()

	background_image = love.graphics.newImage('background.png')
	
	player = {}
	player.x = 350

	
	player.y = 510
	player.cooldown = 50
	player.bullets = {}
	player.fire = function()
		if player.cooldown <= 0 then
			player.cooldown = 50
			bullet = {}
			bullet.x = player.x + 25
			bullet.y = player.y - 17
			table.insert(player.bullets, bullet)
		end	
	end	
	

	
	
end	


	

function love.update(dt)
	player.cooldown = player.cooldown - 1
	
	if love.keyboard.isDown("right") then
		player.x = player.x + 1
	elseif love.keyboard.isDown("left")	then
		player.x = player.x - 1
	end	
	
	
	if love.keyboard.isDown("space") then
		player.fire()
	end
	
		
	for _,e in pairs(enemies_controller.enemies) do
		e.y = e.y + 0.6
	end
	

	
	--
	createEnemyTimer = createEnemyTimer - (1 * dt)
	if createEnemyTimer < 0 then
		createEnemyTimer = createEnemyTimerMax

		--TRABALHO 5
		-- Aqui os inimigos são criados (periódicamente)
		randomNumber = math.random(10, love.graphics.getWidth() - 10)
		newEnemy = { x = randomNumber, y = -10, img = enemyImg }
		table.insert(enemies_controller.enemies, newEnemy)
	end
	--
	
	for i,v in ipairs(player.bullets) do
		--TRABALHO 5
		--aqui os bullets são removidos, seu ciclo de vida vai desde sua criação até o objeto atingir este ponta da tela
		if v.y < - 10 then
			table.remove(player.bullets, i)
		end	
		v.y = v.y - 1
	end
	
		--TRABALHO 5
	--aqui os inimigos são removidos, seu ciclo de vida vai desde sua criação até o objeto atingir este ponta da tela
	for i, e in pairs (enemies_controller.enemies) do
		if e.y > - (-600) then
			table.remove(enemies_controller.enemies, i)
		end
	end	
	

	
	
	
	for i, enemy in ipairs(enemies_controller.enemies) do
		for j, bullet in ipairs(player.bullets) do
			if CheckCollision(enemy.x, enemy.y, playerImg:getWidth(), playerImg:getHeight(), bullet.x, bullet.y, playerImg2:getWidth(), playerImg2:getHeight()) then
				table.remove(player.bullets, j)
				table.remove(enemies_controller.enemies, i)
				
			end
		end
	end

		
	
end	

function love.draw()

	love.graphics.draw(background_image)
	
	love.graphics.draw(playerImg3, player.x, player.y)
	
	for _,e in pairs(enemies_controller.enemies) do
		
		love.graphics.draw(playerImg, e.x, e.y)
		
	end
	
	
	for _,v in pairs (player.bullets) do
		
		love.graphics.draw(playerImg2, v.x, v.y)
	end
	
end
