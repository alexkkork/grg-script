local Watermark = {}
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)
local Utility = require(script.Parent.Parent.Core.Utility)
local SaveManager = require(script.Parent.Parent.Core.SaveManager)

local watermarkFrame = nil

local function toUDim2(value)
    if typeof(value) == "UDim2" then
        return value
    end
    if typeof(value) == "table" and value.X and value.Y then
        return UDim2.new(
            value.X.Scale or 0,
            value.X.Offset or 0,
            value.Y.Scale or 0,
            value.Y.Offset or 0
        )
    end
    return nil
end

function Watermark:Init(gui)
    watermarkFrame = Instance.new("Frame")
    watermarkFrame.Name = "Watermark"
    watermarkFrame.Size = UDim2.new(0, 200, 0, 30)
    watermarkFrame.Position = UDim2.new(1, -210, 0, 10)
    watermarkFrame.BackgroundColor3 = ThemeManager.Theme.Background
    watermarkFrame.BorderSizePixel = 0
    watermarkFrame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = watermarkFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = watermarkFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = ThemeManager.Theme.Text
    label.Font = ThemeManager.Theme.FontBold
    label.TextSize = 14
    label.Parent = watermarkFrame
    
    -- Add gradient to stroke
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ThemeManager.Theme.Accent),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 150, 150))
    })
    gradient.Rotation = 45
    gradient.Parent = stroke
    
    Utility:AddShadow(watermarkFrame, 20)
    
    -- Draggable
    local dragInfo = Instance.new("Frame")
    dragInfo.Size = UDim2.new(1,0,1,0)
    dragInfo.BackgroundTransparency = 1
    dragInfo.Parent = watermarkFrame
    Utility:EnableDragging(watermarkFrame, dragInfo)
    
    -- Restore Position
    local layout = SaveManager:LoadLayout("PremiumHub")
    if layout and layout.Watermark then
        local pos = toUDim2(layout.Watermark)
        if pos then
            watermarkFrame.Position = pos
        end
    end
    
    -- Update Stats
    RunService.Heartbeat:Connect(function()
        local fps = math.floor(1 / RunService.Heartbeat:Wait())
        local ping = 0
        pcall(function()
             ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        label.Text = string.format("FPS: %d  |  Ping: %d ms", fps, ping)
    end)
end

function Watermark:GetPosition()
    if watermarkFrame then return watermarkFrame.Position end
    return nil
end

function Watermark:SetPosition(pos)
    if watermarkFrame and typeof(pos) == "UDim2" then
        watermarkFrame.Position = pos
    end
end

return Watermark
