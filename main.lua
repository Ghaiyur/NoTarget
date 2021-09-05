--[[
    A Duck hunt like clone game on love2d

    Dev Log
    - [x] Load
    - [x] Update
    - [x] Draw
    - [x] Drawing Shape
        - [x] Rectangle (mode,x,y,width.height) example:love.graphics.rectangle("fill",100,300,200,200)
        - [x] Circle (mode,x,y,radius) example : love.graphics.circle("fill",100,,50)
    - [x] Colour and Overlaps
        - [x] Color example:love.graphics.setColor(r,g,b)
    - [x] Target Table and Global Var
        - [x] Target Attributes in love.load
        - [x] Score and timer
    - [x] Mouse input
        - [x] Increase score when clicked use mousepressed
    - [x] Shooting the target
        - [x] Figure it out if mouse in the circle
        - [x] Subtract if missed target
    - [x] Move around target randomly 
        - [x] math.random and love.graphics.getWidth and getHeight
    - [x] Timer
        - [x] Update action
        - [x] make sure timer does not go below zero and stop at 0
    - [x] Sprites
        - [x] Get the images
        - [x] Put them in load
        - [x] love.mouse.getX has follow props
        - [x] it also has love.mouse.setVisible
        - [x] Added target sprite to over lap target gen
    - [x] Main Menu
        - [x] add game state
        - [x] game state
    # The game start at game state 1, when the mouse is pressed and the game state set 1 is it switches to 2 and when time reaches zero it switches to game state 1 and score = 0 so two states trigger
    - [x] Finishing touches
        - [x] Center text to recommend to click
--]]

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