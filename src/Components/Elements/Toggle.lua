local Toggle = {}
local Utility = require(script.Parent.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Parent.Core.ThemeManager)

function Toggle.new(options, section)
    options = options or {}
    local text = options.Text or "Toggle"
    local default = options.Default or false
    local callback = options.Callback or function() end
    
    local state = default
    
    local toggleFrame = Instance.new("TextButton")
    toggleFrame.Name = "Toggle"
    toggleFrame.Size = UDim2.new(1, 0, 0, 32)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Text = ""
    toggleFrame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggleFrame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local switch = Instance.new("Frame")
    switch.Size = UDim2.new(0, 44, 0, 22)
    switch.Position = UDim2.new(1, -54, 0.5, -11)
    switch.BackgroundColor3 = state and ThemeManager.Theme.Accent or ThemeManager.Theme.Outline
    switch.Parent = toggleFrame
    
    -- V8: ThemeBind manually because it switches between Accent/Outline
    ThemeManager.ThemeUpdate.Event:Connect(function()
        local target = state and ThemeManager.Theme.Accent or ThemeManager.Theme.Outline
        switch.BackgroundColor3 = target
    end)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = switch
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = switch
    
    ThemeManager.ThemeUpdate.Event:Connect(function()
        -- Stroke matches BG when active, or Outline when inactive
        stroke.Color = state and ThemeManager.Theme.Accent or ThemeManager.Theme.Outline
    end)
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = state and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = switch
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local knobGradient = Instance.new("UIGradient")
    knobGradient.Rotation = 90
    knobGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.9, 0.9, 0.9)),
        ColorSequenceKeypoint.new(1, Color3.new(0.8, 0.8, 0.8))
    })
    knobGradient.Parent = knob
    
    local function toggle()
        state = not state
        callback(state)
        
        local targetColor = state and ThemeManager.Theme.Accent or ThemeManager.Theme.Outline
        local targetPos = state and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        
        Utility:Tween(switch, TweenInfo.new(0.2), {BackgroundColor3 = targetColor})
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = targetColor}) 
        Utility:Tween(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = targetPos})
    end
    
    toggleFrame.MouseButton1Click:Connect(toggle)
    
    return {
        Frame = toggleFrame,
        Set = function(_, value)
            if value ~= state then
                toggle()
            end
        end,
        GetValue = function() return state end
    }
end

return Toggle
