local Window = {}
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Utility = require(script.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)
local Acrylic = require(script.Parent.Parent.Core.Acrylic)
local Particles = require(script.Parent.Parent.Core.Particles)
local SearchFeature = require(script.Parent.Parent.Features.Search)
local Watermark = require(script.Parent.Parent.Features.Watermark)
local KeybindList = require(script.Parent.Parent.Features.KeybindList)
local SaveManager = require(script.Parent.Parent.Core.SaveManager)

function Window.new(options)
    options = options or {}
    local title = options.Title or "Premium Hub"
    local author = options.Author or "User"
    
    if CoreGui:FindFirstChild(title) then
        CoreGui[title]:Destroy()
    end
    
    SaveManager:Init(options.Folder or title)
    
    local gui = Instance.new("ScreenGui")
    gui.Name = title
    gui.Parent = CoreGui
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false
    gui.Enabled = true
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "Main"
    mainFrame.Size = UDim2.new(0, 700, 0, 450)
    mainFrame.Position = UDim2.new(0.5, -350, 0.5, -225)
    mainFrame.BackgroundColor3 = ThemeManager.Theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = gui
    
    Utility:AddShadow(mainFrame, 40)
    local acrylic = Acrylic:CreateAcrylic()
    acrylic:Enable(mainFrame)
    Particles:Create(mainFrame)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = mainFrame
    
    -- Title Bar
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.BackgroundTransparency = 1
    topBar.Parent = mainFrame
    
    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "Close"
    closeButton.Size = UDim2.new(0, 40, 0, 40)
    closeButton.Position = UDim2.new(1, -40, 0, 0)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = ""
    closeButton.Parent = topBar
    
    local closeIcon = Instance.new("ImageLabel")
    closeIcon.Size = UDim2.new(0, 16, 0, 16)
    closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    closeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    closeIcon.BackgroundTransparency = 1
    closeIcon.Image = "rbxassetid://6031094678"
    closeIcon.ImageColor3 = ThemeManager.Theme.SubText
    closeIcon.Parent = closeButton
    
    -- Open Button (Mini)
    local openButton = Instance.new("TextButton")
    openButton.Name = "OpenButton"
    openButton.Size = UDim2.new(0, 50, 0, 50)
    openButton.Position = UDim2.new(0.5, -25, 0, 10)
    openButton.BackgroundColor3 = ThemeManager.Theme.Background
    openButton.BorderColor3 = ThemeManager.Theme.Outline
    openButton.BorderSizePixel = 1
    openButton.Text = "Open"
    openButton.TextColor3 = ThemeManager.Theme.Accent
    openButton.Font = ThemeManager.Theme.FontBold
    openButton.TextSize = 12
    openButton.Visible = false
    openButton.Parent = gui
    
    local openCorner = Instance.new("UICorner")
    openCorner.CornerRadius = UDim.new(0, 8)
    openCorner.Parent = openButton
    Utility:AddShadow(openButton, 20)
    
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 200, 1, 0)
    sidebar.BackgroundColor3 = ThemeManager.Theme.SectionBackground
    sidebar.BackgroundTransparency = 0.5
    sidebar.BorderSizePixel = 0
    sidebar.Parent = mainFrame
    
    local sidebarCorner = Instance.new("UICorner")
    sidebarCorner.CornerRadius = UDim.new(0, 10)
    sidebarCorner.Parent = sidebar
    
    local sidebarMask = Instance.new("Frame")
    sidebarMask.Name = "Mask"
    sidebarMask.Size = UDim2.new(0, 10, 1, 0)
    sidebarMask.Position = UDim2.new(1, -10, 0, 0)
    sidebarMask.BackgroundColor3 = ThemeManager.Theme.SectionBackground
    sidebarMask.BackgroundTransparency = 1
    sidebarMask.BorderSizePixel = 0
    sidebarMask.Parent = sidebar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 40)
    titleLabel.Position = UDim2.new(0, 15, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = ThemeManager.Theme.Accent
    titleLabel.Font = ThemeManager.Theme.FontBold
    titleLabel.TextSize = 22
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = sidebar
    
    local authorLabel = Instance.new("TextLabel")
    authorLabel.Size = UDim2.new(1, -20, 0, 20)
    authorLabel.Position = UDim2.new(0, 15, 0, 35)
    authorLabel.BackgroundTransparency = 1
    authorLabel.Text = "by " .. author
    authorLabel.TextColor3 = ThemeManager.Theme.SubText
    authorLabel.Font = ThemeManager.Theme.Font
    authorLabel.TextSize = 12
    authorLabel.TextXAlignment = Enum.TextXAlignment.Left
    authorLabel.Parent = sidebar
    
    local tabContainer = Instance.new("ScrollingFrame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(1, 0, 1, -100)
    tabContainer.Position = UDim2.new(0, 0, 0, 70)
    tabContainer.BackgroundTransparency = 1
    tabContainer.ScrollBarThickness = 2
    tabContainer.ScrollBarImageColor3 = ThemeManager.Theme.Accent
    tabContainer.Parent = sidebar
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = tabContainer
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingLeft = UDim.new(0, 10)
    tabPadding.PaddingRight = UDim.new(0, 10)
    tabPadding.Parent = tabContainer
    
    local bottomArea = Instance.new("Frame")
    bottomArea.Name = "BottomArea"
    bottomArea.Size = UDim2.new(1, 0, 0, 60)
    bottomArea.Position = UDim2.new(0, 0, 1, -60)
    bottomArea.BackgroundTransparency = 1
    bottomArea.Parent = sidebar
    
    local userProfile = Instance.new("Frame")
    userProfile.Size = UDim2.new(1, -20, 0, 40)
    userProfile.Position = UDim2.new(0, 10, 0, -45)
    userProfile.BackgroundTransparency = 1
    userProfile.Parent = bottomArea
    
    local userThumb = Instance.new("ImageLabel")
    userThumb.Size = UDim2.new(0, 30, 0, 30)
    userThumb.Position = UDim2.new(0, 0, 0.5, -15)
    userThumb.BackgroundTransparency = 1
    userThumb.Image = "rbxassetid://0"
    userThumb.Parent = userProfile
    
    local thumbCorner = Instance.new("UICorner")
    thumbCorner.CornerRadius = UDim.new(1, 0)
    thumbCorner.Parent = userThumb
    
    local userName = Instance.new("TextLabel")
    userName.Size = UDim2.new(1, -40, 0, 20)
    userName.Position = UDim2.new(0, 40, 0.5, -10)
    userName.BackgroundTransparency = 1
    userName.Text = "Loading..."
    userName.TextColor3 = ThemeManager.Theme.Text
    userName.Font = ThemeManager.Theme.FontBold
    userName.TextSize = 12
    userName.TextXAlignment = Enum.TextXAlignment.Left
    userName.Parent = userProfile
    
    spawn(function()
        local player = Players.LocalPlayer
        if player then
            userName.Text = player.Name
            local success, content = pcall(function()
                return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
            end)
            if success then
                userThumb.Image = content
            end
        end
    end)
    
    local searchBar = Instance.new("TextBox")
    searchBar.Name = "SearchBar"
    searchBar.Size = UDim2.new(1, -20, 0, 30)
    searchBar.Position = UDim2.new(0, 10, 0.5, -15)
    searchBar.BackgroundColor3 = ThemeManager.Theme.Background
    searchBar.BackgroundTransparency = 0.5
    searchBar.Text = ""
    searchBar.PlaceholderText = "Search..."
    searchBar.TextColor3 = ThemeManager.Theme.Text
    searchBar.PlaceholderColor3 = ThemeManager.Theme.SubText
    searchBar.Font = ThemeManager.Theme.Font
    searchBar.TextSize = 14
    searchBar.Parent = bottomArea
    
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 6)
    searchCorner.Parent = searchBar
    
    local searchStroke = Instance.new("UIStroke")
    searchStroke.Color = ThemeManager.Theme.Outline
    searchStroke.Thickness = 1
    searchStroke.Transparency = 0.5
    searchStroke.Parent = searchBar
    
    local pageContainer = Instance.new("Frame")
    pageContainer.Name = "PageContainer"
    pageContainer.Size = UDim2.new(1, -210, 1, -20)
    pageContainer.Position = UDim2.new(0, 210, 0, 10)
    pageContainer.BackgroundTransparency = 1
    pageContainer.Parent = mainFrame

    local dragZone = Instance.new("Frame")
    dragZone.Size = UDim2.new(1, 0, 0, 40)
    dragZone.BackgroundTransparency = 1
    dragZone.Parent = mainFrame
    Utility:EnableDragging(mainFrame, dragZone)
    
    local WindowObj = {
        Gui = gui,
        Main = mainFrame,
        TabContainer = tabContainer,
        PageContainer = pageContainer,
        Tabs = {},
        Options = options,
        IsOpen = true
    }
    
    -- Theme Update Listener
    ThemeManager.ThemeUpdate.Event:Connect(function()
        mainFrame.BackgroundColor3 = ThemeManager.Theme.Background
        stroke.Color = ThemeManager.Theme.Outline
        sidebar.BackgroundColor3 = ThemeManager.Theme.SectionBackground
        titleLabel.TextColor3 = ThemeManager.Theme.Accent
        authorLabel.TextColor3 = ThemeManager.Theme.SubText
        tabContainer.ScrollBarImageColor3 = ThemeManager.Theme.Accent
        userName.TextColor3 = ThemeManager.Theme.Text
        searchBar.BackgroundColor3 = ThemeManager.Theme.Background
        searchBar.TextColor3 = ThemeManager.Theme.Text
        searchBar.PlaceholderColor3 = ThemeManager.Theme.SubText
        searchStroke.Color = ThemeManager.Theme.Outline
        openButton.BackgroundColor3 = ThemeManager.Theme.Background
        openButton.TextColor3 = ThemeManager.Theme.Accent
        closeIcon.ImageColor3 = ThemeManager.Theme.SubText
    end)
    
    local isOpen = true
    function WindowObj:Toggle(state)
        if state == nil then
            state = not isOpen
        end
        if state == isOpen then return end
        isOpen = state
        WindowObj.IsOpen = isOpen
        
        if isOpen then
            gui.Enabled = true
            mainFrame.Visible = true
            openButton.Visible = false
            Utility:Tween(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 700, 0, 450),
                BackgroundTransparency = 0
            })
        else
            openButton.Visible = true
            Utility:Tween(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 700, 0, 0),
                BackgroundTransparency = 1
            })
            task.wait(0.3)
            if not isOpen then
                mainFrame.Visible = false
            end
        end
    end
    
    closeButton.MouseButton1Click:Connect(function()
        WindowObj:Toggle(false)
    end)
    
    openButton.MouseButton1Click:Connect(function()
        WindowObj:Toggle(true)
    end)
    
    local TabModule = require(script.Parent.Tab)
    
    function WindowObj:AddTab(name, icon)
        return TabModule.new(name, icon, WindowObj)
    end
    
    SearchFeature:Init(searchBar, WindowObj)
    Watermark:Init(gui)
    KeybindList:Init(gui)
    
    return WindowObj
end

return Window
