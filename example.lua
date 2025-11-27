--==============================================================================
-- SERVICES
--==============================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

--==============================================================================
-- FAKE LOADING SCREEN
--==============================================================================
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "GRGLoader"
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
loadingGui.DisplayOrder = 999999
loadingGui.IgnoreGuiInset = true
loadingGui.ResetOnSpawn = false
loadingGui.Parent = CoreGui

local bg = Instance.new("Frame")
bg.Name = "Background"
bg.AnchorPoint = Vector2.new(0.5, 0.5)
bg.Size = UDim2.new(1.5, 0, 1.5, 0)
bg.Position = UDim2.new(0.5, 0, 0.5, 0)
bg.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
bg.BorderSizePixel = 0
bg.ZIndex = 100
bg.Parent = loadingGui

local container = Instance.new("Frame")
container.Name = "Container"
container.Size = UDim2.new(0, 400, 0, 200)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.BackgroundTransparency = 1
container.ZIndex = 101
container.Parent = loadingGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "#1 GRG Script"
title.TextColor3 = Color3.fromRGB(255, 100, 150)
title.Font = Enum.Font.GothamBold
title.TextSize = 36
title.ZIndex = 101
title.Parent = container

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(1, 0, 0, 25)
subtitle.Position = UDim2.new(0, 0, 0, 50)
subtitle.BackgroundTransparency = 1
subtitle.Text = "made by alex"
subtitle.TextColor3 = Color3.fromRGB(150, 150, 150)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 16
subtitle.ZIndex = 101
subtitle.Parent = container

local barBg = Instance.new("Frame")
barBg.Name = "BarBackground"
barBg.Size = UDim2.new(1, 0, 0, 6)
barBg.Position = UDim2.new(0, 0, 0, 100)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
barBg.BorderSizePixel = 0
barBg.ZIndex = 101
barBg.Parent = container

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 3)
barCorner.Parent = barBg

local barStroke = Instance.new("UIStroke")
barStroke.Color = Color3.fromRGB(80, 80, 90)
barStroke.Thickness = 1
barStroke.Parent = barBg

local barFill = Instance.new("Frame")
barFill.Name = "Fill"
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
barFill.BorderSizePixel = 0
barFill.ZIndex = 102
barFill.Parent = barBg

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 3)
fillCorner.Parent = barFill

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 115)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Initializing..."
statusLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.ZIndex = 101
statusLabel.Parent = container

local percentLabel = Instance.new("TextLabel")
percentLabel.Name = "Percent"
percentLabel.Size = UDim2.new(1, 0, 0, 20)
percentLabel.Position = UDim2.new(0, 0, 0, 135)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(255, 100, 150)
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 14
percentLabel.ZIndex = 101
percentLabel.Parent = container

-- Loading animation in background
local loadingSteps = {
    "Connecting to server...",
    "Loading UI Library...",
    "Initializing modules...",
    "Loading ESP system...",
    "Loading teleport system...",
    "Loading player mods...",
    "Loading autofarm...",
    "Checking executor...",
    "Applying theme...",
    "Finalizing..."
}

-- Load the library in background while showing loading screen
local Library = nil
local libraryLoaded = false

task.spawn(function()
    Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/alexkkork/grg-script/main/Release.lua"))()
    libraryLoaded = true
end)

-- Run loading animation
for i, stepText in ipairs(loadingSteps) do
    statusLabel.Text = stepText
    local progress = i / #loadingSteps
    TweenService:Create(barFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
        Size = UDim2.new(progress, 0, 1, 0)
    }):Play()
    percentLabel.Text = math.floor(progress * 100) .. "%"
    task.wait(0.6)
end

-- Wait for library to finish loading if it hasn't yet
while not libraryLoaded do
    task.wait(0.1)
end

-- Finish loading and fade out
statusLabel.Text = "Complete!"
percentLabel.Text = "100%"
TweenService:Create(barFill, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 1, 0)}):Play()
task.wait(0.3)

