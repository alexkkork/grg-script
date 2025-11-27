local Utility = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ThemeManager = require(script.Parent.ThemeManager)

--// Tweening Wrapper
function Utility:Tween(instance, tweenInfo, goals)
    local speed = ThemeManager.AnimationSpeed or 0.4
    if typeof(tweenInfo) ~= "TweenInfo" then
        tweenInfo = TweenInfo.new(speed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    end
    local tween = TweenService:Create(instance, tweenInfo, goals)
    tween:Play()
    return tween
end

--// V8: Theme Binding Helper
function Utility:ThemeBind(instance, property, colorName)
    -- Initial Set
    instance[property] = ThemeManager:GetColor(colorName)
    
    -- Listen for changes
    ThemeManager.ThemeUpdate.Event:Connect(function()
        -- For smooth transition on theme change
        Utility:Tween(instance, TweenInfo.new(0.5), { [property] = ThemeManager:GetColor(colorName) })
    end)
end

--// Safe Connection
function Utility:Connect(signal, callback)
    return signal:Connect(callback)
end

--// Ripple Effect
function Utility:CreateRipple(instance)
    spawn(function()
        local ripple = Instance.new("Frame")
        ripple.Name = "Ripple"
        ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ripple.BackgroundTransparency = 0.9
        ripple.BorderSizePixel = 0
        ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        ripple.Size = UDim2.new(0, 0, 0, 0)
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = ripple
        
        ripple.Parent = instance
        
        local targetSize = math.max(instance.AbsoluteSize.X, instance.AbsoluteSize.Y) * 1.5
        local speed = ThemeManager.AnimationSpeed or 0.4
        
        Utility:Tween(ripple, TweenInfo.new(speed, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, targetSize, 0, targetSize),
            BackgroundTransparency = 1
        })
        
        wait(speed)
        ripple:Destroy()
    end)
end

--// Dragging Logic
function Utility:EnableDragging(frame, dragBar)
    local dragging, dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        local targetPos = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
        frame.Position = targetPos
    end
    
    dragBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

--// New V2 Helpers
function Utility:AddShadow(frame, size)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = UDim2.new(1, size or 20, 1, size or 20)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6015897843"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.4
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceScale = 1
    shadow.ZIndex = frame.ZIndex - 1
    shadow.Parent = frame
    return shadow
end

return Utility
