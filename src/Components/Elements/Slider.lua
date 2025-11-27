local Slider = {}
local UserInputService = game:GetService("UserInputService")
local Utility = require(script.Parent.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Parent.Core.ThemeManager)

function Slider.new(options, section)
    options = options or {}
    local text = options.Text or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.Default or min
    local callback = options.Callback or function() end
    
    local value = default
    
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "Slider"
    sliderFrame.Size = UDim2.new(1, 0, 0, 50)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = sliderFrame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, -60, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default)
    valueLabel.Font = ThemeManager.Theme.FontBold
    valueLabel.TextSize = 14
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = sliderFrame
    Utility:ThemeBind(valueLabel, "TextColor3", "Accent")
    
    local track = Instance.new("TextButton") -- Button for click input
    track.Name = "Track"
    track.Size = UDim2.new(1, -20, 0, 6)
    track.Position = UDim2.new(0, 10, 0, 30)
    track.BackgroundColor3 = ThemeManager.Theme.Outline -- Initial
    track.Text = ""
    track.AutoButtonColor = false
    track.Parent = sliderFrame
    Utility:ThemeBind(track, "BackgroundColor3", "Outline")
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = ThemeManager.Theme.Accent -- Initial
    fill.Parent = track
    Utility:ThemeBind(fill, "BackgroundColor3", "Accent")
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Color = ColorSequence.new({
         ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
         ColorSequenceKeypoint.new(1, Color3.new(0.8, 0.8, 1)) -- Slight shift
    })
    fillGradient.Parent = fill
    
    -- Glow on the handle
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new(1, 0, 0.5, 0)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = fill
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local knobShadow = Utility:AddShadow(knob, 10)
    knobShadow.ImageTransparency = 0.5
    knobShadow.ImageColor3 = ThemeManager.Theme.Accent -- Initial
    
    ThemeManager.ThemeUpdate.Event:Connect(function()
        knobShadow.ImageColor3 = ThemeManager.Theme.Accent
    end)
    
    local dragging = false
    
    local function update(input)
        local pos = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local newValue = math.floor(min + ((max - min) * pos))
        
        if newValue ~= value then
            value = newValue
            valueLabel.Text = tostring(value)
            fill.Size = UDim2.new(pos, 0, 1, 0)
            callback(value)
        end
    end
    
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
            Utility:Tween(knob, TweenInfo.new(0.1), {Size = UDim2.new(0, 18, 0, 18)})
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            Utility:Tween(knob, TweenInfo.new(0.1), {Size = UDim2.new(0, 14, 0, 14)})
        end
    end)
    
    return {
        Frame = sliderFrame,
        SetValue = function(_, newValue)
            newValue = math.clamp(newValue, min, max)
            value = newValue
            valueLabel.Text = tostring(value)
            fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
            callback(value)
        end
    }
end

return Slider