-- Fade out
local fadeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
TweenService:Create(bg, fadeInfo, {BackgroundTransparency = 1}):Play()
TweenService:Create(title, fadeInfo, {TextTransparency = 1}):Play()
TweenService:Create(subtitle, fadeInfo, {TextTransparency = 1}):Play()
TweenService:Create(statusLabel, fadeInfo, {TextTransparency = 1}):Play()
TweenService:Create(percentLabel, fadeInfo, {TextTransparency = 1}):Play()
TweenService:Create(barBg, fadeInfo, {BackgroundTransparency = 1}):Play()
TweenService:Create(barFill, fadeInfo, {BackgroundTransparency = 1}):Play()
TweenService:Create(barStroke, fadeInfo, {Transparency = 1}):Play()
task.wait(0.4)
loadingGui:Destroy()

--==============================================================================
-- UTILITY FUNCTIONS (Anticheat Bypass, Teleport helpers)
--==============================================================================
local doc = Workspace:FindFirstChild("DOCONLY", true)
local guard = Workspace:FindFirstChild("GUARDONLY", true)

local function touch(a, b)
    if a and b and firetouchinterest then
        firetouchinterest(a, b, 0)
        firetouchinterest(a, b, 1)
    end
end

local function getHRP()
    local char = player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function AnticheatBypass()
    local hrp = getHRP()
    if not hrp then return end
    if player.Team and player.Team.Name == "Doctor" then
        touch(hrp, guard)
    else
        touch(hrp, doc)
    end
end

local function teleportTo(position)
    local hrp = getHRP()
    if not hrp then return end
    AnticheatBypass()
    task.wait(0.3)
    hrp.CFrame = CFrame.new(position)
end

--==============================================================================
-- STATE VARIABLES
--==============================================================================
local ESP = {
    PlayersEnabled = false,
    MoneyTreesEnabled = false,
    FruitTreesEnabled = false,
    MoneyTreeBoxes = {},
    FruitTreeBoxes = {},
    RenderConnection = nil
}

local PlayerMods = {
    FlyEnabled = false,
    InfiniteJumpEnabled = false,
    FlyGyro = nil,
    FlyVelocity = nil,
    FlySpeed = 100,
    MoveVector = Vector3.zero
}

local Autofarm = {
    BarbEnabled = false,
    AxeEnabled = false,
    AutoteamEnabled = false,
    AutoteamRole = "None"
}

--==============================================================================
-- CREATE WINDOW
--==============================================================================
local Window = Library.Window.new({
    Title = "#1 GRG Script",
    Author = "alex",
    Folder = "GRGScript"
})

-- Welcome notification
task.delay(0.5, function()
    Window:Notify({
        Title = "Welcome!",
        Content = "#1 GRG Script loaded successfully. Press K to toggle UI.",
        Duration = 5,
        Type = "Success"
    })
end)

--==============================================================================
-- ESP & TELEPORT TAB
--==============================================================================
local ESPTab = Window:AddTab("ESP & Teleport", "rbxassetid://6031280882")

-- ESP Section
local ESPSection = ESPTab:AddSection("ESP")

-- Player ESP Functions
local function removePlayerHighlight(character)
    if not character then return end
    local highlight = character:FindFirstChild("PlayerHighlight")
    if highlight then highlight:Destroy() end
    local head = character:FindFirstChild("Head")
    if head then
        local billboard = head:FindFirstChild("NameBillboard")
        if billboard then billboard:Destroy() end
    end
end

local function highlightPlayer(plr, character)
    if not ESP.PlayersEnabled or not character then return end
    removePlayerHighlight(character)
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "PlayerHighlight"
    highlight.FillColor = plr.Team and plr.Team.TeamColor.Color or Color3.fromRGB(255, 255, 0)
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = character
    
    local head = character:FindFirstChild("Head")
    if head then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "NameBillboard"
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 100, 0, 25)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Parent = head
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = plr.DisplayName or plr.Name
        textLabel.TextColor3 = plr.Team and plr.Team.TeamColor.Color or Color3.new(1, 1, 1)
        textLabel.TextStrokeTransparency = 0.5
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 14
        textLabel.Parent = billboard
    end
end

