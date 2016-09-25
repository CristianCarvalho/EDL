enemy = {}
enemies_controller = {}
enemies_controller.enemies = {}


playerImg = love.graphics.newImage('enemy.png')
playerImg3 = love.graphics.newImage('nave.png')
playerImg2 = love.graphics.newImage('bullet.png')


function checkCollisions(enemies, bullets)
	for i, e in pairs(enemies) do
		for _, v in pairs(bullets) do
			if v.y <= e.y + e.height and v.x > e.x and v.x < e.x + e.width then 
				table.remove(enemies, i)
			end
		end
	end	


end

function love.load()

	background_image = love.graphics.newImage('background.png')
	
	player = {}
	player.x = 350
	--nome: player.x
	--Propriedade: endereço
	-- Binding time: tempo de compilação
	-- player.x já recebe um valor em sua inicialização e isso ocorre em tempo de compilação
	
	player.y = 550
	player.cooldown = 50
	player.bullets = {}
	player.fire = function()
		if player.cooldown <= 0 then
			player.cooldown = 50
			bullet = {}
			bullet.x = player.x - 15
			bullet.y = player.y - 80
			table.insert(player.bullets, bullet)
		end	
	end	
	
	for i=0, 8 do
		enemies_controller:spawnEnemy(i * 100, 0)
	end
	-- nome: variável "i"
	--Propriedade: endereço
	-- Binding time: tempo de execução
	-- i é uma variável local existentente dentro do for e seu endereço é determinado em tempo de execução
end
-- RECADO PARA O PROFESSOR: NÃO CONSIGO VER UM EXEMPLO DIFERENTE NESTE CÓDIGO PARA OS PRÓXIMOS EXEMPLOS
function enemies_controller:spawnEnemy(x, y)
	enemy = {}
	enemy.x = x
	enemy.y = y
	enemy.width = 80
	enemy.height = 80
	enemy.bullets = {}
	enemy.cooldown = 50
	table.insert(self.enemies, enemy)
end

function enemy:fire()
	if self.cooldown <= 0 then
	self.cooldown = 50
	bullet = {}
	bullet.x = self.x + 45
	bullet.y = self.y
	table.insert(self.bullets, bullet)
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
	
	
	for i,v in ipairs(player.bullets) do
		if v.y < -10 then
			table.remove(player.bullets, i)
		end	
		v.y = v.y - 1
	end	
	
	checkCollisions(enemies_controller.enemies, player.bullets)
	
end	

function love.draw()

	love.graphics.draw(background_image)
	
	love.graphics.draw(playerImg3, player.x, player.y, 0, 0.1)
	
	for _,e in pairs(enemies_controller.enemies) do
		
		love.graphics.draw(playerImg, e.x, e.y, 0, 0.1)
		
	end
	
	
	for _,v in pairs (player.bullets) do
		
		love.graphics.draw(playerImg2, v.x, v.y, 0, 0.1)
	end
	
end

