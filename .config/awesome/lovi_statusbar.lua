local gears = require("gears")
local wibox = require("wibox")
local barheight = 30
local detectheight = barheight * 2.5

function setup(s)
	return nil

	--TODO: fix click disabled
	-- s.detect = gears.timer({
	-- 	timeout = 0.35,
	-- 	callback = function()
	-- 		if (mouse.screen ~= s) or (mouse.coords().y < s.geometry.y + s.geometry.height - 30) then
	-- 			s.mywibox.visible = false
	-- 			s.detect:stop()
	-- 		end
	-- 	end,
	-- })
	--
	-- s.enable_wibar = function()
	-- 	s.mywibox.visible = true
	-- 	if not s.detect.started then
	-- 		s.detect:start()
	-- 	end
	-- end
	--
	-- s.activation_zone = wibox({
	-- 	x = s.geometry.x,
	-- 	y = s.geometry.y + s.geometry.height - detectheight,
	-- 	opacity = 0.0,
	-- 	width = s.geometry.width,
	-- 	height = detectheight,
	-- 	screen = s,
	-- 	input_passthrough = false,
	-- 	visible = true,
	-- 	ontop = true,
	-- 	type = "dock",
	-- })
	--
	-- s.activation_zone:connect_signal("mouse::enter", function()
	-- 	s.enable_wibar()
	-- end)
end

return {
	setup = setup,
}
