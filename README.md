# NoTarget

![main](https://user-images.githubusercontent.com/26713317/132116462-694ed389-0a6f-4f5c-b8ca-d0939eed8333.png)
---
![ingame](https://user-images.githubusercontent.com/26713317/132116477-c1a15420-c884-489c-9a2a-571df719272d.png)

    ## Dev Log
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
