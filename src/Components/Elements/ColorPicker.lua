local ColorPicker = {}
local UserInputService = game:GetService("UserInputService")
local Utility = require(script.Parent.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Parent.Core.ThemeManager)

function ColorPicker.new(options, section)
    options = options or {}
    local text = options.Text or "ColorPicker"
    local default = options.Default or Color3.fromRGB(255, 0, 0)
    local callback = options.Callback or function() end
    
    local color = default
    local hue, sat, val = Color3.toHSV(color)
    local isOpen = false
    
    local frame = Instance.new("Frame")
    frame.Name = "ColorPicker"
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local display = Instance.new("TextButton")
    display.Size = UDim2.new(0, 30, 0, 15)
    display.Position = UDim2.new(1, -40, 0.5, -7.5)
    display.BackgroundColor3 = color
    display.Text = ""
    display.AutoButtonColor = false
    display.Parent = frame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = display
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Parent = display
    Utility:ThemeBind(stroke, "Color", "Outline")
    
    -- Picker Container
    local pickerFrame = Instance.new("Frame")
    pickerFrame.Name = "PickerContainer"
    pickerFrame.Size = UDim2.new(1, -20, 0, 150)
    pickerFrame.Position = UDim2.new(0, 10, 0, 30)
    pickerFrame.BackgroundColor3 = ThemeManager.Theme.SectionBackground
    pickerFrame.Visible = false
    pickerFrame.Parent = frame
    Utility:ThemeBind(pickerFrame, "BackgroundColor3", "SectionBackground")
    
    local pickerCorner = Instance.new("UICorner")
    pickerCorner.CornerRadius = UDim.new(0, 4)
    pickerCorner.Parent = pickerFrame
    
    -- SV Box (Saturation / Value)
    local svBox = Instance.new("TextButton")
    svBox.Name = "SVBox"
    svBox.Size = UDim2.new(1, -30, 1, -10)
    svBox.Position = UDim2.new(0, 5, 0, 5)
    svBox.BackgroundColor3 = Color3.new(1,1,1)
    svBox.Text = ""
    svBox.AutoButtonColor = false
    svBox.Parent = pickerFrame
    
    local svCorner = Instance.new("UICorner")
    svCorner.CornerRadius = UDim.new(0, 4)
    svCorner.Parent = svBox
    
    local satGradient = Instance.new("UIGradient")
    satGradient.Color = ColorSequence.new(Color3.new(1,1,1), Color3.fromHSV(hue, 1, 1))
    satGradient.Parent = svBox
    
    local valFrame = Instance.new("Frame")
    valFrame.Size = UDim2.new(1,0,1,0)
    valFrame.BackgroundColor3 = Color3.new(0,0,0)
    valFrame.ZIndex = 2
    valFrame.Parent = svBox
    
    local valCorner = Instance.new("UICorner")
    valCorner.CornerRadius = UDim.new(0, 4)
    valCorner.Parent = valFrame
    
    local valGradient = Instance.new("UIGradient")
    valGradient.Rotation = 90
    valGradient.Color = ColorSequence.new(Color3.new(0,0,0), Color3.new(0,0,0))
    valGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(1, 0)
    })
    valGradient.Parent = valFrame
    
    local svCursor = Instance.new("Frame")
    svCursor.Size = UDim2.new(0, 4, 0, 4)
    svCursor.AnchorPoint = Vector2.new(0.5, 0.5)
    svCursor.BackgroundColor3 = Color3.new(1,1,1)
    svCursor.BorderColor3 = Color3.new(0,0,0)
    svCursor.ZIndex = 3
    svCursor.Parent = svBox
    
    -- Hue Slider
    local hueFrame = Instance.new("TextButton")
    hueFrame.Size = UDim2.new(0, 20, 1, -10)
    hueFrame.Position = UDim2.new(1, -25, 0, 5)
    hueFrame.BackgroundColor3 = Color3.new(1,1,1)
    hueFrame.Text = ""
    hueFrame.AutoButtonColor = false
    hueFrame.Parent = pickerFrame
    
    local hueCorner = Instance.new("UICorner")
    hueCorner.CornerRadius = UDim.new(0, 4)
    hueCorner.Parent = hueFrame
    
    local hueGradient = Instance.new("UIGradient")
    hueGradient.Rotation = 90
    hueGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHSV(1,1,1)),
        ColorSequenceKeypoint.new(0.17, Color3.fromHSV(0.83,1,1)),
        ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.66,1,1)),
        ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5,1,1)),
        ColorSequenceKeypoint.new(0.67, Color3.fromHSV(0.33,1,1)),
        ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.17,1,1)),
        ColorSequenceKeypoint.new(1, Color3.fromHSV(0,1,1))
    })
    hueGradient.Parent = hueFrame
    
    local hueCursor = Instance.new("Frame")
    hueCursor.Size = UDim2.new(1, 0, 0, 2)
    hueCursor.BackgroundColor3 = Color3.new(1,1,1)
    hueCursor.BorderColor3 = Color3.new(0,0,0)
    hueCursor.Parent = hueFrame
    
    local function updateColor()
        color = Color3.fromHSV(hue, sat, val)
        display.BackgroundColor3 = color
        svBox.BackgroundColor3 = Color3.new(1,1,1)
        satGradient.Color = ColorSequence.new(Color3.new(1,1,1), Color3.fromHSV(hue, 1, 1))
        
        svCursor.Position = UDim2.new(sat, 0, 1-val, 0)
        hueCursor.Position = UDim2.new(0, 0, 1-hue, 0)
        
        callback(color)
    end
    
    -- Input Handling
    local draggingSV = false
    local draggingHue = false
    
    svBox.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSV = true
        end
    end)
    
    hueFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingHue = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSV = false
            draggingHue = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if draggingSV then
                local mousePos = UserInputService:GetMouseLocation()
                local relX = math.clamp((mousePos.X - svBox.AbsolutePosition.X) / svBox.AbsoluteSize.X, 0, 1)
                local relY = math.clamp((mousePos.Y - svBox.AbsolutePosition.Y - 36) / svBox.AbsoluteSize.Y, 0, 1) 
                
                sat = relX
                val = 1 - relY
                updateColor()
            end
            if draggingHue then
                local mousePos = UserInputService:GetMouseLocation()
                local relY = math.clamp((mousePos.Y - hueFrame.AbsolutePosition.Y - 36) / hueFrame.AbsoluteSize.Y, 0, 1)
                hue = 1 - relY
                updateColor()
            end
        end
    end)
    
    display.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        pickerFrame.Visible = isOpen
        frame.Size = isOpen and UDim2.new(1, 0, 0, 185) or UDim2.new(1, 0, 0, 30)
    end)
    
    updateColor()
    
    return {
        Frame = frame,
        SetValue = function(_, newColor)
            color = newColor
            hue, sat, val = Color3.toHSV(color)
            updateColor()
        end
    }
end

return ColorPicker
