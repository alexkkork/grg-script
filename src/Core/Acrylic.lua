local Acrylic = {}
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- Constants
local CAMERA_FOV = 70
local PART_SIZE = 0.01

function Acrylic:Enable()
    -- Check if already enabled or if Graphic Quality is too low
    -- For this implementation, we'll assume high enough quality or fallback
end

function Acrylic:CreateAcrylic()
    local Effect = {}
    
    function Effect:Enable(frame, transparency)
        if not frame then return end
        transparency = transparency or 0.98
        
        -- Create the core acrylic container
        local acrylicFrame = Instance.new("ImageLabel")
        acrylicFrame.Name = "AcrylicFrame"
        acrylicFrame.BackgroundTransparency = 1
        acrylicFrame.Size = UDim2.new(1, 0, 1, 0)
        acrylicFrame.Image = "rbxassetid://0" -- Placeholder or noise texture
        acrylicFrame.ImageTransparency = 0.5
        acrylicFrame.Parent = frame
        
        -- NOTE: A true Glassmorphism effect in Roblox requires a complex ViewportFrame setup 
        -- that mirrors the workspace. For reliability and performance in a UI Library,
        -- we will use a high-quality semi-transparent backdrop with a global blur 
        -- trigger or simply a really nice dark frosted look.
        
        -- If we want "Real" blur behind just this frame, it's very expensive. 
        -- Instead, we'll simulate it with a dark overlay and rely on the global 
        -- lighting blur if the user enables it.
        
        acrylicFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        acrylicFrame.BackgroundTransparency = 0.2
        
        -- Add a subtle noise overlay for texture
        local noise = Instance.new("ImageLabel")
        noise.Name = "Noise"
        noise.BackgroundTransparency = 1
        noise.Size = UDim2.new(1, 0, 1, 0)
        noise.Image = "rbxassetid://12975612867" -- Common noise texture
        noise.ImageTransparency = 0.95
        noise.ScaleType = Enum.ScaleType.Tile
        noise.TileSize = UDim2.new(0, 128, 0, 128)
        noise.Parent = acrylicFrame
        
        return acrylicFrame
    end
    
    return Effect
end

return Acrylic

