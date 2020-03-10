-----------------------------------------------------------------------------------------
--
-- main.lua
-- Title: Animating Images
-- Name: Titwech
-- Course: ICS2O/3C
-- This program displays objects on the screen that move around.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.hiddenStatusBar)

-- set variables
local backgroundImage = display.newImageRect("Images/oceanclipart.jpg", 1024, 768)
local scubadiverBoy = display.newImageRect("Images/scubaDiver.png", 200, 200)
local scubadiverBoyWidth = scubadiverBoy.width
local scubadiverBoyHeight = scubadiverBoy.height

local scubadiverGirl = display.newImageRect("Images/scubaDiver2.png", 150, 150)
local scubadiverGirlWidth = scubadiverGirl.width
local scubadiverGirlHeight = scubadiverGirl.height

local shark = display.newImageRect("Images/Shark.png", 250, 250)
local sharkWidth = shark.width
local sharkHeight = shark.height

-- set the backgroundImage
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2

-- set the 
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2

-- set the initial x and y position of myImage
scubadiverGirl.x = 400
scubadiverGirl.y = 500

scubadiverBoy.x = 700
scubadiverBoy.y = 600
scubadiverBoy:scale(-1,1) 

shark.x = 0
shark.y = 0
shark:scale(-1,1)

-- set the image to be transparent
scubadiverGirl.alpha = 0

--global variables
scrollSpeed = 3

-- set the initial x and y position of scubadiverGirl
scubadiverGirl.x = 0
scubadiverGirl.y = display.contentHeight/3

-- Function: movescubadiverGirl
-- Input: this function accepts an event listener
-- Output: none 
-- Description: This function adds the scroll speed to the x-value of the scubadiverGirl
local function  MovescubadiverGirl(event)
	-- add the scroll speed to the x-value of the scubadiverGirl
	scubadiverGirl.x = scubadiverGirl.x + scrollSpeed
	-- change the transparency of the scubadiverGirl every time it moves so the it fades out
	scubadiverGirl.alpha = scubadiverGirl.alpha + 0.01
end

-- MovescubadiverBoy will be called over and over again
Runtime: addEventListener("enterFrame", MovescubadiverGirl)

--local variables
scrollSpeed = 4

-- set the initial x and y position of scubadiverBoy
scubadiverBoy.x = 1024
scubadiverBoy.y = display.contentHeight/1.5

-- Function: movescubadiverBoy
-- Input: this function accepts an event listener
-- Output: none 
-- Description: This function adds the scroll speed to the x-value of the scubadiverBoy
local function  movescubadiverBoy(event)
	-- add the scroll speed to the x-value of the scubadiverboy
	scubadiverBoy.x = scubadiverBoy.x - scrollSpeed
	-- change the transparency of the scubadiverboy every time it moves so the it fades out
	scubadiverBoy.alpha = scubadiverBoy.alpha + 0.01
	
end

-- MovescubadiverBoy will be called over and over again
Runtime: addEventListener("enterFrame", movescubadiverBoy)

-- set the image to be transparent
shark.alpha = 0

--local variables
local scrollSpeed = 1.5

-- set the initial x and y position of scubadiverBoy
scubadiverBoy.x = 1024
scubadiverBoy.y = display.contentHeight/1.5

-- Function: moveShark
-- Input: this function accepts an event listener
-- Output: none 
-- Description: This function adds the scroll speed to the x-value of the shark
local function  moveShark(event)
	-- add the scroll speed to the x-value of the Shark
	shark.x = shark.x + scrollSpeed
	shark.y = shark.y + scrollSpeed
	-- change the transparency of the scubadiverboy every time it moves so the it fades out
	shark.alpha = shark.alpha + 0.1

	timer.performWithDelay(3000, HideCorrect)

end

-- MoveShark will be called over and over again
Runtime: addEventListener("enterFrame", moveShark)
