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

    -- Read the image data
    local imageData = response.readAll()
    response.close()

    -- Save the image to a file
    local file = fs.open("image.png", "w")
    file.write(imageData)
    file.close()

    -- Load the image from the file and display it
    local img = paintutils.loadImage("image.png")
    paintutils.drawImage(img, 1, 1)
end

-- Check if the monitor is available
local monitor = peripheral.find("monitor")
if monitor then
    -- Set the monitor to be the active term
    term.redirect(monitor)

    -- Clear the monitor
    term.clear()
    term.setCursorPos(1, 1)

    -- Display the image
    displayImage(imageUrl)
else
    print("No monitor found.")
end
