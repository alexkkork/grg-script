local Loader = {}
local TweenService = game:GetService("TweenService")
local ThemeManager = require(script.Parent.ThemeManager)
local Utility = require(script.Parent.Utility)
local Compatibility = require(script.Parent.Compatibility)

function Loader:Start(onComplete)
    local gui = Instance.new("ScreenGui")
    gui.Name = "Loader"
    gui.Parent = game:GetService("CoreGui")
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 300, 0, 150)
    main.Position = UDim2.new(0.5, -150, 0.5, -75)
    main.BackgroundColor3 = ThemeManager.Theme.Background
    main.BorderSizePixel = 0
    main.BackgroundTransparency = 1 -- Start hidden
    main.Parent = gui
    
    Utility:AddShadow(main, 40)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = main
    
    local logo = Instance.new("ImageLabel")
    logo.Size = UDim2.new(0, 50, 0, 50)
    logo.Position = UDim2.new(0.5, -25, 0.2, 0)
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://0" -- Placeholder logo
    logo.ImageTransparency = 1
    logo.Parent = main
    
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.new(0, 0, 0.6, 0)
    status.BackgroundTransparency = 1
    status.Text = "Initializing..."
    status.TextColor3 = ThemeManager.Theme.Text
    status.TextTransparency = 1
    status.Font = ThemeManager.Theme.Font
    status.TextSize = 14
    status.Parent = main
    
    local barBg = Instance.new("Frame")
    barBg.Size = UDim2.new(0.8, 0, 0, 4)
    barBg.Position = UDim2.new(0.1, 0, 0.8, 0)
    barBg.BackgroundColor3 = ThemeManager.Theme.Outline
    barBg.BackgroundTransparency = 1
    barBg.Parent = main
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = barBg
    
    local barFill = Instance.new("Frame")
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = ThemeManager.Theme.Accent
    barFill.Parent = barBg
    
    local barFillCorner = Instance.new("UICorner")
    barFillCorner.CornerRadius = UDim.new(1, 0)
    barFillCorner.Parent = barFill
    
    -- Animate In
    Utility:Tween(main, TweenInfo.new(0.5), {BackgroundTransparency = 0})
    Utility:Tween(logo, TweenInfo.new(0.5), {ImageTransparency = 0})
    Utility:Tween(status, TweenInfo.new(0.5), {TextTransparency = 0})
    Utility:Tween(barBg, TweenInfo.new(0.5), {BackgroundTransparency = 0})
    
    local function updateProgress(text, progress)
        status.Text = text
        Utility:Tween(barFill, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(math.clamp(progress, 0, 1), 0, 1, 0)
        })
    end
    
    spawn(function()
        updateProgress("Preparing environment...", 0.05)
        wait(0.25)
        
        local report = Compatibility:Check(function(step)
            local label = step.Label or "Running tests..."
            if step.Passed ~= nil then
                label = string.format("%s [%s]", label, step.Passed and "OK" or "FAIL")
            end
            updateProgress(label, math.max(0.1, step.Progress or 0))
        end)
        
        updateProgress("Finalizing...", 1)
        wait(0.4)
        
        -- Fade Out
        Utility:Tween(main, TweenInfo.new(0.5), {Size = UDim2.new(0, 350, 0, 180), BackgroundTransparency = 1})
        for _, c in pairs(main:GetDescendants()) do
            if c:IsA("ImageLabel") then Utility:Tween(c, TweenInfo.new(0.5), {ImageTransparency = 1}) end
            if c:IsA("TextLabel") then Utility:Tween(c, TweenInfo.new(0.5), {TextTransparency = 1}) end
            if c:IsA("Frame") then Utility:Tween(c, TweenInfo.new(0.5), {BackgroundTransparency = 1}) end
        end
        
        wait(0.5)
        gui:Destroy()
        if typeof(onComplete) == "function" then
            onComplete(report)
        end
    end)
end

return Loader

