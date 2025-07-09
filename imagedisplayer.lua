-- Display your terminal on an advanced monitor
-- The GPU is on the right of the computer
-- Place this code into your startup.lua file
local gpuID = "right"
local monID = "monitor_0"
local gpu = peripheral.wrap(gpuID)
gpu.setResolution(80, 25) -- Set the resolution for the GPU
gpu.setBackground(0x000000) -- Set the background color
gpu.setForeground(0xFFFFFF) -- Set the foreground color
shell.run("monitor "..monID.." clear")
shell.run("monitor "..monID.." multishell")
