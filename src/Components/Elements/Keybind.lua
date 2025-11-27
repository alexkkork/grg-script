local Keybind = {}
local UserInputService = game:GetService("UserInputService")
local ThemeManager = require(script.Parent.Parent.Parent.Core.ThemeManager)
local Utility = require(script.Parent.Parent.Parent.Core.Utility)
local KeybindList = require(script.Parent.Parent.Parent.Features.KeybindList)

function Keybind.new(options, section)
    options = options or {}
    local text = options.Text or "Keybind"
    local default = options.Default or Enum.KeyCode.RightControl
    local callback = options.Callback or function() end
    
    local key = default
    local binding = false
    
    local frame = Instance.new("Frame")
    frame.Name = "Keybind"
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -100, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local bindButton = Instance.new("TextButton")
    bindButton.Size = UDim2.new(0, 80, 0, 20)
    bindButton.Position = UDim2.new(1, -90, 0.5, -10)
    bindButton.BackgroundColor3 = ThemeManager.Theme.Background
    bindButton.Text = key.Name
    bindButton.Font = ThemeManager.Theme.Font
    bindButton.TextSize = 12
    bindButton.AutoButtonColor = false
    bindButton.Parent = frame
    Utility:ThemeBind(bindButton, "BackgroundColor3", "Background")
    
    -- Bind specific state based coloring manually or via specialized logic
    ThemeManager.ThemeUpdate.Event:Connect(function()
        if binding then
            bindButton.TextColor3 = ThemeManager.Theme.Accent
        else
            bindButton.TextColor3 = ThemeManager.Theme.SubText
        end
    end)
    -- Initial
    bindButton.TextColor3 = ThemeManager.Theme.SubText
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = bindButton
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Parent = bindButton
    Utility:ThemeBind(stroke, "Color", "Outline")
    
    -- KeybindList Integration
    local listEntry = KeybindList:Add(text, "[None]")
    
    local function setKey(newKey)
        key = newKey
        bindButton.Text = key.Name
        bindButton.TextColor3 = ThemeManager.Theme.SubText
        binding = false
    end
    
    bindButton.MouseButton1Click:Connect(function()
        binding = true
        bindButton.Text = "..."
        bindButton.TextColor3 = ThemeManager.Theme.Accent
    end)
    
    UserInputService.InputBegan:Connect(function(input)
        if binding then
            if input.UserInputType == Enum.UserInputType.MouseButton1 then return end -- Ignore click start
            
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode == Enum.KeyCode.Escape then
                    -- Cancel
                    bindButton.Text = key.Name
                    bindButton.TextColor3 = ThemeManager.Theme.SubText
                    binding = false
                else
                    setKey(input.KeyCode)
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 then
                 setKey(input.UserInputType)
            end
        elseif input.KeyCode == key then
            callback(key) 
        end
    end)
    
    return {
        Frame = frame,
        SetValue = function(_, newKey)
            setKey(newKey)
        end
    }
end

return Keybind
