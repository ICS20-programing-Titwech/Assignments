-----------------------------------------------------------------------------------------
--
-- main.lua
--Title: HelloWorld
-- Name: Titwech
-- Course: ICS2O/3C
-- This program displays shapes on the screen.
--
-----------------------------------------------------------------------------------------
-- set all the variables for the triangle
local verticesTriangle = {0, 130, 130, -130, -130, 130}
local triangle = display.newPolygon(display.contentWidth/4, display.contentHeight/4, verticesTriangle)

-- set the background colour of my screen.Remember that colours are between 0 and 1.
display.setDefault( "background", 243/255, 191/255, 19/255)
 
-- set the colour of the triangle
local paint = {
    type = "gradient",
    color1 = { 255/255, 96/255, 4/255 },
    color2 = { 255/255, 255/255, 255/255 },
    directions = "up"
}
triangle.fill = paint

-- set the width of the border for the triangle
triangle.strokeWidth = 10

--set the triangle at the top right coner of the screen
triangle.anchorX = 0
triangle.anchorY = 0 
triangle.x = 670
triangle.y = 40

-- display text under the Triangle
local myText = display.newText( "Triangle", 800, 400, native.systemFont, 45)

-- set all the variables for the pentagon 
local verticesPentagon = {0, 240, 140, 140, 40, -40, -40, -40, -140, 140}
local Pentagon  = display.newPolygon(display.contentWidth/4, display.contentHeight/4, verticesPentagon)

-- flip the pentagon
Pentagon:scale ( 1, -1)

-- set the colour of the pentagon 
local paint = {
    type = "gradient",
    color1 = { 201/255, 247/255, 131/255 },
    color2 = { 255/255, 255/255, 255/255 },
    directions = "up"
}
Pentagon.fill = paint

-- set the width of the border for the pentagon 
Pentagon.strokeWidth = 10

-- display text under the pentagon 
local myText = display.newText( "Pentagon", 250, 400, native.systemFont, 45)

-- set all the variables for the trapezoid
local verticesTrapezoid = {-40, 60, 40, 60, 100, -60, -100, -60}
local Trapezoid = display.newPolygon(display.contentWidth/4, display.contentHeight/4, verticesTrapezoid)

-- set the colour of the trapezoid
local paint = {
    type = "gradient",
    color1 = { 250/255, 0/255, 0/255 },
    color2 = { 255/255, 255/255, 255/255 },
    directions = "up"
}
Trapezoid.fill = paint

-- set the trapezoid at right bottom coner of the screen
Trapezoid.anchorX = 0
Trapezoid.anchorY = 0 
Trapezoid.x = 670
Trapezoid.y = 500

-- set the width of the border for the trapezoid
Trapezoid.strokeWidth = 10

-- display text under the trapezoid
local myText = display.newText( "trapezoid", 800, 700, native.systemFont, 45)

-- set all the variables for the parallelogram
local verticesParallelogram = { -140, 80, 60, 80, 120, -60, -80, -60}
local parallelogram = display.newPolygon(display.contentWidth/4, display.contentHeight/4, verticesParallelogram)

-- set the colour of the parallelogram
local paint = {
    type = "gradient",
    color1 = { 17/255, 0/255, 250/255 },
    color2 = { 255/255, 255/255, 255/255 },
    directions = "up",
}
parallelogram.fill = paint

-- set the parallelogam at left bottom coner of the screen
parallelogram.anchorX = 0
parallelogram.anchorY = 0 
parallelogram.x = 200
parallelogram.y = 500

-- set the width of the border for thep parallelogam
parallelogram.strokeWidth = 10

-- display text under the parallelogram
local myText = display.newText( "parallelogram", 250, 700, native.systemFont, 45)