require("sh")

for scale = 1, 3, 1 do
	local iconSize = 16 * scale
	local output = "awesome-icon@x" .. tostring(scale) .. ".png"
	local resize = tostring(iconSize) .. "x" .. tostring(iconSize)
	print(resize)

	local marginVer = 7
	local marginHor = 10
	local imageWidth = iconSize + 2 * marginHor * scale
	local imageHeight = iconSize + 2 * marginVer * scale
	local extent = tostring(imageWidth) .. "x" .. tostring(imageHeight)
	print(extent)

	convert(
		"-background",
		"transparent",
		"-density",
		"500",
		"-resize",
		resize,
		"-gravity",
		"center",
		"-extent",
		extent,
		"icons8-arch-linux-24.svg",
		output
	)

	print("render_icons.lua: " .. "done: " .. output)
end
