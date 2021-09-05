--[[
    No Target
    Author : Ghaiyur
]]
function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 0
    gameState = 1

    gameFont = love.graphics.newFont(40)

    sprites = {}
    sprites.sky = love.graphics.newImage('sprites/sky.png')
    sprites.target = love.graphics.newImage('sprites/target.png')
    sprites.crosshairs = love.graphics.newImage('sprites/crosshairs.png')

    -- Get rid of cursor visibility
    love.mouse.setVisible(false)
end

function love.update(dt)
    if timer > 0 then
        timer = timer - dt
    end
    if timer < 0 then
        timer = 0
        gameState = 1
    end
end

function love.draw()

    -- Background
    love.graphics.draw(sprites.sky,0,0)

    -- target gen
    -- love.graphics.setColor(1,0.63,0)
    -- love.graphics.circle("fill",target.x,target.y,target.radius)
 
    -- Score
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.print('Score: '..score,5,5)

    -- Timer
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.print('Time: '.. math.ceil(timer),350,5)

    -- Main menu Text
    if gameState ==1 then
        love.graphics.printf('Click anywhere to begin!',0,250,love.graphics.getWidth(),'center')
    end

    -- Only show the target if the gamestate is at 2 or else no targets
    if gameState == 2 then
        -- Get the target sprite on top the circle 
        love.graphics.draw(sprites.target,target.x-target.radius,target.y-target.radius)
    end
    -- Get cross hairs on screen and make it follow mouse
    love.graphics.draw(sprites.crosshairs,love.mouse.getX()-20,love.mouse.getY()-20)
end

-- Function that find if the mouse is pressed or not and also has the coords for the mouse
function love.mousepressed(x,y,button,istouch,presses)
    if button == 1 and gameState == 2 then
        local mouseToTarget = distanceBetween(x,y,target.x,target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            -- To make sure the target does not go off the screen
            target.x = math.random(target.radius,love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius,love.graphics.getHeight() - target.radius)
        else
            score = score - 1
        end
    elseif button == 1 and gameState == 1 then
        gameState = 2
        timer = 10
        score = 0
    end
end

function distanceBetween(x1,y1,x2,y2)
    return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end