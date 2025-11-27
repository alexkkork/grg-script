local TextBox = {}
local Utility = require(script.Parent.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Parent.Core.ThemeManager)

function TextBox.new(options, section)
    options = options or {}
    local text = options.Text or "TextBox"
    local placeholder = options.Placeholder or "Input..."
    local callback = options.Callback or function() end
    
    local frame = Instance.new("Frame")
    frame.Name = "TextBox"
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundTransparency = 1
    frame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local inputBg = Instance.new("Frame")
    inputBg.Size = UDim2.new(1, -20, 0, 20) -- Reduced height for input
    inputBg.Position = UDim2.new(0, 10, 0, 20)
    inputBg.BackgroundColor3 = ThemeManager.Theme.Background
    inputBg.Parent = frame
    Utility:ThemeBind(inputBg, "BackgroundColor3", "Background")
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = inputBg
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = inputBg
    Utility:ThemeBind(stroke, "Color", "Outline")
    
    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -10, 1, 0)
    input.Position = UDim2.new(0, 5, 0, 0)
    input.BackgroundTransparency = 1
    input.Text = ""
    input.PlaceholderText = placeholder
    input.PlaceholderColor3 = ThemeManager.Theme.SubText
    input.Font = ThemeManager.Theme.Font
    input.TextSize = 14
    input.TextXAlignment = Enum.TextXAlignment.Left
    input.Parent = inputBg
    Utility:ThemeBind(input, "TextColor3", "Text")
    Utility:ThemeBind(input, "PlaceholderColor3", "SubText")
    
    input.Focused:Connect(function()
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Accent})
    end)
    
    input.FocusLost:Connect(function()
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Outline})
        callback(input.Text)
    end)
    
    return {
        Frame = frame,
        SetValue = function(_, newValue)
            input.Text = newValue
        end,
        GetValue = function()
            return input.Text
        end
    }
end

return TextBox
