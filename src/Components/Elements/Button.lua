local Button = {}
local Utility = require(script.Parent.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Parent.Core.ThemeManager)

function Button.new(options, section)
    options = options or {}
    local text = options.Text or "Button"
    local callback = options.Callback or function() end
    
    local buttonFrame = Instance.new("TextButton")
    buttonFrame.Name = "Button"
    buttonFrame.Size = UDim2.new(1, 0, 0, 32)
    buttonFrame.BackgroundTransparency = 0.6
    buttonFrame.Text = ""
    buttonFrame.AutoButtonColor = false
    buttonFrame.Parent = section.Container
    
    Utility:ThemeBind(buttonFrame, "BackgroundColor3", "Background")
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = buttonFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Parent = buttonFrame
    Utility:ThemeBind(stroke, "Color", "Outline")
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.9, 0.9, 0.9))
    })
    gradient.Rotation = 90
    gradient.Parent = buttonFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.Parent = buttonFrame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    -- Animations
    buttonFrame.MouseEnter:Connect(function()
        Utility:Tween(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = ThemeManager.Theme.Hover})
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Accent})
    end)
    
    buttonFrame.MouseLeave:Connect(function()
        Utility:Tween(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = ThemeManager.Theme.Background})
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Outline})
    end)
    
    buttonFrame.MouseButton1Click:Connect(function()
        Utility:CreateRipple(buttonFrame)
        callback()
    end)
    
    return {
        Frame = buttonFrame,
        SetText = function(_, newText)
            label.Text = newText
        end
    }
end

return Button
