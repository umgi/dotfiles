package.path = "./?/?.lua;" .. package.path
local svglover = require("svglover")
local closeIcon
function love.load()
	closeIcon = svglover.load("close.svg")
	svglover.display(closeIcon, 10, 10, 10, 10, false, { 1, 1, 1, 1 }, 0, 1)
end

function love.draw()
	love.graphics.print("Hello World!", 400, 300)
	love.graphics.setColor(215 / 255, 0, 34 / 255, 1)
	love.graphics.circle("fill", 15, 15, 15)
	love.graphics.setColor(1, 1, 1, 1)
	svglover.draw()
end