ESPSection:AddToggle({
    Text = "ESP: Players",
    Default = false,
    Callback = function(value)
        ESP.PlayersEnabled = value
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player then
                if value and plr.Character then
                    highlightPlayer(plr, plr.Character)
                elseif plr.Character then
                    removePlayerHighlight(plr.Character)
                end
            end
        end
        Window:Notify({
            Title = "Player ESP",
            Content = value and "Player ESP enabled" or "Player ESP disabled",
            Duration = 2,
            Type = value and "Success" or "Info"
        })
    end
})

-- Setup player ESP listeners
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= player then
        plr.CharacterAdded:Connect(function(char)
            if ESP.PlayersEnabled then
                task.wait(0.5)
                highlightPlayer(plr, char)
            end
        end)
    end
end
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        if ESP.PlayersEnabled then
            task.wait(0.5)
            highlightPlayer(plr, char)
        end
    end)
end)

-- Tree ESP (Drawing API)
local function createTreeESP(treeName, boxTable, labelText)
    local treesFolder = Workspace:FindFirstChild("Trees")
    if not treesFolder then return end
    
    for _, tree in ipairs(treesFolder:GetChildren()) do
        if tree.Name == treeName then
            local exists = false
            for _, existing in ipairs(boxTable) do
                if existing.tree == tree then exists = true break end
            end
            if not exists then
                local phys = tree:FindFirstChild("PhysicalTree")
                if phys then
                    local middle = phys:FindFirstChild("Middle")
                    if middle and middle:IsA("BasePart") and Drawing then
                        local box = Drawing.new("Square")
                        box.Thickness = 2
                        box.Transparency = 1
                        box.Filled = false
                        box.Visible = false
                        
                        local text = Drawing.new("Text")
                        text.Size = 14
                        text.Center = true
                        text.Outline = true
                        text.Text = labelText
                        text.Visible = false
                        
                        table.insert(boxTable, {part = middle, tree = tree, box = box, text = text})
                    end
                end
            end
        end
    end
end

local function hideTreeESP(boxTable)
    for _, item in ipairs(boxTable) do
        if item.box then item.box.Visible = false end
        if item.text then item.text.Visible = false end
    end
end

local function renderTreeESP(boxTable, enabled)
    if not enabled then return end
    local hue = (tick() * 0.1) % 1
    local color = Color3.fromHSV(hue, 1, 1)
    
    for _, item in ipairs(boxTable) do
        local part = item.part
        if part and part:IsDescendantOf(Workspace) then
            local pos, onScreen = camera:WorldToViewportPoint(part.Position)
            if onScreen then
                item.box.Position = Vector2.new(pos.X - 30, pos.Y - 30)
                item.box.Size = Vector2.new(60, 60)
                item.box.Color = color
                item.box.Visible = true
                item.text.Position = Vector2.new(pos.X, pos.Y - 40)
                item.text.Color = color
                item.text.Visible = true
            else
                item.box.Visible = false
                item.text.Visible = false
            end
        else
            item.box.Visible = false
            item.text.Visible = false
        end
    end
end

ESPSection:AddToggle({
    Text = "ESP: Money Trees",
    Default = false,
    Callback = function(value)
        ESP.MoneyTreesEnabled = value
        if not value then hideTreeESP(ESP.MoneyTreeBoxes) end
        Window:Notify({
            Title = "Money Tree ESP",
            Content = value and "Money Tree ESP enabled" or "Money Tree ESP disabled",
            Duration = 2,
            Type = value and "Success" or "Info"
        })
    end
})

ESPSection:AddToggle({
    Text = "ESP: Fruit Trees",
    Default = false,
    Callback = function(value)
        ESP.FruitTreesEnabled = value
        if not value then hideTreeESP(ESP.FruitTreeBoxes) end
        Window:Notify({
            Title = "Fruit Tree ESP",
            Content = value and "Fruit Tree ESP enabled" or "Fruit Tree ESP disabled",
            Duration = 2,
            Type = value and "Success" or "Info"
        })
    end
})

-- ESP Render Loop
task.spawn(function()
    while true do
        task.wait(0.5)
        if ESP.MoneyTreesEnabled then createTreeESP("OG_Money", ESP.MoneyTreeBoxes, "💰 Money Tree") end
        if ESP.FruitTreesEnabled then createTreeESP("OG_Fruit", ESP.FruitTreeBoxes, "🍎 Fruit Tree") end
    end
end)

