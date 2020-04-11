-----------------------------------------------------------------------------------------
--
-- main.lua
-- Title: mathquiz
-- Name: Titwech
-- Course: ICS2O/3C
-- This program displays on the screen that have to be answerd correctly.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
local backgroundImage = display.newImageRect("Images/math.jpg", 1024, 768)

backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- create local variables
local questionObject 
local correctObject 
local numericField 
local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local randomNumber5
local randomNumber6
local randomNumber7
local userAnswer
local correctAnswer = 1
local correctAnswer1
local inCorrectAnswer 
local numberCorrect = 0
local lives = 3
local wrongAnswers
local wrongAnswersText 
local youWin
local youLose 
local myText
local randomOperator
-- for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local heart1 
local heart2
local heart3
local incorrectObject
local numberCorrectObject
local confetti

-----------------------------------------------------------------------------------------
-- gLOBAl VARIABLE
-----------------------------------------------------------------------------------------
scrollSpeed =4
-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------
local correctSound = audio.loadSound( "Sounds/correctSound.mp3") 
local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3") 
local youLoseSound = audio.loadSound( "Sounds/youLose.mp3") 
local youWinSound = audio.loadSound( "Sounds/youWin.mp3") 
local correctSoundChannel
local wrongSoundChannel
local youLoseChannel
local youWinChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(1, 20)
    randomNumber2 = math.random(1, 20)
    randomNumber3 = math.random(1, 10)
    randomNumber4 = math.random(1, 10)
    randomNumber5 = math.random(1, 100)
    randomNumber6 = math.random(1, 100)



	correctAnswer = randomNumber1 + randomNumber2

	--create questionin text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- generate a random number bettween 1 and 2
	randomOperator = math.random (1,5)

	-- if the random operator is 1, then so addition
	if	( randomOperator == 1 ) then

		--calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create  question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, random operator is  2 , do sub.
	elseif(randomOperator == 2 ) then 
	
		--calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2
		if( correctAnswer < 0) then 
			correctAnswer = randomNumber2 - randomNumber1
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
		else
			-- create a question in text object 
			questionObject.text =  randomNumber1 .. " - " ..  randomNumber2 .. "="
		end

	-- otherwise, random operator is  3, then do.
	elseif(randomOperator == 3 ) then 
		--calculate the correct answer
		correctAnswer = randomNumber3 * randomNumber4
		
		--create question in text object
		questionObject.text = randomNumber3 .. " x " .. randomNumber4 .. " = "

	-- otherwise if random operator is 4 divied.
	elseif(randomOperator == 4 ) then 
		--calculate the correct answer
		correctAnswer1 = randomNumber5 * randomNumber6
		correctAnswer = correctAnswer1/randomNumber5
		
		--create question in text object
        questionObject.text = correctAnswer1.. " ÷ " .. randomNumber5 .. " = "
        
    elseif(randomOperator == 5) then
        -- calucate the correct answer
        correctAnswer1 =  randomNumber3 * randomNumber3
        correctAnswer = correctAnswer1 / randomNumber3

        --creste question
        questionObject.text =  "√ " .. correctAnswer1 .. " = "

	end


end 

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end 

local function HideinCorrect()
	inCorrectAnswer.isVisible = false
	AskQuestion()
end

local function MoveConfetti(event)
    -- adds the scorll speed to the x value of the heart
    confetti.y = confetti.y + scrollSpeed
    -- change the transparency of the heart
    confetti.alpha = confetti.alpha + 0.05
end


