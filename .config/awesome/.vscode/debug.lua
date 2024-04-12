require("lldebugger").start()
require("sh")

print(package.path) -- where .lua files are searched for
print(package.cpath) -- where native modules are searched for

print(...)
print(arg[1], arg[2])

local workingDir = tostring(pwd())
print(workingDir)

-- SOURCE=${BASH_SOURCE[0]}
-- LOC=$(dirname $(realpath $SOURCE))
-- CONFIG=$LOC/rc.lua

-- sleep 1.5
print(package.path)

print("Xephyr", "-br", "-ac", "-noreset", "-screen", "1920x1080", ":1")
startCommand("Xephyr", "-br", "-ac", "-noreset", "-screen", "1920x1080", ":1")

-- print(xset("q"))

print("DISPLAY=" .. os.getenv("DISPLAY"))
print("sh", "-c", "DISPLAY=:1; awesome -c " .. tostring(workingDir) .. "/rc.lua")
command("sh", "-c", "DISPLAY=:1; awesome -c " .. tostring(workingDir) .. "/rc.lua")
print("End of file")

-- XEPHYR_PID=$!
-- DISPLAY=:1

-- echo "Waiting for X Display - $DISPLAY to go live..."
-- while ! xset
