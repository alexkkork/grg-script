local Notifications = {}
local TweenService = game:GetService("TweenService")
local Utility = require(script.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)

local container = nil
local notificationQueue = {}
local MAX_VISIBLE = 5

function Notifications:Init(gui)
    container = Instance.new("Frame")
    container.Name = "NotificationContainer"
    container.Size = UDim2.new(0, 320, 1, -20)
    container.Position = UDim2.new(1, -330, 0, 10)
    container.BackgroundTransparency = 1
    container.ZIndex = 100
    container.Parent = gui
    
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.Parent = container
end

-- Notification types with icons and colors
local NotificationTypes = {
    Info = {Icon = "ℹ️", Color = Color3.fromRGB(100, 150, 255)},
    Success = {Icon = "✓", Color = Color3.fromRGB(100, 200, 100)},
    Warning = {Icon = "⚠", Color = Color3.fromRGB(255, 180, 50)},
    Error = {Icon = "✗", Color = Color3.fromRGB(255, 80, 80)},
    Loading = {Icon = "⟳", Color = Color3.fromRGB(150, 150, 255)}
}

function Notifications:Notify(options)
    if not container then return end
    options = options or {}
    local title = options.Title or "Notification"
    local content = options.Content or ""
    local duration = options.Duration or 4
    local notifType = options.Type or "Info"
    local typeData = NotificationTypes[notifType] or NotificationTypes.Info
    local callback = options.Callback
    
    local frame = Instance.new("Frame")
    frame.Name = "Notification"
    frame.Size = UDim2.new(1, 0, 0, 0)
    frame.BackgroundColor3 = ThemeManager.Theme.Background
    frame.BackgroundTransparency = 0.05
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.ZIndex = 100
    frame.Parent = container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = frame
    
    -- Accent bar on left
    local accentBar = Instance.new("Frame")
    accentBar.Name = "AccentBar"
    accentBar.Size = UDim2.new(0, 4, 1, 0)
    accentBar.BackgroundColor3 = typeData.Color
    accentBar.BorderSizePixel = 0
    accentBar.ZIndex = 101
    accentBar.Parent = frame
    
    local accentCorner = Instance.new("UICorner")
    accentCorner.CornerRadius = UDim.new(0, 8)
    accentCorner.Parent = accentBar
    
    -- Icon
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Name = "Icon"
    iconLabel.Size = UDim2.new(0, 24, 0, 24)
    iconLabel.Position = UDim2.new(0, 14, 0, 10)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = typeData.Icon
    iconLabel.TextColor3 = typeData.Color
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 16
    iconLabel.ZIndex = 101
    iconLabel.Parent = frame
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -60, 0, 20)
    titleLabel.Position = UDim2.new(0, 44, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = ThemeManager.Theme.Text
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 101
    titleLabel.Parent = frame
    
    -- Content
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "Content"
    contentLabel.Size = UDim2.new(1, -54, 0, 30)
    contentLabel.Position = UDim2.new(0, 44, 0, 28)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content
    contentLabel.TextColor3 = ThemeManager.Theme.SubText
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextSize = 12
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextWrapped = true
    contentLabel.ZIndex = 101
    contentLabel.Parent = frame
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -28, 0, 8)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "×"
    closeBtn.TextColor3 = ThemeManager.Theme.SubText
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.ZIndex = 102
    closeBtn.Parent = frame
    
    -- Progress bar at bottom
    local progressBg = Instance.new("Frame")
    progressBg.Name = "ProgressBg"
    progressBg.Size = UDim2.new(1, -8, 0, 3)
    progressBg.Position = UDim2.new(0, 4, 1, -6)
    progressBg.BackgroundColor3 = ThemeManager.Theme.Outline
    progressBg.BackgroundTransparency = 0.7
    progressBg.BorderSizePixel = 0
    progressBg.ZIndex = 101
    progressBg.Parent = frame
    
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 2)
    progressCorner.Parent = progressBg
    
    local progressFill = Instance.new("Frame")
    progressFill.Name = "Fill"
    progressFill.Size = UDim2.new(1, 0, 1, 0)
    progressFill.BackgroundColor3 = typeData.Color
    progressFill.BorderSizePixel = 0
    progressFill.ZIndex = 102
    progressFill.Parent = progressBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 2)
    fillCorner.Parent = progressFill
    
    -- Determine height based on content
    local height = content ~= "" and 70 or 45
    
    -- Animate in
    local tweenIn = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0, height)
    })
    tweenIn:Play()
    
    -- Progress bar animation
    local progressTween = TweenService:Create(progressFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 1, 0)
    })
    progressTween:Play()
    
    local function dismiss()
        progressTween:Cancel()
        local tweenOut = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1
        })
        tweenOut:Play()
        tweenOut.Completed:Wait()
        frame:Destroy()
        if callback then
            callback()
        end
    end
    
    closeBtn.MouseButton1Click:Connect(dismiss)
    
    -- Auto dismiss
    task.delay(duration, function()
        if frame and frame.Parent then
            dismiss()
        end
    end)
    
    -- Return notification object for manual control
    return {
        Frame = frame,
        Dismiss = dismiss,
        UpdateContent = function(newContent)
            contentLabel.Text = newContent
        end,
        UpdateProgress = function(progress)
            progressFill.Size = UDim2.new(math.clamp(progress, 0, 1), 0, 1, 0)
        end
    }
end

-- Convenience methods
function Notifications:Info(title, content, duration)
    return self:Notify({Title = title, Content = content, Duration = duration or 4, Type = "Info"})
end

function Notifications:Success(title, content, duration)
    return self:Notify({Title = title, Content = content, Duration = duration or 4, Type = "Success"})
end

function Notifications:Warning(title, content, duration)
    return self:Notify({Title = title, Content = content, Duration = duration or 4, Type = "Warning"})
end

function Notifications:Error(title, content, duration)
    return self:Notify({Title = title, Content = content, Duration = duration or 4, Type = "Error"})
end

function Notifications:Loading(title, content, duration)
    return self:Notify({Title = title, Content = content, Duration = duration or 10, Type = "Loading"})
end

return Notifications