RunService.RenderStepped:Connect(function()
    renderTreeESP(ESP.MoneyTreeBoxes, ESP.MoneyTreesEnabled)
    renderTreeESP(ESP.FruitTreeBoxes, ESP.FruitTreesEnabled)
end)

-- Teleports Section
local TeleportSection = ESPTab:AddSection("Teleports")

TeleportSection:AddButton({
    Text = "Nearest Money Tree",
    Callback = function()
        local treesFolder = Workspace:FindFirstChild("Trees")
        if not treesFolder then 
            Window:Notify({Title = "Error", Content = "Trees folder not found", Duration = 2, Type = "Error"})
            return 
        end
        local hrp = getHRP()
        if not hrp then 
            Window:Notify({Title = "Error", Content = "Character not found", Duration = 2, Type = "Error"})
            return 
        end
        
        local nearest, shortestDist = nil, math.huge
        for _, tree in ipairs(treesFolder:GetChildren()) do
            if tree.Name == "OG_Money" then
                local phys = tree:FindFirstChild("PhysicalTree")
                if phys then
                    local mid = phys:FindFirstChild("Middle")
                    if mid then
                        local dist = (hrp.Position - mid.Position).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            nearest = mid.Position
                        end
                    end
                end
            end
        end
        if nearest then 
            teleportTo(nearest + Vector3.new(0, 5, 0))
            Window:Notify({Title = "Teleported", Content = "Teleported to nearest Money Tree", Duration = 2, Type = "Success"})
        else
            Window:Notify({Title = "Not Found", Content = "No Money Trees found", Duration = 2, Type = "Warning"})
        end
    end
})

TeleportSection:AddButton({
    Text = "Nearest Fruit Tree",
    Callback = function()
        local treesFolder = Workspace:FindFirstChild("Trees")
        if not treesFolder then 
            Window:Notify({Title = "Error", Content = "Trees folder not found", Duration = 2, Type = "Error"})
            return 
        end
        local hrp = getHRP()
        if not hrp then 
            Window:Notify({Title = "Error", Content = "Character not found", Duration = 2, Type = "Error"})
            return 
        end
        
        local nearest, shortestDist = nil, math.huge
        for _, tree in ipairs(treesFolder:GetChildren()) do
            if tree.Name == "OG_Fruit" then
                local owner = tree:FindFirstChild("Owner")
                local skip = owner and owner:IsA("ObjectValue") and owner.Value and owner.Value ~= player
                if not skip then
                    local phys = tree:FindFirstChild("PhysicalTree")
                    if phys then
                        local mid = phys:FindFirstChild("Middle")
                        if mid then
                            local dist = (hrp.Position - mid.Position).Magnitude
                            if dist < shortestDist then
                                shortestDist = dist
                                nearest = mid.Position
                            end
                        end
                    end
                end
            end
        end
        if nearest then 
            teleportTo(nearest + Vector3.new(0, 5, 0))
            Window:Notify({Title = "Teleported", Content = "Teleported to nearest Fruit Tree", Duration = 2, Type = "Success"})
        else
            Window:Notify({Title = "Not Found", Content = "No Fruit Trees found", Duration = 2, Type = "Warning"})
        end
    end
})

local teleportLocations = {
    {"Arena", Vector3.new(-228, 29, 342)},
    {"Barb Beach", Vector3.new(12, -10, -1319)},
    {"Barb Food", Vector3.new(61, 5, -1293)},
    {"Town Food", Vector3.new(59, 30, 293)},
    {"Beach", Vector3.new(-500, -2, 531)},
    {"Council", Vector3.new(0, 43, 628)},
    {"FarmKart", Vector3.new(173, 1, -18)},
    {"Gate", Vector3.new(0, 21, 180)},
    {"Leader Tower", Vector3.new(-1, 44, 430)},
    {"Barb Village", Vector3.new(1, -1, -1254)},
    {"Hospital", Vector3.new(-23, 22, 243)}
}

for _, loc in ipairs(teleportLocations) do
    TeleportSection:AddButton({
        Text = loc[1],
        Callback = function()
            teleportTo(loc[2])
            Window:Notify({
                Title = "Teleported",
                Content = "Teleported to " .. loc[1],
                Duration = 2,
                Type = "Success"
            })
        end
    })
