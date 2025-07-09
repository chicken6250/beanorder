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

-- Get the GPU peripheral
local gpu = peripheral.find("gpu")
if gpu then
    -- Set the resolution of the monitor
    gpu.setResolution(51, 19) -- Adjust based on your monitor's resolution

    -- Clear the screen
    gpu.fill(1, 1, 51, 19, " ")

    -- Display the image
    displayImage(imageUrl)
else
    print("No GPU found.")
end
