local Notifications = {}
local Utility = require(script.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)

local container = nil

function Notifications:Init(gui)
    container = Instance.new("Frame")
    container.Name = "NotificationContainer"
    container.Size = UDim2.new(0, 300, 1, -20)
    container.Position = UDim2.new(1, -320, 0, 10)
    container.BackgroundTransparency = 1
    container.Parent = gui
    
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.Parent = container
end

function Notifications:Notify(options)
    if not container then return end
    options = options or {}
    local title = options.Title or "Notification"
    local content = options.Content or "Message"
    local duration = options.Duration or 3
    
    local frame = Instance.new("Frame")
    frame.Name = "Notification"
    frame.Size = UDim2.new(1, 0, 0, 0) -- Start small
    frame.BackgroundColor3 = ThemeManager.Theme.Background
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = frame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 20)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = ThemeManager.Theme.Accent
    titleLabel.Font = ThemeManager.Theme.FontBold
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = frame
    
    local contentLabel = Instance.new("TextLabel")
    contentLabel.Size = UDim2.new(1, -20, 0, 0)
    contentLabel.Position = UDim2.new(0, 10, 0, 25)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content
    contentLabel.TextColor3 = ThemeManager.Theme.Text
    contentLabel.Font = ThemeManager.Theme.Font
    contentLabel.TextSize = 12
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.TextWrapped = true
    contentLabel.Parent = frame
    
    -- Progress Bar
    local progress = Instance.new("Frame")
    progress.Size = UDim2.new(1, 0, 0, 2)
    progress.Position = UDim2.new(0, 0, 1, -2)
    progress.BackgroundColor3 = ThemeManager.Theme.Accent
    progress.BorderSizePixel = 0
    progress.Parent = frame
    
    -- Animate In
    Utility:Tween(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 60)})
    Utility:Tween(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 2)})
    
    delay(duration, function()
        Utility:Tween(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1})
        wait(0.5)
        frame:Destroy()
    end)
end

return Notifications