end

local leaderTPEnabled = false
TeleportSection:AddToggle({
    Text = "TP to Current Leader (Loop)",
    Default = false,
    Callback = function(value)
        leaderTPEnabled = value
        Window:Notify({
            Title = "Leader TP",
            Content = value and "Teleporting to leader on loop" or "Leader TP disabled",
            Duration = 2,
            Type = value and "Success" or "Info"
        })
        if value then
            task.spawn(function()
                while leaderTPEnabled do
                    local leaders = {}
                    for _, p in pairs(Players:GetPlayers()) do
                        if p.Team and p.Team.Name == "Leader" and p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            table.insert(leaders, p)
                        end
                    end
                    if #leaders > 0 then
                        local target = leaders[math.random(1, #leaders)]
                        teleportTo(target.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

--==============================================================================
-- PLAYER TAB
--==============================================================================
local PlayerTab = Window:AddTab("Player", "rbxassetid://6034287594")

local PlayerSection = PlayerTab:AddSection("Movement")

-- Fly
local function enableFly()
    local hrp = getHRP()
    if not hrp then return end
    
    PlayerMods.FlyGyro = Instance.new("BodyGyro")
    PlayerMods.FlyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    PlayerMods.FlyGyro.P = 1e4
    PlayerMods.FlyGyro.CFrame = hrp.CFrame
    PlayerMods.FlyGyro.Parent = hrp
    
    PlayerMods.FlyVelocity = Instance.new("BodyVelocity")
    PlayerMods.FlyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    PlayerMods.FlyVelocity.Velocity = Vector3.zero
    PlayerMods.FlyVelocity.P = 1e4
    PlayerMods.FlyVelocity.Parent = hrp
end

local function disableFly()
    if PlayerMods.FlyGyro then PlayerMods.FlyGyro:Destroy() PlayerMods.FlyGyro = nil end
    if PlayerMods.FlyVelocity then PlayerMods.FlyVelocity:Destroy() PlayerMods.FlyVelocity = nil end
    PlayerMods.MoveVector = Vector3.zero
end

PlayerSection:AddToggle({
    Text = "Vehicle/Character Fly",
    Default = false,
    Callback = function(value)
        PlayerMods.FlyEnabled = value
        if value then
            enableFly()
            Window:Notify({Title = "Fly", Content = "Fly enabled - Use WASD + Space/Shift", Duration = 3, Type = "Success"})
        else
            disableFly()
            Window:Notify({Title = "Fly", Content = "Fly disabled", Duration = 2, Type = "Info"})
        end
    end
})

PlayerSection:AddSlider({
    Text = "Fly Speed",
    Min = 10,
    Max = 500,
    Default = 100,
    Callback = function(value)
        PlayerMods.FlySpeed = value
    end
})

-- Fly input handling
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe or not PlayerMods.FlyEnabled then return end
    if input.KeyCode == Enum.KeyCode.W then PlayerMods.MoveVector = PlayerMods.MoveVector + Vector3.new(0, 0, 1) end
    if input.KeyCode == Enum.KeyCode.S then PlayerMods.MoveVector = PlayerMods.MoveVector + Vector3.new(0, 0, -1) end
    if input.KeyCode == Enum.KeyCode.A then PlayerMods.MoveVector = PlayerMods.MoveVector + Vector3.new(-1, 0, 0) end
    if input.KeyCode == Enum.KeyCode.D then PlayerMods.MoveVector = PlayerMods.MoveVector + Vector3.new(1, 0, 0) end
    if input.KeyCode == Enum.KeyCode.Space then PlayerMods.MoveVector = PlayerMods.MoveVector + Vector3.new(0, 1, 0) end
    if input.KeyCode == Enum.KeyCode.LeftShift then PlayerMods.MoveVector = PlayerMods.MoveVector + Vector3.new(0, -1, 0) end
end)

UserInputService.InputEnded:Connect(function(input)
    if not PlayerMods.FlyEnabled then return end
    if input.KeyCode == Enum.KeyCode.W then PlayerMods.MoveVector = PlayerMods.MoveVector - Vector3.new(0, 0, 1) end
    if input.KeyCode == Enum.KeyCode.S then PlayerMods.MoveVector = PlayerMods.MoveVector - Vector3.new(0, 0, -1) end
    if input.KeyCode == Enum.KeyCode.A then PlayerMods.MoveVector = PlayerMods.MoveVector - Vector3.new(-1, 0, 0) end
    if input.KeyCode == Enum.KeyCode.D then PlayerMods.MoveVector = PlayerMods.MoveVector - Vector3.new(1, 0, 0) end
    if input.KeyCode == Enum.KeyCode.Space then PlayerMods.MoveVector = PlayerMods.MoveVector - Vector3.new(0, 1, 0) end
    if input.KeyCode == Enum.KeyCode.LeftShift then PlayerMods.MoveVector = PlayerMods.MoveVector - Vector3.new(0, -1, 0) end
end)

RunService.RenderStepped:Connect(function()
    if not PlayerMods.FlyEnabled or not PlayerMods.FlyVelocity then return end
    local hrp = getHRP()
    if not hrp then return end
    
    local camCFrame = camera.CFrame
    local moveDir = (camCFrame.RightVector * PlayerMods.MoveVector.X) + (camCFrame.UpVector * PlayerMods.MoveVector.Y) + (camCFrame.LookVector * PlayerMods.MoveVector.Z)
    if moveDir.Magnitude > 0 then moveDir = moveDir.Unit else moveDir = Vector3.zero end
    
    PlayerMods.FlyVelocity.Velocity = moveDir * PlayerMods.FlySpeed
    PlayerMods.FlyGyro.CFrame = CFrame.new(hrp.Position, hrp.Position + camCFrame.LookVector)
end)

-- Infinite Jump
PlayerSection:AddToggle({
    Text = "Infinite Jump",
    Default = false,
    Callback = function(value)
        PlayerMods.InfiniteJumpEnabled = value
        Window:Notify({
            Title = "Infinite Jump",
            Content = value and "Infinite Jump enabled" or "Infinite Jump disabled",
            Duration = 2,
            Type = value and "Success" or "Info"
        })
    end
})

UserInputService.JumpRequest:Connect(function()
    if not PlayerMods.InfiniteJumpEnabled then return end
    local char = player.Character
    local humanoid = char and char:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    local state = humanoid:GetState()
    if state == Enum.HumanoidStateType.Seated or state == Enum.HumanoidStateType.PlatformStanding then return end
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)

PlayerSection:AddSlider({
    Text = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(value)
        local char = player.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        if humanoid then humanoid.WalkSpeed = value end
    end
})

PlayerSection:AddSlider({
    Text = "JumpPower",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(value)
        local char = player.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        if humanoid then humanoid.JumpPower = value end
    end
})

--==============================================================================
-- EXTRAS TAB
--==============================================================================
local ExtrasTab = Window:AddTab("Extras", "rbxassetid://6031229348")

local ExtrasSection = ExtrasTab:AddSection("Features")

ExtrasSection:AddButton({
    Text = "Server Invisibility",
    Callback = function()
        Window:Notify({Title = "Loading", Content = "Loading Server Invisibility...", Duration = 2, Type = "Loading"})
        local url = 'https://pastebin.com/raw/5dQ40eZG'
        local ok, code = pcall(function() return game:HttpGet(url) end)
        if ok and code then
            local success, err = pcall(loadstring(code))
            if success then
                Window:Notify({Title = "Server Invis", Content = "Loaded successfully!", Duration = 3, Type = "Success"})
            else
                Window:Notify({Title = "Error", Content = tostring(err), Duration = 5, Type = "Error"})
            end
        else
            Window:Notify({Title = "Error", Content = "Failed to fetch script", Duration = 3, Type = "Error"})
        end
    end
})

ExtrasSection:AddToggle({
    Text = "Barbarian Autofarm (Steal Food)",
    Default = false,
    Callback = function(value)
        Autofarm.BarbEnabled = value
        Window:Notify({
            Title = "Barb Autofarm",
            Content = value and "Autofarm enabled - Stealing food" or "Autofarm disabled",
            Duration = 2,
            Type = value and "Success" or "Info"
        })
        if value then
            task.spawn(function()
                while Autofarm.BarbEnabled do
                    local char = player.Character
                    if char then
                        local tool = char:FindFirstChild("steal food") or (player.Backpack and player.Backpack:FindFirstChild("steal food"))
                        if tool then
                            if tool.Parent == player.Backpack then
                                tool.Parent = char
                            end
                            tool:Activate()
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

local AutoteamSection = ExtrasTab:AddSection("Autoteam")

AutoteamSection:AddDropdown({
    Text = "Select Team",
    Options = {"None", "Barbarian", "Peasant", "Civilian"},
    Default = "None",
    Callback = function(value)
        Autofarm.AutoteamRole = value
        if value ~= "None" then
            Window:Notify({Title = "Autoteam", Content = "Selected team: " .. value, Duration = 2, Type = "Info"})
        end
    end
})

AutoteamSection:AddToggle({
    Text = "Auto Join Team",
    Default = false,
    Callback = function(value)
        Autofarm.AutoteamEnabled = value
        if value then
            if Autofarm.AutoteamRole == "None" then
                Window:Notify({Title = "Autoteam", Content = "Please select a team first!", Duration = 3, Type = "Warning"})
                return
            end
            Window:Notify({Title = "Autoteam", Content = "Auto-joining " .. Autofarm.AutoteamRole, Duration = 2, Type = "Success"})
        else
            Window:Notify({Title = "Autoteam", Content = "Auto join disabled", Duration = 2, Type = "Info"})
        end
        if value and Autofarm.AutoteamRole ~= "None" then
            task.spawn(function()
                while Autofarm.AutoteamEnabled and player.Team and player.Team.Name == "Spectating" do
                    local rolePaths = {
                        Barbarian = "workspace.SpawnArea.Spawns.BarbarianSpawn.BarbarianNPC.BarbarianTP",
                        Peasant = "workspace.SpawnArea.Spawns.PeasantSpawn.PeasantNPC.PeasantTP",
                        Civilian = "workspace.SpawnArea.Spawns.CivilianSpawn.CivilianNPC.CivilianTP"
                    }
                    local path = rolePaths[Autofarm.AutoteamRole]
                    if path then
                        local parts = string.split(path, ".")
                        local current = game
                        for _, part in ipairs(parts) do
                            if part == "workspace" then current = Workspace
                            else current = current:FindFirstChild(part) end
                            if not current then break end
                        end
                        if current and current:IsA("BasePart") then
                            teleportTo(current.Position + Vector3.new(0, 3, 0))
                            local prompt = current:FindFirstChild("ProximityPrompt")
                            if prompt then
                                fireproximityprompt(prompt)
                            end
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    end
})

--==============================================================================
-- AUTO BUY TAB
--==============================================================================
local AutoBuyTab = Window:AddTab("Auto Buy", "rbxassetid://6034684930")

local FoodSection = AutoBuyTab:AddSection("Food Shop")

local foodSeats = {"1", "2", "3"}
for _, seat in ipairs(foodSeats) do
    FoodSection:AddButton({
        Text = "Food Seat " .. seat,
        Callback = function()
            local seatObj = Workspace:FindFirstChild("Stores") and Workspace.Stores:FindFirstChild("Food") and Workspace.Stores.Food:FindFirstChild("CustomerSeats") and Workspace.Stores.Food.CustomerSeats:FindFirstChild(seat)
            if seatObj then teleportTo(seatObj.Position + Vector3.new(0, 5, 0)) end
        end
    })
end

local DoctorSection = AutoBuyTab:AddSection("Doctor Shop")

for _, seat in ipairs(foodSeats) do
    DoctorSection:AddButton({
        Text = "Doctor Seat " .. seat,
        Callback = function()
            local seatObj = Workspace:FindFirstChild("Stores") and Workspace.Stores:FindFirstChild("Doctor") and Workspace.Stores.Doctor:FindFirstChild("CustomerSeats") and Workspace.Stores.Doctor.CustomerSeats:FindFirstChild(seat)
            if seatObj then teleportTo(seatObj.Position + Vector3.new(0, 5, 0)) end
        end
    })
end

local FishingSection = AutoBuyTab:AddSection("Fishing Net Shop")

for _, seat in ipairs(foodSeats) do
    FishingSection:AddButton({
        Text = "Fishing Seat " .. seat,
        Callback = function()
            local seatObj = Workspace:FindFirstChild("Stores") and Workspace.Stores:FindFirstChild("FishingNet") and Workspace.Stores.FishingNet:FindFirstChild("CustomerSeats") and Workspace.Stores.FishingNet.CustomerSeats:FindFirstChild(seat)
            if seatObj then teleportTo(seatObj.Position + Vector3.new(0, 5, 0)) end
        end
    })
end

local AxeSection = AutoBuyTab:AddSection("Axe Shop")

for _, seat in ipairs(foodSeats) do
    AxeSection:AddButton({
        Text = "Axe Seat " .. seat,
        Callback = function()
            local seatObj = Workspace:FindFirstChild("Stores") and Workspace.Stores:FindFirstChild("Axe") and Workspace.Stores.Axe:FindFirstChild("CustomerSeats") and Workspace.Stores.Axe.CustomerSeats:FindFirstChild(seat)
            if seatObj then teleportTo(seatObj.Position + Vector3.new(0, 5, 0)) end
        end
    })
end

local BarbSection = AutoBuyTab:AddSection("Barb Shops")

BarbSection:AddButton({
    Text = "Bow Shop",
    Callback = function()
        local seatObj = Workspace:FindFirstChild("BarbStores") and Workspace.BarbStores:FindFirstChild("Bow") and Workspace.BarbStores.Bow:FindFirstChild("CustomerSeat")
        if seatObj then teleportTo(seatObj.Position + Vector3.new(0, 5, 0)) end
    end
})

BarbSection:AddButton({
    Text = "Bomb Shop",
    Callback = function()
        local seatObj = Workspace:FindFirstChild("BarbStores") and Workspace.BarbStores:FindFirstChild("Bomb") and Workspace.BarbStores.Bomb:FindFirstChild("CustomerSeat")
        if seatObj then teleportTo(seatObj.Position + Vector3.new(0, 5, 0)) end
    end
})

--==============================================================================
-- SETTINGS TAB
--==============================================================================
local SettingsTab = Window:AddTab("Settings", "rbxassetid://6031280882")

local ThemeSection = SettingsTab:AddSection("Theme")

ThemeSection:AddDropdown({
    Text = "Theme Presets",
    Options = {"Default", "Ocean", "Midnight", "Forest", "Crimson", "Rose", "Sunset", "Aqua", "Neon", "Dark"},
    Default = "Default",
    Callback = function(val)
        Library.ThemeManager:ApplyPreset(val)
    end
})

ThemeSection:AddColorPicker({
    Text = "Accent Color",
    Default = Color3.fromRGB(0, 170, 255),
    Callback = function(color)
        Library.ThemeManager:SetTheme({ Accent = color })
    end
})

ThemeSection:AddToggle({
    Text = "Rainbow Mode",
    Default = false,
    Callback = function(val)
        if val then
            Library.ThemeManager:StartRainbow()
        end
    end
})

local ConfigSection = SettingsTab:AddSection("Configuration")

ConfigSection:AddKeybind({
    Text = "Toggle UI",
    Default = Enum.KeyCode.K,
    Callback = function()
        Window:Toggle(not Window.IsOpen)
    end
})

ConfigSection:AddButton({
    Text = "Unload UI",
    Callback = function()
        Window:Unload()
    end
})

--==============================================================================
-- CREDITS TAB
--==============================================================================
local CreditsTab = Window:AddTab("Credits", "rbxassetid://6031225819")

local CreditsSection = CreditsTab:AddSection("Info")

CreditsSection:AddButton({
    Text = "Script made by alex",
    Callback = function() end
})

CreditsSection:AddButton({
    Text = "Copy Discord Link",
    Callback = function()
        if setclipboard then
            setclipboard("discord.gg/rYbnn63Whv")
            Library.Notifications:Notify({Title = "Copied!", Content = "Discord link copied to clipboard", Duration = 2})
        end
    end
})

CreditsSection:AddButton({
    Text = "UI Library: Premium Hub",
    Callback = function() end
})
