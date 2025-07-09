-- Load the required libraries
local http = require("http")
local term = require("term")
local peripheral = require("peripheral")
local image = require("image")

-- URL of the image
local imageUrl = "https://raw.githubusercontent.com/chicken6250/beanorder/refs/heads/main/Screenshot%20from%202025-07-08%2023-59-29.png"

-- Function to download and display the image
local function displayImage(url)
    -- Download the image
    local response = http.get(url)
    if not response then
        print("Failed to download image.")
        return
    end

    -- Save the image data
    local imageData = response.readAll()
    response.close()

    -- Load the image into the monitor
    local img = image.load(imageData)
    if img then
        -- Clear the monitor
        term.clear()
        term.setCursorPos(1, 1)

        -- Display the image
        image.draw(img, 1, 1)
    else
        print("Failed to load image.")
    end
end

-- Get the monitor peripheral
local monitor = peripheral.find("monitor")
if monitor then
    -- Set the monitor to be the active term
    term.redirect(monitor)

    -- Display the image
    displayImage(imageUrl)
else
    print("No monitor found.")
end

