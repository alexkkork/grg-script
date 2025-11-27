local Acrylic = {}
local ThemeManager = require(script.Parent.ThemeManager)

function Acrylic:CreateAcrylic()
    local Effect = {}
    
    function Effect:Enable(frame, transparency)
        if not frame then return end
        transparency = transparency or 0.85
        
        -- Create the core acrylic container
        local acrylicFrame = Instance.new("Frame")
        acrylicFrame.Name = "AcrylicFrame"
        acrylicFrame.Size = UDim2.new(1, 0, 1, 0)
        acrylicFrame.BackgroundColor3 = ThemeManager.Theme.Background
        acrylicFrame.BackgroundTransparency = transparency
        acrylicFrame.BorderSizePixel = 0
        acrylicFrame.ZIndex = 0
        acrylicFrame.Parent = frame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = acrylicFrame
        
        -- Add a subtle noise overlay for texture
        local noise = Instance.new("ImageLabel")
        noise.Name = "Noise"
        noise.BackgroundTransparency = 1
        noise.Size = UDim2.new(1, 0, 1, 0)
        noise.Image = "rbxassetid://12975612867" -- Common noise texture
        noise.ImageTransparency = 0.97
        noise.ScaleType = Enum.ScaleType.Tile
        noise.TileSize = UDim2.new(0, 128, 0, 128)
        noise.ZIndex = 1
        noise.Parent = acrylicFrame
        
        local noiseCorner = Instance.new("UICorner")
        noiseCorner.CornerRadius = UDim.new(0, 10)
        noiseCorner.Parent = noise
        
        -- Listen for theme updates
        ThemeManager.ThemeUpdate.Event:Connect(function()
            acrylicFrame.BackgroundColor3 = ThemeManager.Theme.Background
        end)
        
        return acrylicFrame
    end
    
    return Effect
end

return Acrylic

