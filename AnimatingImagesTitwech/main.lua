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
local scubadiverblue = display.newImageRect("Images/scubaDiver.png", 250, 250)
local scubadiverblueWidth = scubadiverblue.width
local scubadiverblueHeight = scubadiverblue.height

local scubadiverblack = display.newImageRect("Images/scubaDiver2.png", 140, 140)
local scubadiverblackWidth = scubadiverblack.width
local scubadiverblackHeight = scubadiverblack.height

-- set the backgroundImage
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2

-- set the initial x and y position of myImage
scubadiverblack.x = 400
scubadiverblack.y = 500

scubadiverblue.x = 300
scubadiverblue.y = 200