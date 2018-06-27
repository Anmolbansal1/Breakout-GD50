--[[

    Represents the state the game is in when we've just started; should
    simply display "Breakout" in large text, as well as a message to press
    Enter to begin.
 ]]


-- the "__includes" bit here means we're going to inherit all of the methods
-- that BaseState has, so it will have empty versions of all StateMachine methods
-- even if we don't override them ourselves; handy to avoid superfluous code!
 StartState = Class{__includes = BaseState}

local highlighted = 1

function StartState:update(dt)
	if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
		highlighted = highlighted == 1 and 2 or 1
		gSounds['paddle-hit']:play()
	end

	if love.keyboard.wasPressed('escape') then
		love.event.quit()
	end
end


function StartState:render()
	-- title
	love.graphics.setFont(gFonts['large'])
	love.graphics.printf("BREAKOUT", 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')


	-- instructions
	love.graphics.setFont(gFonts['medium'])

	if highlighted == 1 then
		love.graphics.setColor(103/255, 255/255, 255/255, 255/255)
	end

	love.graphics.printf("START", 0, VIRTUAL_HEIGHT / 2 + 70, VIRTUAL_WIDTH, 'center')

	love.graphics.setColor(1, 1, 1, 1)

	if highlighted == 2 then
		love.graphics.setColor(103/255, 1, 1, 1)
	end

	love.graphics.printf("HIGH SCORES", 0, VIRTUAL_HEIGHT / 2 + 90, VIRTUAL_WIDTH, 'center')

	-- reset the color
	love.graphics.setColor(1, 1, 1, 1)

end