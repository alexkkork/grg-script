local Tooltips = {}
local UserInputService = game:GetService("UserInputService")
local Utility = require(script.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)

local tooltipFrame = nil

function Tooltips:Init(gui)
    tooltipFrame = Instance.new("Frame")
    tooltipFrame.Name = "Tooltip"
    tooltipFrame.Size = UDim2.new(0, 100, 0, 25)
    tooltipFrame.BackgroundColor3 = ThemeManager.Theme.Background
    tooltipFrame.BorderSizePixel = 0
    tooltipFrame.Visible = false
    tooltipFrame.ZIndex = 100
    tooltipFrame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = tooltipFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = tooltipFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = ThemeManager.Theme.Text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 12
    label.Parent = tooltipFrame
    
    local function update()
        if tooltipFrame.Visible then
            local mouse = UserInputService:GetMouseLocation()
            tooltipFrame.Position = UDim2.new(0, mouse.X + 15, 0, mouse.Y + 15)
        end
    end
    
    UserInputService.InputChanged:Connect(update)
end

function Tooltips:Add(instance, text)
    instance.MouseEnter:Connect(function()
        if not tooltipFrame then return end
        local label = tooltipFrame:FindFirstChild("TextLabel")
        label.Text = text
        local size = game:GetService("TextService"):GetTextSize(text, 12, ThemeManager.Theme.Font, Vector2.new(200, 100))
        tooltipFrame.Size = UDim2.new(0, size.X + 10, 0, size.Y + 6)
        tooltipFrame.Visible = true
    end)
    
    instance.MouseLeave:Connect(function()
        if tooltipFrame then
            tooltipFrame.Visible = false
        end
    end)
end

return Tooltips

