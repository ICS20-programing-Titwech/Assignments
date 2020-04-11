-----------------------------------------------------------------------------------------
--
-- main.lua
-- Title: Animating Images
-- Name: Titwech
-- Course: ICS2O/3C
-- This program displays objects on the screen that move around.
-----------------------------------------------------------------------------------------

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- correct sound 
local correctSound = audio.loadSound( "Sounds/underWater.mp3")
local correctSoundChannel
correctSoundChannel = audio.play(correctSound)

-- set variables
local backgroundImage = display.newImageRect("Images/oceanclipart.jpg", 1024, 768)
local scubadiverBoy = display.newImageRect("Images/scubaDiver.png", 200, 200)
local scubadiverBoyWidth = scubadiverBoy.width
local scubadiverBoyHeight = scubadiverBoy.height

local scubadiverGirl = display.newImageRect("Images/scubaDiver2.png", 70, 70)
local scubadiverGirlWidth = scubadiverGirl.width
local scubadiverGirlHeight = scubadiverGirl.height

local shark = display.newImageRect("Images/Shark.png", 180, 180)
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
	-- grow
	scubadiverGirl.xScale = scubadiverGirl.xScale + 0.01
	scubadiverGirl.yScale = scubadiverGirl.yScale + 0.01

end

-- MovescubadiverBoy will be called over and over again
Runtime: addEventListener("enterFrame", MovescubadiverGirl)


-- set the image to be transparent
scubadiverBoy.alpha = 0


-- set the initial x and y position of scubadiverBoy
scubadiverBoy.x = 1024
scubadiverBoy.y = display.contentHeight/1.5

-- Function: movescubadiverBoy
-- Input: this function accepts an event listener
-- Output: none 
-- Description: This function adds the scroll speed to the x-value of the scubadiverBoy
local function  movescubadiverBoy(event)
	-- add the scroll speed to the x-value of the scubadiverBoy
	scubadiverBoy.x = scubadiverBoy.x - scrollSpeed
	-- change the transparency of the scubadiverBoy every time it moves so the it fades out
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
	-- change the transparency of the scubadiverboy every time it moves so the it fades in
	shark.alpha = shark.alpha + 0.1

end
local function  rotateShark(event)
	--
	shark:rotate(4)
end

-- rotateShark will be called over and over again
Runtime: addEventListener("enterFrame", rotateShark)

-- MoveShark will be called over and over again
Runtime: addEventListener("enterFrame", moveShark)

-- display text on the screen with colour
local text = display.newText( "A SHARK!", 250, 400, native.systemFont, 45)
text:setFillColor( 162/255, 203/255, 255/255 )


--local variables
local scrollSpeed = 3

-- set the initial x and y position of text
text.x = 1024
text.y = display.contentHeight/2

-- Function: movetext
-- Input: this function accepts an event listener
-- Output: none 
-- Description: This function adds the scroll speed to the x-value of the text
local function  moveText(event)
	-- add the scroll speed to the x-value of the text
	text.x = text.x - scrollSpeed
	-- change the transparency of the scubadiverBoy every time it moves so the it fades out
	text.alpha = text.alpha + 0.01
	
end
-- movetext will be called over and over again
Runtime: addEventListener("enterFrame", moveText)