local Tab = {}
local Utility = require(script.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)

function Tab.new(name, icon, window)
    -- Tab Button (Sidebar Item)
    local tabButton = Instance.new("TextButton")
    tabButton.Name = name .. "Button"
    tabButton.Size = UDim2.new(1, 0, 0, 40)
    tabButton.BackgroundTransparency = 1
    tabButton.Text = ""
    tabButton.AutoButtonColor = false
    tabButton.Parent = window.TabContainer
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tabButton

    -- Icon (Left)
    if icon then
        local iconImage = Instance.new("ImageLabel")
        iconImage.Name = "Icon"
        iconImage.Size = UDim2.new(0, 20, 0, 20)
        iconImage.Position = UDim2.new(0, 10, 0.5, -10)
        iconImage.BackgroundTransparency = 1
        iconImage.Image = icon
        iconImage.ImageColor3 = ThemeManager.Theme.SubText
        iconImage.Parent = tabButton
    end
    
    local textPos = icon and UDim2.new(0, 40, 0, 0) or UDim2.new(0, 15, 0, 0)
    
    local tabLabel = Instance.new("TextLabel")
    tabLabel.Size = UDim2.new(1, -50, 1, 0)
    tabLabel.Position = textPos
    tabLabel.BackgroundTransparency = 1
    tabLabel.Text = name
    tabLabel.TextColor3 = ThemeManager.Theme.SubText
    tabLabel.Font = ThemeManager.Theme.Font
    tabLabel.TextSize = 14
    tabLabel.TextXAlignment = Enum.TextXAlignment.Left
    tabLabel.Parent = tabButton
    
    -- Active Indicator (Left vertical pill)
    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 3, 0.6, 0)
    indicator.Position = UDim2.new(0, 0, 0.2, 0)
    indicator.BackgroundColor3 = ThemeManager.Theme.Accent
    indicator.BackgroundTransparency = 1 -- Hidden by default
    indicator.BorderSizePixel = 0
    indicator.Parent = tabButton
    
    local indCorner = Instance.new("UICorner")
    indCorner.CornerRadius = UDim.new(0, 2)
    indCorner.Parent = indicator
    
    -- Page Content
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = ThemeManager.Theme.Accent
    page.Visible = false 
    -- page.CanvasTransparency = 0 -- REMOVED: Causing crash on some executors
    page.Parent = window.PageContainer
    
    local pageLayout = Instance.new("UIListLayout")
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.Padding = UDim.new(0, 10)
    pageLayout.Parent = page
    
    local pagePadding = Instance.new("UIPadding")
    pagePadding.PaddingTop = UDim.new(0, 5)
    pagePadding.PaddingBottom = UDim.new(0, 5)
    pagePadding.PaddingLeft = UDim.new(0, 5)
    pagePadding.PaddingRight = UDim.new(0, 5)
    pagePadding.Parent = page
    
    local TabObj = {
        Button = tabButton,
        Page = page,
        Sections = {},
        Active = false
    }
    
    function TabObj:Activate()
        -- Deactivate others
        for _, t in pairs(window.Tabs) do
            t:Deactivate()
        end
        
        TabObj.Active = true
        
        -- Visual Active State
        Utility:Tween(tabLabel, TweenInfo.new(0.3), {TextColor3 = ThemeManager.Theme.Text})
        Utility:Tween(tabButton, TweenInfo.new(0.3), {BackgroundTransparency = 0.95, BackgroundColor3 = ThemeManager.Theme.Accent})
        Utility:Tween(indicator, TweenInfo.new(0.3), {BackgroundTransparency = 0})
        if icon then
             local ico = tabButton:FindFirstChild("Icon")
             if ico then Utility:Tween(ico, TweenInfo.new(0.3), {ImageColor3 = ThemeManager.Theme.Text}) end
        end
        
        -- Show Page
        page.Visible = true
        -- Optional: Add Layout/FadeIn manually if needed, but avoid CanvasTransparency for safety
    end
    
    function TabObj:Deactivate()
        TabObj.Active = false
        
        Utility:Tween(tabLabel, TweenInfo.new(0.3), {TextColor3 = ThemeManager.Theme.SubText})
        Utility:Tween(tabButton, TweenInfo.new(0.3), {BackgroundTransparency = 1, BackgroundColor3 = ThemeManager.Theme.Background})
        Utility:Tween(indicator, TweenInfo.new(0.3), {BackgroundTransparency = 1})
         if icon then
             local ico = tabButton:FindFirstChild("Icon")
             if ico then Utility:Tween(ico, TweenInfo.new(0.3), {ImageColor3 = ThemeManager.Theme.SubText}) end
        end
        
        page.Visible = false
    end
    
    tabButton.MouseButton1Click:Connect(function()
        TabObj:Activate()
    end)
    
    tabButton.MouseEnter:Connect(function()
        if not TabObj.Active then
            Utility:Tween(tabButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.97, BackgroundColor3 = ThemeManager.Theme.Text})
            Utility:Tween(tabLabel, TweenInfo.new(0.2), {TextColor3 = ThemeManager.Theme.Text})
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if not TabObj.Active then
            Utility:Tween(tabButton, TweenInfo.new(0.2), {BackgroundTransparency = 1, BackgroundColor3 = ThemeManager.Theme.Background})
            Utility:Tween(tabLabel, TweenInfo.new(0.2), {TextColor3 = ThemeManager.Theme.SubText})
        end
    end)
    
    table.insert(window.Tabs, TabObj)
    
    if #window.Tabs == 1 then
        TabObj:Activate()
    end
    
    local SectionModule = require(script.Parent.Section)
    function TabObj:AddSection(title)
        return SectionModule.new(title, TabObj)
    end
    
    return TabObj
end

return Tab