local function NumericFieldListener(event)
	
	-- user begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear the text Field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted ( enter key is pressed) set user input to users answer 
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			secondsLeft = totalSeconds
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect)
			if(numberCorrect == 4) then
                stopTimer()
                --moving confetti
                Runtime:addEventListener("enterFrame", MoveConfetti)
                youWin.isVisible = true
                youWinChannel= audio.play(youWinSound)
				inCorrectAnswer.isVisible = false
				correctObject.isVisible = false 
				questionObject.isVisible = false
				numericField.inputtype = false
				numberCorrectText.isVisible = false
				
			end
			--give a point if user gets the correct answer
			numberCorrect = numberCorrect + 1

			-- update it in the display object
			numberCorrectText.text = "Number Correct = " .. numberCorrect
		else
			if(lives == 0) then
                stopTimer()
                heart3.isVisible = false
                youLose.isVisible = true
                youLoseChannel= audio.play(youLoseSound)
				inCorrectAnswer.isVisible = false
				correctObject.isVisible = false 
				questionObject.isVisible = false
				numericField.inputtype = false
				numberCorrectText.isVisible = false
			else
				--give a point if user gets the correct answer
                lives = lives - 1
                inCorrectAnswer.text = "Incorrect, the correct answer is "..correctAnswer
				inCorrectAnswer.isVisible = true
				secondsLeft = totalSeconds
				wrongSoundChannel = audio.play(wrongSound)
				timer.performWithDelay(1000, HideinCorrect)
			
			if (lives == 2) then
				heart1.isVisible = false
			elseif(lives == 1) then 
				heart2.isVisible = false
			elseif (lives == 0 ) then
				heart3.isVisible = false
			end

			end	
		

		end
		event.target.text = ""
		

	end		

end 
local function updateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
        -- reset the number of seconds left
        wrongSoundChannel = audio.play(wrongSound)
        inCorrectAnswer.text = "Incorrect, the correct answer is "..correctAnswer
        inCorrectAnswer.isVisible = true
        timer.performWithDelay(1000, HideInCorrect)
		secondsLeft = totalSeconds
        lives = lives - 1
    
		if(lives == 0) then
            stopTimer()
            heart3.isVisible = false
			youloseChannel = audio.play(youLoseSound)
			youLose.isVisible = true
			inCorrectAnswer.isVisible = false
			correctObject.isVisible = false 
			questionObject.isVisible = false
			numericField.inputtype = false
			numberCorrectText.isVisible = false
		end
	
		if (lives == 2) then
			heart1.isVisible = false
		elseif(lives == 1) then 
			heart2.isVisible = false
		elseif (lives == 0) then
			heart3.isVisible = false
		end
		AskQuestion()


	end
end


-- function taht calls the timer
local function StartTimer()
	-- create s countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay ( 1000, updateTime, 0)
end

function stopTimer ()
	timer.cancel(countDownTimer)
end
-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- create clocktext
clockText = display.newText("".. secondsLeft,100, 100, nil, 65 )
clockText:setTextColor(252/255, 0/255, 0/2555)
clockText.x = 190
clockText.y = 100

-- displays a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3.2, display.contentHeight/2.5, nil, 60 )
questionObject:setTextColor(102/255, 204/255, 0/255)

-- create the correct text object and make it invisible 
correctObject = display.newText("Correct", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(25/255, 51/255, 0/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
inCorrectAnswer = display.newText("Incorrect, the correct answer is " .. correctAnswer , display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
inCorrectAnswer:setTextColor(252/255, 0/255, 0/255)
inCorrectAnswer.isVisible = false


-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2.5, 150, 90 )
numericField.inputType = "number"

-- displays you win
youWin = display.newImageRect("Images/youWin.png", 500, 350)
youWin.x = display.contentWidth/2
youWin.y = display.contentHeight*3/4
youWin.isVisible = false

-- displays you win
youLose = display.newImageRect("Images/youLose.png", 500, 350)
youLose.x =  display.contentWidth/2
youLose.y = display.contentHeight*3/4
youLose.isVisible = false

-- display the amount the numberCorrect as a text object
numberCorrectText = display.newText("Number Correct = " .. numberCorrect, display.contentWidth/2, display.contentHeight/3.7, nil,  65)
numberCorrectText:setTextColor(255/255, 153/255, 51/255)

-- crete the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png" , 100, 100)
heart1.x = display.contentWidth  * 7/8
heart1.y = display.contentHeight * 1/7

heart2 = display.newImageRect("Images/heart.png" , 100, 100)
heart2.x = display.contentWidth  * 6/8
heart2.y = display.contentHeight * 1/7

heart3 = display.newImageRect("Images/heart.png" , 100, 100)
heart3.x = display.contentWidth  * 5/8
heart3.y = display.contentHeight * 1/7

countDownTimer = display.newText("5" , 100, 100)
countDownTimer = display.contentWidth  * 4/8
countDownTimer = display.contentHeight * 1/7

-- crete the lives to display on the screen
confetti = display.newImageRect("Images/confetti.png" , 1200, 1000)
confetti.x =600
confetti.y =500
confetti.alpha = 0

--add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

--call the function to ask the question 
AskQuestion()
StartTimer()
