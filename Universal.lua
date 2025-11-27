--[[
    Premium Glassmorphism UI Library + Example (V8 Compatibility)
    Universal Script
]]

local LibraryBundle = function()
    local Library = {}
    local modules = {}

    local function LoadModule(name)
        if not modules[name] then return nil end
        if modules[name].cached then return modules[name].cached end
        
        local moduleFn = modules[name].fn
        local result = moduleFn()
        modules[name].cached = result
        return result
    end

modules["Compatibility"] = {
    fn = function()
        local Compatibility = {}

local testOrder = {"UNC", "sUNC", "FileIO", "Networking", "Replication"}

local testMatrix = {
    UNC = {
        {
            id = "getgenv",
            label = "getgenv / getrenv",
            check = function()
                return type(getgenv) == "function" and type(getrenv) == "function"
            end
        },
        {
            id = "debug",
            label = "debug library",
            check = function()
                return type(debug) == "table" and type(debug.getupvalues) == "function"
            end
        },
        {
            id = "hookfunction",
            label = "hookfunction",
            check = function()
                return type(hookfunction) == "function"
            end
        },
        {
            id = "newcclosure",
            label = "newcclosure",
            check = function()
                return type(newcclosure) == "function"
            end
        }
    },
    sUNC = {
        {
            id = "syn_table",
            label = "syn table",
            check = function()
                return type(syn) == "table"
            end
        },
        {
            id = "protect_gui",
            label = "syn.protect_gui",
            check = function()
                return type(syn) == "table" and type(syn.protect_gui) == "function"
            end
        },
        {
            id = "secure_call",
            label = "secure_call",
            check = function()
                if type(syn) == "table" and type(syn.secure_call) == "function" then
                    return true
                end
                return type(secure_call) == "function"
            end
        },
        {
            id = "queue_on_teleport",
            label = "queue_on_teleport",
            check = function()
                if type(queue_on_teleport) == "function" or type(queueteleport) == "function" then
                    return true
                end
                return type(syn) == "table" and type(syn.queue_on_teleport) == "function"
            end
        },
        {
            id = "setidentity",
            label = "setthreadidentity",
            check = function()
                if type(setthreadidentity) == "function" or type(setidentity) == "function" then
                    return true
                end
                return type(syn) == "table" and type(syn.set_thread_identity) == "function"
            end
        }
    },
    FileIO = {
        {
            id = "writefile",
            label = "writefile/readfile",
            check = function()
                return type(writefile) == "function" and type(readfile) == "function"
            end
        },
        {
            id = "folders",
            label = "makefolder/isfolder",
            check = function()
                return type(makefolder) == "function"
            end
        }
    },
    Networking = {
        {
            id = "http_request",
            label = "http_request",
            check = function()
                if type(http_request) == "function" or type(request) == "function" then
                    return true
                end
                return type(syn) == "table" and type(syn.request) == "function"
            end
        },
        {
            id = "websocket",
            label = "websocket support",
            check = function()
                if type(websocket) == "table" and type(websocket.connect) == "function" then
                    return true
                end
                return type(syn) == "table" and type(syn.websocket) == "table"
            end
        }
    },
    Replication = {
        {
            id = "replicatesingle",
            label = "replicate_single",
            check = function()
                return type(replicate_single) == "function" or type(replicatesingle) == "function"
            end
        },
        {
            id = "desync",
            label = "server desync hooks",
            check = function()
                if type(syn) ~= "table" then
                    return false
                end
                return type(syn.start_desync) == "function" or type(syn.toggle_desync) == "function"
            end
        }
    }
}

Compatibility.SUNCSources = {}
Compatibility.LastReport = nil

local function runTest(fn)
    local ok, result = pcall(fn)
    if not ok then
        return false, result
    end
    return result and true or false, nil
end

function Compatibility:Check(onStep)
    local report = {
        Executor = (identifyexecutor and identifyexecutor())
            or (getexecutorname and getexecutorname())
            or "Unknown",
        Timestamp = os.time(),
        Tests = {}
    }
    
    local totalTests = 0
    for _, category in ipairs(testOrder) do
        local tests = testMatrix[category]
        if tests then
            totalTests += #tests
        end
    end
    totalTests = math.max(totalTests, 1)
    
    local completed = 0
    for _, category in ipairs(testOrder) do
        local tests = testMatrix[category]
        if tests and #tests > 0 then
            local group = {
                Items = {},
                Passed = 0,
                Total = #tests,
                AllPassed = false
            }
            
            for _, test in ipairs(tests) do
                local label = string.format("[%s] %s", category, test.label)
                local passed, err = runTest(test.check)
                completed += 1
                
                if type(onStep) == "function" then
                    onStep({
                        Category = category,
                        Id = test.id,
                        Label = label,
                        Progress = completed / totalTests,
                        Passed = passed
                    })
                end
                
                if passed then
                    group.Passed += 1
                end
                
                table.insert(group.Items, {
                    Id = test.id,
                    Name = test.label,
                    Passed = passed,
                    Error = err
                })
            end
            
            group.AllPassed = group.Passed == group.Total
            report.Tests[category] = group
        end
    end
    
    report.UNC = report.Tests.UNC and report.Tests.UNC.AllPassed or false
    report.sUNC = report.Tests.sUNC and report.Tests.sUNC.AllPassed or false
    report.FileIO = report.Tests.FileIO and report.Tests.FileIO.AllPassed or false
    report.Networking = report.Tests.Networking and report.Tests.Networking.AllPassed or false
    report.Replication = report.Tests.Replication and report.Tests.Replication.AllPassed or false
    report.Completed = os.time()
    Compatibility.LastReport = report
    return report
end

function Compatibility:GetReportLines(report)
    report = report or self.LastReport
    if not report then
        return {"No compatibility data yet."}
    end
    
    local lines = {
        string.format("Executor: %s", report.Executor)
    }
    
    for _, category in ipairs(testOrder) do
        local group = report.Tests[category]
        if group then
            local state = group.AllPassed and "PASS" or "FAIL"
            table.insert(lines, string.format("%s: %s (%d/%d)", category, state, group.Passed, group.Total))
        end
    end
    
    return lines
end

function Compatibility:SetSUNCSources(sources)
    if type(sources) == "string" then
        self.SUNCSources = {sources}
        return
    end
    if type(sources) == "table" then
        self.SUNCSources = sources
    end
end

function Compatibility:RunSUNC(customUrl)
    local urls = {}
    
    if type(customUrl) == "string" then
        table.insert(urls, customUrl)
    end
    
    for _, url in ipairs(self.SUNCSources) do
        table.insert(urls, url)
    end
    
    if #urls == 0 then
        return false, "No sUNC URLs configured."
    end
    
    for _, url in ipairs(urls) do
        local ok, body = pcall(function()
            return game:HttpGet(url)
        end)
        if ok and type(body) == "string" and #body > 0 then
            local executed, err = pcall(function()
                loadstring(body)()
            end)
            if executed then
                return true, url
            else
                warn(string.format("[Compatibility] sUNC script error (%s): %s", url, err))
            end
        else
            warn(string.format("[Compatibility] Unable to fetch sUNC script from %s", url))
        end
    end
    
    return false, "All configured sUNC URLs failed."
end


        return Compatibility
    end
}

modules["Notifications"] = {
    fn = function()
        local Notifications = {}
local TweenService = game:GetService("TweenService")
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

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
    end
}

modules["ThemeManager"] = {
    fn = function()
        local ThemeManager = {}

ThemeManager.Theme = {
    Accent = Color3.fromRGB(0, 170, 255),
    Background = Color3.fromRGB(15, 15, 15),
    SectionBackground = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(255, 255, 255),
    SubText = Color3.fromRGB(170, 170, 170),
    Outline = Color3.fromRGB(40, 40, 40),
    Hover = Color3.fromRGB(35, 35, 35),
    Shadow = Color3.fromRGB(0, 0, 0),
    Font = Enum.Font.Gotham,
    FontBold = Enum.Font.GothamBold
}

ThemeManager.AnimationSpeed = 0.4
ThemeManager.ThemeUpdate = Instance.new("BindableEvent") -- V8: Live Updates

ThemeManager.Presets = {
    Default = {
        Accent = Color3.fromRGB(0, 170, 255),
        Background = Color3.fromRGB(15, 15, 15),
        SectionBackground = Color3.fromRGB(25, 25, 25),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(170, 170, 170),
        Outline = Color3.fromRGB(40, 40, 40),
        Hover = Color3.fromRGB(35, 35, 35)
    },
    Ocean = {
        Accent = Color3.fromRGB(0, 200, 255),
        Background = Color3.fromRGB(8, 18, 28),
        SectionBackground = Color3.fromRGB(15, 30, 45),
        Text = Color3.fromRGB(220, 240, 255),
        SubText = Color3.fromRGB(100, 160, 200),
        Outline = Color3.fromRGB(30, 60, 80),
        Hover = Color3.fromRGB(20, 45, 65)
    },
    Midnight = {
        Accent = Color3.fromRGB(160, 100, 255),
        Background = Color3.fromRGB(12, 10, 20),
        SectionBackground = Color3.fromRGB(22, 18, 35),
        Text = Color3.fromRGB(240, 230, 255),
        SubText = Color3.fromRGB(150, 130, 180),
        Outline = Color3.fromRGB(50, 40, 70),
        Hover = Color3.fromRGB(35, 28, 55)
    },
    Forest = {
        Accent = Color3.fromRGB(80, 220, 120),
        Background = Color3.fromRGB(10, 18, 12),
        SectionBackground = Color3.fromRGB(18, 30, 22),
        Text = Color3.fromRGB(220, 255, 230),
        SubText = Color3.fromRGB(120, 180, 140),
        Outline = Color3.fromRGB(35, 55, 40),
        Hover = Color3.fromRGB(25, 45, 30)
    },
    Crimson = {
        Accent = Color3.fromRGB(255, 60, 80),
        Background = Color3.fromRGB(20, 10, 12),
        SectionBackground = Color3.fromRGB(35, 18, 22),
        Text = Color3.fromRGB(255, 230, 235),
        SubText = Color3.fromRGB(200, 130, 140),
        Outline = Color3.fromRGB(60, 35, 40),
        Hover = Color3.fromRGB(50, 25, 30)
    },
    Rose = {
        Accent = Color3.fromRGB(255, 100, 150),
        Background = Color3.fromRGB(18, 10, 15),
        SectionBackground = Color3.fromRGB(30, 18, 25),
        Text = Color3.fromRGB(255, 235, 245),
        SubText = Color3.fromRGB(200, 150, 170),
        Outline = Color3.fromRGB(55, 35, 45),
        Hover = Color3.fromRGB(45, 25, 35)
    },
    Sunset = {
        Accent = Color3.fromRGB(255, 140, 50),
        Background = Color3.fromRGB(20, 12, 8),
        SectionBackground = Color3.fromRGB(35, 22, 15),
        Text = Color3.fromRGB(255, 245, 230),
        SubText = Color3.fromRGB(200, 160, 120),
        Outline = Color3.fromRGB(60, 40, 25),
        Hover = Color3.fromRGB(50, 32, 18)
    },
    Aqua = {
        Accent = Color3.fromRGB(0, 255, 200),
        Background = Color3.fromRGB(8, 15, 15),
        SectionBackground = Color3.fromRGB(15, 28, 28),
        Text = Color3.fromRGB(220, 255, 250),
        SubText = Color3.fromRGB(100, 180, 170),
        Outline = Color3.fromRGB(25, 50, 48),
        Hover = Color3.fromRGB(18, 40, 38)
    },
    Neon = {
        Accent = Color3.fromRGB(0, 255, 100),
        Background = Color3.fromRGB(5, 5, 8),
        SectionBackground = Color3.fromRGB(10, 12, 18),
        Text = Color3.fromRGB(200, 255, 220),
        SubText = Color3.fromRGB(100, 200, 140),
        Outline = Color3.fromRGB(20, 40, 30),
        Hover = Color3.fromRGB(15, 30, 22)
    },
    Dark = {
        Accent = Color3.fromRGB(100, 100, 100),
        Background = Color3.fromRGB(8, 8, 8),
        SectionBackground = Color3.fromRGB(15, 15, 15),
        Text = Color3.fromRGB(200, 200, 200),
        SubText = Color3.fromRGB(120, 120, 120),
        Outline = Color3.fromRGB(30, 30, 30),
        Hover = Color3.fromRGB(22, 22, 22)
    }
}

function ThemeManager:ApplyPreset(name)
    if self.Presets[name] then
        self:SetTheme(self.Presets[name])
    end
end

function ThemeManager:StartRainbow()
    local RunService = game:GetService("RunService")
    local hue = 0
    RunService.Heartbeat:Connect(function(dt)
        hue = hue + (dt * 0.1)
        if hue > 1 then hue = 0 end
        self:SetTheme({ Accent = Color3.fromHSV(hue, 0.8, 1) }) -- V8: Use SetTheme to trigger update
    end)
end

function ThemeManager:SetTheme(newTheme)
    local changed = false
    for key, value in pairs(newTheme) do
        if self.Theme[key] ~= value then
            self.Theme[key] = value
            changed = true
        end
    end
    if changed then
        self.ThemeUpdate:Fire()
    end
end

function ThemeManager:GetColor(colorName)
    return self.Theme[colorName] or Color3.new(1, 1, 1)
end


        return ThemeManager
    end
}

modules["SaveManager"] = {
    fn = function()
        local SaveManager = {}
local HttpService = game:GetService("HttpService")

local function encodeValue(value)
    local valueType = typeof(value)
    if valueType == "UDim2" then
        return {
            __type = "UDim2",
            X = {Scale = value.X.Scale, Offset = value.X.Offset},
            Y = {Scale = value.Y.Scale, Offset = value.Y.Offset}
        }
    elseif valueType == "Color3" then
        return {
            __type = "Color3",
            R = value.R,
            G = value.G,
            B = value.B
        }
    elseif valueType == "EnumItem" then
        local enumType = tostring(value.EnumType):gsub("Enum%.", "")
        return {
            __type = "EnumItem",
            EnumType = enumType,
            Name = value.Name
        }
    elseif valueType == "table" then
        local encoded = {}
        for key, item in pairs(value) do
            encoded[key] = encodeValue(item)
        end
        return encoded
    end
    return value
end

local function decodeValue(value)
    if typeof(value) ~= "table" then
        return value
    end
    
    if value.__type == "UDim2" then
        local X = value.X or {}
        local Y = value.Y or {}
        return UDim2.new(X.Scale or 0, X.Offset or 0, Y.Scale or 0, Y.Offset or 0)
    elseif value.__type == "Color3" then
        return Color3.new(value.R or 0, value.G or 0, value.B or 0)
    elseif value.__type == "EnumItem" then
        local enumType = value.EnumType
        local enumName = value.Name
        if enumType and enumName and Enum[enumType] and Enum[enumType][enumName] then
            return Enum[enumType][enumName]
        end
        return enumName
    end
    
    local decoded = {}
    for key, item in pairs(value) do
        decoded[key] = decodeValue(item)
    end
    return decoded
end

function SaveManager:_ensureFolder()
    if not self.Folder or self.Folder == "" then
        return
    end
    if type(makefolder) ~= "function" then
        return
    end
    pcall(function()
        if type(isfolder) == "function" then
            local ok, exists = pcall(isfolder, self.Folder)
            if ok and exists then
                return
            end
        end
        makefolder(self.Folder)
    end)
end

function SaveManager:_resolvePath(fileName)
    if self.Folder and self.Folder ~= "" then
        self:_ensureFolder()
        return self.Folder .. "/" .. fileName
    end
    return fileName
end

function SaveManager:_exists(path)
    if type(isfile) == "function" then
        local ok, exists = pcall(isfile, path)
        if ok then
            return exists
        end
    end
    if type(readfile) == "function" then
        local ok = pcall(readfile, path)
        return ok
    end
    return false
end

function SaveManager:_writeJson(filename, data)
    if type(writefile) ~= "function" then
        return false, "writefile is not available."
    end
    local ok, json = pcall(HttpService.JSONEncode, HttpService, encodeValue(data or {}))
    if not ok then
        return false, json
    end
    local path = self:_resolvePath(filename)
    local success, err = pcall(writefile, path, json)
    return success, err
end

function SaveManager:_readJson(filename)
    if type(readfile) ~= "function" then
        return nil, "readfile is not available."
    end
    local path = self:_resolvePath(filename)
    if not self:_exists(path) then
        return nil, "file does not exist"
    end
    local ok, contents = pcall(readfile, path)
    if not ok then
        return nil, contents
    end
    local success, data = pcall(HttpService.JSONDecode, HttpService, contents)
    if not success then
        return nil, data
    end
    return decodeValue(data), nil
end

function SaveManager:HasFileIO()
    return type(writefile) == "function" and type(readfile) == "function"
end

function SaveManager:Init(folder)
    if folder then
        self.Folder = tostring(folder)
    end
    self:_ensureFolder()
end

function SaveManager:Save(name, data)
    local fileName = string.format("%s.json", name or "Config")
    return self:_writeJson(fileName, data)
end

function SaveManager:Load(name)
    local fileName = string.format("%s.json", name or "Config")
    return self:_readJson(fileName)
end

function SaveManager:SaveLayout(name, positions)
    local fileName = string.format("%s_Layout.json", name or "Layout")
    return self:_writeJson(fileName, positions)
end

function SaveManager:LoadLayout(name)
    local fileName = string.format("%s_Layout.json", name or "Layout")
    return self:_readJson(fileName)
end


        return SaveManager
    end
}

modules["ColorPicker"] = {
    fn = function()
        local ColorPicker = {}
local UserInputService = game:GetService("UserInputService")
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

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
    end
}

modules["KeybindList"] = {
    fn = function()
        local KeybindList = {}
local UserInputService = game:GetService("UserInputService")
local ThemeManager = LoadModule("ThemeManager")
local Utility = LoadModule("Utility")
local SaveManager = LoadModule("SaveManager")

local listFrame = nil
local container = nil

local function toUDim2(value)
    if typeof(value) == "UDim2" then
        return value
    end
    if typeof(value) == "table" and value.X and value.Y then
        return UDim2.new(
            value.X.Scale or 0,
            value.X.Offset or 0,
            value.Y.Scale or 0,
            value.Y.Offset or 0
        )
    end
    return nil
end

function KeybindList:Init(gui)
    listFrame = Instance.new("Frame")
    listFrame.Name = "KeybindList"
    listFrame.Size = UDim2.new(0, 180, 0, 30) -- Auto resizing
    listFrame.Position = UDim2.new(0, 10, 0.5, -100)
    listFrame.BackgroundColor3 = ThemeManager.Theme.Background
    listFrame.BorderSizePixel = 0
    listFrame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = listFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = listFrame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = "Keybinds"
    title.TextColor3 = ThemeManager.Theme.Accent
    title.Font = ThemeManager.Theme.FontBold
    title.TextSize = 14
    title.Parent = listFrame
    
    local dragInfo = Instance.new("Frame")
    dragInfo.Size = UDim2.new(1,0,0,25)
    dragInfo.BackgroundTransparency = 1
    dragInfo.Parent = listFrame
    Utility:EnableDragging(listFrame, dragInfo)
    Utility:AddShadow(listFrame, 20)
    
    container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 0)
    container.Position = UDim2.new(0, 0, 0, 25)
    container.BackgroundTransparency = 1
    container.Parent = listFrame
    
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = container
    
    -- Hide if empty logic
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local height = layout.AbsoluteContentSize.Y
        if height == 0 then
            listFrame.Visible = false
        else
            listFrame.Visible = true
            listFrame.Size = UDim2.new(0, 180, 0, height + 30)
        end
    end)
    
    -- Restore Position
    local layoutData = SaveManager:LoadLayout("PremiumHub")
    if layoutData and layoutData.KeybindList then
        local pos = toUDim2(layoutData.KeybindList)
        if pos then
            listFrame.Position = pos
        end
    end
end

function KeybindList:Add(name, state)
    if not container then return end
    
    local entry = Instance.new("Frame")
    entry.Name = name
    entry.Size = UDim2.new(1, 0, 0, 20)
    entry.BackgroundTransparency = 1
    entry.Parent = container
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(0.7, -5, 1, 0)
    nameLabel.Position = UDim2.new(0, 5, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = ThemeManager.Theme.Text
    nameLabel.Font = ThemeManager.Theme.Font
    nameLabel.TextSize = 12
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = entry
    
    local stateLabel = Instance.new("TextLabel")
    stateLabel.Size = UDim2.new(0.3, -5, 1, 0)
    stateLabel.Position = UDim2.new(0.7, 0, 0, 0)
    stateLabel.BackgroundTransparency = 1
    stateLabel.Text = "[Active]"
    stateLabel.TextColor3 = ThemeManager.Theme.SubText
    stateLabel.Font = ThemeManager.Theme.Font
    stateLabel.TextSize = 12
    stateLabel.TextXAlignment = Enum.TextXAlignment.Right
    stateLabel.Parent = entry
    
    return {
        SetVisible = function(self, val)
            entry.Visible = val
            if val then
                entry.Parent = container -- Force re-sort
            end
        end,
        UpdateState = function(self, txt)
            stateLabel.Text = txt
        end
    }
end

function KeybindList:GetPosition()
    if listFrame then return listFrame.Position end
    return nil
end

function KeybindList:SetPosition(pos)
    if listFrame and typeof(pos) == "UDim2" then
        listFrame.Position = pos
    end
end


        return KeybindList
    end
}

modules["Particles"] = {
    fn = function()
        local Particles = {}
local RunService = game:GetService("RunService")
local ThemeManager = LoadModule("ThemeManager")

function Particles:Create(parent)
    local container = Instance.new("Frame")
    container.Name = "ParticlesContainer"
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.ZIndex = 1
    container.ClipsDescendants = true
    container.Parent = parent
    
    local particles = {}
    local lastSpawn = 0
    local spawnRate = 0.5 -- Seconds between spawns
    
    -- Create a single particle
    local function spawnParticle()
        local size = math.random(2, 5)
        local p = Instance.new("Frame")
        p.Name = "Particle"
        p.Size = UDim2.new(0, size, 0, size)
        p.Position = UDim2.new(math.random(), 0, 1, 10) -- Start below
        p.BackgroundColor3 = ThemeManager.Theme.Accent
        p.BackgroundTransparency = 0.6
        p.BorderSizePixel = 0
        p.ZIndex = 1
        p.Parent = container
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = p
        
        local speed = math.random(20, 50) -- Pixels per second
        local sway = math.random(-10, 10) -- Horizontal sway
        
        table.insert(particles, {
            Instance = p,
            Speed = speed,
            Sway = sway,
            X = p.Position.X.Scale,
            Y = 1.1
        })
    end
    
    -- Update Loop
    RunService.Heartbeat:Connect(function(dt)
        -- Spawning
        lastSpawn = lastSpawn + dt
        if lastSpawn > spawnRate then
            if #particles < 30 then -- Limit count
                spawnParticle()
            end
            lastSpawn = 0
        end
        
        -- Movement
        for i = #particles, 1, -1 do
            local particle = particles[i]
            
            particle.Y = particle.Y - (particle.Speed * dt / parent.AbsoluteSize.Y)
            
            -- Simple Sway
            local time = tick()
            local xOffset = math.sin(time * 2 + particle.Speed) * (particle.Sway / parent.AbsoluteSize.X)
            
            particle.Instance.Position = UDim2.new(particle.X + xOffset, 0, particle.Y, 0)
            
            -- Dynamic Color Update (in case of Rainbow Mode)
            particle.Instance.BackgroundColor3 = ThemeManager.Theme.Accent
            
            if particle.Y < -0.1 then
                particle.Instance:Destroy()
                table.remove(particles, i)
            end
        end
    end)
end


        return Particles
    end
}

modules["Watermark"] = {
    fn = function()
        local Watermark = {}
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local ThemeManager = LoadModule("ThemeManager")
local Utility = LoadModule("Utility")
local SaveManager = LoadModule("SaveManager")

local watermarkFrame = nil

local function toUDim2(value)
    if typeof(value) == "UDim2" then
        return value
    end
    if typeof(value) == "table" and value.X and value.Y then
        return UDim2.new(
            value.X.Scale or 0,
            value.X.Offset or 0,
            value.Y.Scale or 0,
            value.Y.Offset or 0
        )
    end
    return nil
end

function Watermark:Init(gui)
    watermarkFrame = Instance.new("Frame")
    watermarkFrame.Name = "Watermark"
    watermarkFrame.Size = UDim2.new(0, 200, 0, 30)
    watermarkFrame.Position = UDim2.new(1, -210, 0, 10)
    watermarkFrame.BackgroundColor3 = ThemeManager.Theme.Background
    watermarkFrame.BorderSizePixel = 0
    watermarkFrame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = watermarkFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = watermarkFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = ThemeManager.Theme.Text
    label.Font = ThemeManager.Theme.FontBold
    label.TextSize = 14
    label.Parent = watermarkFrame
    
    -- Add gradient to stroke
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, ThemeManager.Theme.Accent),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 150, 150))
    })
    gradient.Rotation = 45
    gradient.Parent = stroke
    
    Utility:AddShadow(watermarkFrame, 20)
    
    -- Draggable
    local dragInfo = Instance.new("Frame")
    dragInfo.Size = UDim2.new(1,0,1,0)
    dragInfo.BackgroundTransparency = 1
    dragInfo.Parent = watermarkFrame
    Utility:EnableDragging(watermarkFrame, dragInfo)
    
    -- Restore Position
    local layout = SaveManager:LoadLayout("PremiumHub")
    if layout and layout.Watermark then
        local pos = toUDim2(layout.Watermark)
        if pos then
            watermarkFrame.Position = pos
        end
    end
    
    -- Update Stats
    RunService.Heartbeat:Connect(function()
        local fps = math.floor(1 / RunService.Heartbeat:Wait())
        local ping = 0
        pcall(function()
             ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        label.Text = string.format("FPS: %d  |  Ping: %d ms", fps, ping)
    end)
end

function Watermark:GetPosition()
    if watermarkFrame then return watermarkFrame.Position end
    return nil
end

function Watermark:SetPosition(pos)
    if watermarkFrame and typeof(pos) == "UDim2" then
        watermarkFrame.Position = pos
    end
end


        return Watermark
    end
}

modules["Dropdown"] = {
    fn = function()
        local Dropdown = {}
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

function Dropdown.new(options, section)
    options = options or {}
    local text = options.Text or "Dropdown"
    local items = options.Options or {}
    local default = options.Default or items[1]
    local callback = options.Callback or function() end
    
    local isOpen = false
    local current = default
    
    local frame = Instance.new("Frame")
    frame.Name = "Dropdown"
    frame.Size = UDim2.new(1, 0, 0, 45) -- Collapsed height
    frame.BackgroundTransparency = 1
    frame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local mainButton = Instance.new("TextButton")
    mainButton.Name = "MainButton"
    mainButton.Size = UDim2.new(1, -20, 0, 25)
    mainButton.Position = UDim2.new(0, 10, 0, 20)
    mainButton.BackgroundColor3 = ThemeManager.Theme.Background
    mainButton.Text = ""
    mainButton.AutoButtonColor = false
    mainButton.Parent = frame
    Utility:ThemeBind(mainButton, "BackgroundColor3", "Background")
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 4)
    mainCorner.Parent = mainButton
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = ThemeManager.Theme.Outline
    mainStroke.Thickness = 1
    mainStroke.Parent = mainButton
    Utility:ThemeBind(mainStroke, "Color", "Outline")
    
    local selectedLabel = Instance.new("TextLabel")
    selectedLabel.Size = UDim2.new(1, -25, 1, 0)
    selectedLabel.Position = UDim2.new(0, 5, 0, 0)
    selectedLabel.BackgroundTransparency = 1
    selectedLabel.Text = tostring(current)
    selectedLabel.Font = ThemeManager.Theme.Font
    selectedLabel.TextSize = 14
    selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
    selectedLabel.Parent = mainButton
    Utility:ThemeBind(selectedLabel, "TextColor3", "Text")
    
    local arrow = Instance.new("ImageLabel")
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -20, 0, 2.5)
    arrow.BackgroundTransparency = 1
    arrow.Image = "rbxassetid://6031091004" -- Chevron Down
    arrow.Parent = mainButton
    Utility:ThemeBind(arrow, "ImageColor3", "SubText")
    
    -- List Container
    local listFrame = Instance.new("Frame")
    listFrame.Name = "List"
    listFrame.Size = UDim2.new(1, -20, 0, 0)
    listFrame.Position = UDim2.new(0, 10, 0, 50)
    listFrame.BackgroundColor3 = ThemeManager.Theme.SectionBackground
    listFrame.BorderSizePixel = 0
    listFrame.ClipsDescendants = true
    listFrame.Visible = false
    listFrame.Parent = frame
    Utility:ThemeBind(listFrame, "BackgroundColor3", "SectionBackground")
    
    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 4)
    listCorner.Parent = listFrame
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 2)
    listLayout.Parent = listFrame
    
    local function updateList()
        -- Clear existing
        for _, child in pairs(listFrame:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        local count = 0
        for _, item in pairs(items) do
            count = count + 1
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 25)
            btn.BackgroundTransparency = 1
            btn.Text = "  " .. tostring(item)
            btn.Font = ThemeManager.Theme.Font
            btn.TextSize = 14
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Parent = listFrame
            
            if item == current then
                btn.TextColor3 = ThemeManager.Theme.Accent
            else
                btn.TextColor3 = ThemeManager.Theme.SubText
            end
            
            -- Dynamic list item coloring is hard with ThemeBind because they depend on state
            -- But we can try listening to ThemeUpdate here locally
            ThemeManager.ThemeUpdate.Event:Connect(function()
                if item == current then
                    btn.TextColor3 = ThemeManager.Theme.Accent
                else
                    btn.TextColor3 = ThemeManager.Theme.SubText
                end
            end)
            
            btn.MouseButton1Click:Connect(function()
                current = item
                selectedLabel.Text = tostring(current)
                isOpen = false
                -- Close animation logic would be here
                listFrame.Visible = false
                frame.Size = UDim2.new(1, 0, 0, 45)
                Utility:Tween(arrow, TweenInfo.new(0.2), {Rotation = 0})
                updateList() -- Re-render to update colors
                callback(current)
            end)
        end
        
        -- Calculate size
        local listHeight = math.min(count * 27, 150) -- Cap height
        return listHeight
    end
    
    mainButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        
        if isOpen then
            local height = updateList()
            listFrame.Visible = true
            frame.Size = UDim2.new(1, 0, 0, 45 + height + 5)
            listFrame.Size = UDim2.new(1, -20, 0, height)
            Utility:Tween(arrow, TweenInfo.new(0.2), {Rotation = 180})
        else
            listFrame.Visible = false
            frame.Size = UDim2.new(1, 0, 0, 45)
            Utility:Tween(arrow, TweenInfo.new(0.2), {Rotation = 0})
        end
    end)
    
    return {
        Frame = frame,
        SetValue = function(_, newVal)
            current = newVal
            selectedLabel.Text = tostring(current)
            callback(current)
        end
    }
end


        return Dropdown
    end
}

modules["Tooltips"] = {
    fn = function()
        local Tooltips = {}
local UserInputService = game:GetService("UserInputService")
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

local tooltipFrame = nil

function Tooltips:Init(gui)
    tooltipFrame = Instance.new("Frame")
    tooltipFrame.Name = "Tooltip"
    tooltipFrame.Size = UDim2.new(0, 100, 0, 25)
    tooltipFrame.BackgroundColor3 = ThemeManager.Theme.Background
    tooltipFrame.BorderSizePixel = 0
    tooltipFrame.Visible = false
    tooltipFrame.ZIndex = 100
    tooltipFrame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = tooltipFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = tooltipFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = ThemeManager.Theme.Text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 12
    label.Parent = tooltipFrame
    
    local function update()
        if tooltipFrame.Visible then
            local mouse = UserInputService:GetMouseLocation()
            tooltipFrame.Position = UDim2.new(0, mouse.X + 15, 0, mouse.Y + 15)
        end
    end
    
    UserInputService.InputChanged:Connect(update)
end

function Tooltips:Add(instance, text)
    instance.MouseEnter:Connect(function()
        if not tooltipFrame then return end
        local label = tooltipFrame:FindFirstChild("TextLabel")
        label.Text = text
        local size = game:GetService("TextService"):GetTextSize(text, 12, ThemeManager.Theme.Font, Vector2.new(200, 100))
        tooltipFrame.Size = UDim2.new(0, size.X + 10, 0, size.Y + 6)
        tooltipFrame.Visible = true
    end)
    
    instance.MouseLeave:Connect(function()
        if tooltipFrame then
            tooltipFrame.Visible = false
        end
    end)
end


        return Tooltips
    end
}

modules["Utility"] = {
    fn = function()
        local Utility = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ThemeManager = LoadModule("ThemeManager")

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
    end
}

modules["Acrylic"] = {
    fn = function()
        local Acrylic = {}
local ThemeManager = LoadModule("ThemeManager")

function Acrylic:CreateAcrylic()
    local Effect = {}
    
    function Effect:Enable(frame, transparency)
        if not frame then return end
        -- Low transparency = more visible color (0.1 = 90% visible)
        transparency = transparency or 0.1
        
        -- Create the core acrylic container
        local acrylicFrame = Instance.new("Frame")
        acrylicFrame.Name = "AcrylicFrame"
        acrylicFrame.Size = UDim2.new(1, 0, 1, 0)
        acrylicFrame.BackgroundColor3 = ThemeManager.Theme.Background
        acrylicFrame.BackgroundTransparency = transparency
        acrylicFrame.BorderSizePixel = 0
        acrylicFrame.ZIndex = 0
        acrylicFrame.Parent = frame
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = acrylicFrame
        
        -- Add a subtle noise overlay for texture
        local noise = Instance.new("ImageLabel")
        noise.Name = "Noise"
        noise.BackgroundTransparency = 1
        noise.Size = UDim2.new(1, 0, 1, 0)
        noise.Image = "rbxassetid://12975612867" -- Common noise texture
        noise.ImageTransparency = 0.97
        noise.ScaleType = Enum.ScaleType.Tile
        noise.TileSize = UDim2.new(0, 128, 0, 128)
        noise.ZIndex = 1
        noise.Parent = acrylicFrame
        
        local noiseCorner = Instance.new("UICorner")
        noiseCorner.CornerRadius = UDim.new(0, 10)
        noiseCorner.Parent = noise
        
        -- Listen for theme updates
        ThemeManager.ThemeUpdate.Event:Connect(function()
            acrylicFrame.BackgroundColor3 = ThemeManager.Theme.Background
        end)
        
        return acrylicFrame
    end
    
    return Effect
end


        return Acrylic
    end
}

modules["Library"] = {
    fn = function()
        local Library = {}
Library.Window = LoadModule("Window")
Library.Notifications = LoadModule("Notifications")
Library.SaveManager = LoadModule("SaveManager")
Library.ThemeManager = LoadModule("ThemeManager")
Library.Loader = LoadModule("Loader")
Library.Compatibility = LoadModule("Compatibility")
Library.Watermark = LoadModule("Watermark")
Library.KeybindList = LoadModule("KeybindList")


        return Library
    end
}

modules["Section"] = {
    fn = function()
        local Section = {}
local ThemeManager = LoadModule("ThemeManager")

function Section.new(title, tab)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Name = title .. "Section"
    sectionFrame.Size = UDim2.new(1, 0, 0, 30) -- Auto-resizing
    sectionFrame.BackgroundColor3 = ThemeManager.Theme.SectionBackground
    sectionFrame.BackgroundTransparency = 0.8
    sectionFrame.BorderSizePixel = 0
    sectionFrame.Parent = tab.Page
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = sectionFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = sectionFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 2)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = ThemeManager.Theme.Text
    titleLabel.Font = ThemeManager.Theme.FontBold
    titleLabel.TextSize = 12
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = sectionFrame
    
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(1, -10, 0, 0)
    container.Position = UDim2.new(0, 5, 0, 30)
    container.BackgroundTransparency = 1
    container.Parent = sectionFrame
    
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = container
    
    -- Auto-resize logic
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        container.Size = UDim2.new(1, -10, 0, layout.AbsoluteContentSize.Y)
        sectionFrame.Size = UDim2.new(1, 0, 0, layout.AbsoluteContentSize.Y + 40)
        -- Update Tab Page CanvasSize
        tab.Page.CanvasSize = UDim2.new(0, 0, 0, tab.Page.UIListLayout.AbsoluteContentSize.Y + 20)
    end)
    
    local SectionObj = {
        Container = container
    }
    
    -- Theme Update Listener
    ThemeManager.ThemeUpdate.Event:Connect(function()
        sectionFrame.BackgroundColor3 = ThemeManager.Theme.SectionBackground
        stroke.Color = ThemeManager.Theme.Outline
        titleLabel.TextColor3 = ThemeManager.Theme.Text
    end)
    
    -- Element Loaders
    function SectionObj:AddButton(options)
        return LoadModule("Button").new(options, SectionObj)
    end
    
    function SectionObj:AddToggle(options)
        return LoadModule("Toggle").new(options, SectionObj)
    end

    function SectionObj:AddSlider(options)
        return LoadModule("Slider").new(options, SectionObj)
    end
    
    function SectionObj:AddDropdown(options)
        return LoadModule("Dropdown").new(options, SectionObj)
    end

    function SectionObj:AddColorPicker(options)
        return LoadModule("ColorPicker").new(options, SectionObj)
    end

    function SectionObj:AddKeybind(options)
        return LoadModule("Keybind").new(options, SectionObj)
    end

    return SectionObj
end


        return Section
    end
}

modules["TextBox"] = {
    fn = function()
        local TextBox = {}
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

function TextBox.new(options, section)
    options = options or {}
    local text = options.Text or "TextBox"
    local placeholder = options.Placeholder or "Input..."
    local callback = options.Callback or function() end
    
    local frame = Instance.new("Frame")
    frame.Name = "TextBox"
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundTransparency = 1
    frame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local inputBg = Instance.new("Frame")
    inputBg.Size = UDim2.new(1, -20, 0, 20) -- Reduced height for input
    inputBg.Position = UDim2.new(0, 10, 0, 20)
    inputBg.BackgroundColor3 = ThemeManager.Theme.Background
    inputBg.Parent = frame
    Utility:ThemeBind(inputBg, "BackgroundColor3", "Background")
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = inputBg
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeManager.Theme.Outline
    stroke.Thickness = 1
    stroke.Parent = inputBg
    Utility:ThemeBind(stroke, "Color", "Outline")
    
    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -10, 1, 0)
    input.Position = UDim2.new(0, 5, 0, 0)
    input.BackgroundTransparency = 1
    input.Text = ""
    input.PlaceholderText = placeholder
    input.PlaceholderColor3 = ThemeManager.Theme.SubText
    input.Font = ThemeManager.Theme.Font
    input.TextSize = 14
    input.TextXAlignment = Enum.TextXAlignment.Left
    input.Parent = inputBg
    Utility:ThemeBind(input, "TextColor3", "Text")
    Utility:ThemeBind(input, "PlaceholderColor3", "SubText")
    
    input.Focused:Connect(function()
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Accent})
    end)
    
    input.FocusLost:Connect(function()
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Outline})
        callback(input.Text)
    end)
    
    return {
        Frame = frame,
        SetValue = function(_, newValue)
            input.Text = newValue
        end,
        GetValue = function()
            return input.Text
        end
    }
end


        return TextBox
    end
}

modules["Keybind"] = {
    fn = function()
        local Keybind = {}
local UserInputService = game:GetService("UserInputService")
local ThemeManager = LoadModule("ThemeManager")
local Utility = LoadModule("Utility")
local KeybindList = LoadModule("KeybindList")

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
    end
}

modules["Loader"] = {
    fn = function()
        local Loader = {}
local TweenService = game:GetService("TweenService")
local ThemeManager = LoadModule("ThemeManager")
local Utility = LoadModule("Utility")
local Compatibility = LoadModule("Compatibility")

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
    end
}

modules["Window"] = {
    fn = function()
        local Window = {}
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")
local Acrylic = LoadModule("Acrylic")
local Particles = LoadModule("Particles")
local SearchFeature = LoadModule("Search")
local Watermark = LoadModule("Watermark")
local KeybindList = LoadModule("KeybindList")
local SaveManager = LoadModule("SaveManager")
local Notifications = LoadModule("Notifications")

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
    
    local TabModule = LoadModule("Tab")
    
    function WindowObj:AddTab(name, icon)
        return TabModule.new(name, icon, WindowObj)
    end
    
    SearchFeature:Init(searchBar, WindowObj)
    Watermark:Init(gui)
    KeybindList:Init(gui)
    Notifications:Init(gui)
    
    -- Expose Notifications on the window object
    WindowObj.Notifications = Notifications
    
    -- Notify helper
    function WindowObj:Notify(options)
        return Notifications:Notify(options)
    end
    
    -- Unload function with progress notification
    function WindowObj:Unload()
        local notif = Notifications:Loading("Unloading", "Cleaning up UI...", 3)
        
        -- Animate progress
        task.spawn(function()
            for i = 1, 10 do
                task.wait(0.15)
                if notif and notif.UpdateProgress then
                    notif.UpdateProgress(1 - (i / 10))
                end
                if notif and notif.UpdateContent then
                    local messages = {
                        "Cleaning up UI...",
                        "Stopping connections...",
                        "Clearing cache...",
                        "Removing elements...",
                        "Saving settings...",
                        "Disconnecting events...",
                        "Finalizing...",
                        "Almost done...",
                        "Wrapping up...",
                        "Goodbye!"
                    }
                    notif.UpdateContent(messages[i] or "Unloading...")
                end
            end
        end)
        
        task.wait(1.5)
        
        -- Fade out main window
        local fadeOut = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 700, 0, 0)
        })
        fadeOut:Play()
        fadeOut.Completed:Wait()
        
        -- Destroy the GUI
        gui:Destroy()
    end
    
    return WindowObj
end


        return Window
    end
}

modules["Button"] = {
    fn = function()
        local Button = {}
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

function Button.new(options, section)
    options = options or {}
    local text = options.Text or "Button"
    local callback = options.Callback or function() end
    
    local buttonFrame = Instance.new("TextButton")
    buttonFrame.Name = "Button"
    buttonFrame.Size = UDim2.new(1, 0, 0, 32)
    buttonFrame.BackgroundTransparency = 0.6
    buttonFrame.Text = ""
    buttonFrame.AutoButtonColor = false
    buttonFrame.Parent = section.Container
    
    Utility:ThemeBind(buttonFrame, "BackgroundColor3", "Background")
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = buttonFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Parent = buttonFrame
    Utility:ThemeBind(stroke, "Color", "Outline")
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.9, 0.9, 0.9))
    })
    gradient.Rotation = 90
    gradient.Parent = buttonFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.Parent = buttonFrame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    -- Animations
    buttonFrame.MouseEnter:Connect(function()
        Utility:Tween(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = ThemeManager.Theme.Hover})
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Accent})
    end)
    
    buttonFrame.MouseLeave:Connect(function()
        Utility:Tween(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = ThemeManager.Theme.Background})
        Utility:Tween(stroke, TweenInfo.new(0.2), {Color = ThemeManager.Theme.Outline})
    end)
    
    buttonFrame.MouseButton1Click:Connect(function()
        Utility:CreateRipple(buttonFrame)
        callback()
    end)
    
    return {
        Frame = buttonFrame,
        SetText = function(_, newText)
            label.Text = newText
        end
    }
end


        return Button
    end
}

modules["Toggle"] = {
    fn = function()
        local Toggle = {}
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

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
    end
}

modules["Slider"] = {
    fn = function()
        local Slider = {}
local UserInputService = game:GetService("UserInputService")
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

function Slider.new(options, section)
    options = options or {}
    local text = options.Text or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.Default or min
    local callback = options.Callback or function() end
    
    local value = default
    
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "Slider"
    sliderFrame.Size = UDim2.new(1, 0, 0, 50)
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Parent = section.Container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = ThemeManager.Theme.Font
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = sliderFrame
    Utility:ThemeBind(label, "TextColor3", "Text")
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Position = UDim2.new(1, -60, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default)
    valueLabel.Font = ThemeManager.Theme.FontBold
    valueLabel.TextSize = 14
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Parent = sliderFrame
    Utility:ThemeBind(valueLabel, "TextColor3", "Accent")
    
    local track = Instance.new("TextButton") -- Button for click input
    track.Name = "Track"
    track.Size = UDim2.new(1, -20, 0, 6)
    track.Position = UDim2.new(0, 10, 0, 30)
    track.BackgroundColor3 = ThemeManager.Theme.Outline -- Initial
    track.Text = ""
    track.AutoButtonColor = false
    track.Parent = sliderFrame
    Utility:ThemeBind(track, "BackgroundColor3", "Outline")
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = ThemeManager.Theme.Accent -- Initial
    fill.Parent = track
    Utility:ThemeBind(fill, "BackgroundColor3", "Accent")
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Color = ColorSequence.new({
         ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
         ColorSequenceKeypoint.new(1, Color3.new(0.8, 0.8, 1)) -- Slight shift
    })
    fillGradient.Parent = fill
    
    -- Glow on the handle
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new(1, 0, 0.5, 0)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = fill
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local knobShadow = Utility:AddShadow(knob, 10)
    knobShadow.ImageTransparency = 0.5
    knobShadow.ImageColor3 = ThemeManager.Theme.Accent -- Initial
    
    ThemeManager.ThemeUpdate.Event:Connect(function()
        knobShadow.ImageColor3 = ThemeManager.Theme.Accent
    end)
    
    local dragging = false
    
    local function update(input)
        local pos = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local newValue = math.floor(min + ((max - min) * pos))
        
        if newValue ~= value then
            value = newValue
            valueLabel.Text = tostring(value)
            fill.Size = UDim2.new(pos, 0, 1, 0)
            callback(value)
        end
    end
    
    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
            Utility:Tween(knob, TweenInfo.new(0.1), {Size = UDim2.new(0, 18, 0, 18)})
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            Utility:Tween(knob, TweenInfo.new(0.1), {Size = UDim2.new(0, 14, 0, 14)})
        end
    end)
    
    return {
        Frame = sliderFrame,
        SetValue = function(_, newValue)
            newValue = math.clamp(newValue, min, max)
            value = newValue
            valueLabel.Text = tostring(value)
            fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
            callback(value)
        end
    }
end


        return Slider
    end
}

modules["Search"] = {
    fn = function()
        local Search = {}

function Search:Init(input, window)
    input:GetPropertyChangedSignal("Text"):Connect(function()
        local query = input.Text:lower()
        
        for _, tab in pairs(window.Tabs) do
            for _, child in pairs(tab.Page:GetDescendants()) do
                if child:IsA("TextLabel") and child.Name == "Title" and child.Parent.Name:find("Section") == nil then
                    -- It's an element label
                    local elementFrame = child.Parent
                    if elementFrame:IsA("Frame") or elementFrame:IsA("TextButton") then
                        if child.Text:lower():find(query) then
                            elementFrame.Visible = true
                        else
                            elementFrame.Visible = false
                        end
                    end
                end
            end
            
            -- V7 Smart Search: Hide sections if all elements are hidden
            for _, sectionFrame in pairs(tab.Page:GetChildren()) do
                if sectionFrame.Name:find("Section") and sectionFrame:IsA("Frame") then
                    local container = sectionFrame:FindFirstChild("Container")
                    if container then
                        local hasVisible = false
                        for _, elem in pairs(container:GetChildren()) do
                            if elem:IsA("Frame") or elem:IsA("TextButton") then
                                if elem.Visible then
                                    hasVisible = true
                                    break
                                end
                            end
                        end
                        sectionFrame.Visible = hasVisible
                    end
                end
            end
        end
    end)
end


        return Search
    end
}

modules["Tab"] = {
    fn = function()
        local Tab = {}
local Utility = LoadModule("Utility")
local ThemeManager = LoadModule("ThemeManager")

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
    
    -- Theme Update Listener
    ThemeManager.ThemeUpdate.Event:Connect(function()
        indicator.BackgroundColor3 = ThemeManager.Theme.Accent
        page.ScrollBarImageColor3 = ThemeManager.Theme.Accent
        if TabObj.Active then
            tabLabel.TextColor3 = ThemeManager.Theme.Text
            tabButton.BackgroundColor3 = ThemeManager.Theme.Accent
            if icon then
                local ico = tabButton:FindFirstChild("Icon")
                if ico then ico.ImageColor3 = ThemeManager.Theme.Text end
            end
        else
            tabLabel.TextColor3 = ThemeManager.Theme.SubText
            if icon then
                local ico = tabButton:FindFirstChild("Icon")
                if ico then ico.ImageColor3 = ThemeManager.Theme.SubText end
            end
        end
    end)
    
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
    
    local SectionModule = LoadModule("Section")
    function TabObj:AddSection(title)
        return SectionModule.new(title, TabObj)
    end
    
    return TabObj
end


        return Tab
    end
}

    return LoadModule("Library")
end

-- --- EXAMPLE USAGE ---


local Library = LibraryBundle()
local Loader = Library.Loader
local Compatibility = Library.Compatibility

Loader:Start(function(report)
    if report and not report.FileIO then
        warn("This script requires FileIO support for Configs.")
    end
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
    local function CreateLoadingScreen()
        local loadingGui = Instance.new("ScreenGui")
        loadingGui.Name = "GRGLoader"
        loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        loadingGui.ResetOnSpawn = false
        loadingGui.Parent = CoreGui
        
        local bg = Instance.new("Frame")
        bg.Name = "Background"
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
        bg.BorderSizePixel = 0
        bg.Parent = loadingGui
        
        local container = Instance.new("Frame")
        container.Name = "Container"
        container.Size = UDim2.new(0, 400, 0, 200)
        container.Position = UDim2.new(0.5, -200, 0.5, -100)
        container.BackgroundTransparency = 1
        container.Parent = bg
        
        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.Size = UDim2.new(1, 0, 0, 50)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.BackgroundTransparency = 1
        title.Text = "#1 GRG Script"
        title.TextColor3 = Color3.fromRGB(255, 100, 150)
        title.Font = Enum.Font.GothamBold
        title.TextSize = 36
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
        subtitle.Parent = container
        
        local barBg = Instance.new("Frame")
        barBg.Name = "BarBackground"
        barBg.Size = UDim2.new(1, 0, 0, 6)
        barBg.Position = UDim2.new(0, 0, 0, 100)
        barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        barBg.BorderSizePixel = 0
        barBg.Parent = container
        
        local barCorner = Instance.new("UICorner")
        barCorner.CornerRadius = UDim.new(0, 3)
        barCorner.Parent = barBg
        
        -- Add stroke to make the bar track more visible
        local barStroke = Instance.new("UIStroke")
        barStroke.Color = Color3.fromRGB(80, 80, 90)
        barStroke.Thickness = 1
        barStroke.Parent = barBg
        
        local barFill = Instance.new("Frame")
        barFill.Name = "Fill"
        barFill.Size = UDim2.new(1, 0, 1, 0)  -- Start full
        barFill.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
        barFill.BorderSizePixel = 0
        barFill.Parent = barBg
        
        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(0, 3)
        fillCorner.Parent = barFill
        
        -- Start with bar at 0 for animation
        barFill.Size = UDim2.new(0, 0, 1, 0)
        
        local statusLabel = Instance.new("TextLabel")
        statusLabel.Name = "Status"
        statusLabel.Size = UDim2.new(1, 0, 0, 20)
        statusLabel.Position = UDim2.new(0, 0, 0, 115)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Text = "Initializing..."
        statusLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
        statusLabel.Font = Enum.Font.Gotham
        statusLabel.TextSize = 12
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
        percentLabel.Parent = container
        
        -- Fake loading steps
        local steps = {
            {text = "Connecting to server...", duration = 0.4},
            {text = "Loading UI Library...", duration = 0.6},
            {text = "Initializing modules...", duration = 0.5},
            {text = "Loading ESP system...", duration = 0.3},
            {text = "Loading teleport system...", duration = 0.4},
            {text = "Loading player mods...", duration = 0.3},
            {text = "Loading autofarm...", duration = 0.4},
            {text = "Checking executor compatibility...", duration = 0.5},
            {text = "Applying theme...", duration = 0.3},
            {text = "Finalizing...", duration = 0.3}
        }
        
        local totalDuration = 0
        for _, step in ipairs(steps) do
            totalDuration = totalDuration + step.duration
        end
        
        local currentProgress = 0
        for i, step in ipairs(steps) do
            statusLabel.Text = step.text
            local targetProgress = (i / #steps)
            
            local tween = TweenService:Create(barFill, TweenInfo.new(step.duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(targetProgress, 0, 1, 0)
            })
            tween:Play()
            
            -- Update percent during tween
            local startTime = tick()
            while tick() - startTime < step.duration do
                local elapsed = tick() - startTime
                local progress = currentProgress + (targetProgress - currentProgress) * (elapsed / step.duration)
                percentLabel.Text = math.floor(progress * 100) .. "%"
                task.wait()
            end
            currentProgress = targetProgress
            percentLabel.Text = math.floor(currentProgress * 100) .. "%"
        end
        
        statusLabel.Text = "Complete!"
        task.wait(0.3)
        
        -- Fade out
        local fadeOut = TweenService:Create(bg, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        })
        local titleFade = TweenService:Create(title, TweenInfo.new(0.5), {TextTransparency = 1})
        local subtitleFade = TweenService:Create(subtitle, TweenInfo.new(0.5), {TextTransparency = 1})
        local statusFade = TweenService:Create(statusLabel, TweenInfo.new(0.5), {TextTransparency = 1})
        local percentFade = TweenService:Create(percentLabel, TweenInfo.new(0.5), {TextTransparency = 1})
        local barFade = TweenService:Create(barBg, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        local fillFade = TweenService:Create(barFill, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        
        fadeOut:Play()
        titleFade:Play()
        subtitleFade:Play()
        statusFade:Play()
        percentFade:Play()
        barFade:Play()
        fillFade:Play()
        
        task.wait(0.5)
        loadingGui:Destroy()
    end
    
    -- Show loading screen
    CreateLoadingScreen()
    
    -- Load the library
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/alexkkork/grg-script/main/Release.lua"))()
    
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
        end
    })
    
    ESPSection:AddToggle({
        Text = "ESP: Fruit Trees",
        Default = false,
        Callback = function(value)
            ESP.FruitTreesEnabled = value
            if not value then hideTreeESP(ESP.FruitTreeBoxes) end
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
            if not treesFolder then return end
            local hrp = getHRP()
            if not hrp then return end
            
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
            if nearest then teleportTo(nearest + Vector3.new(0, 5, 0)) end
        end
    })
    
    TeleportSection:AddButton({
        Text = "Nearest Fruit Tree",
        Callback = function()
            local treesFolder = Workspace:FindFirstChild("Trees")
            if not treesFolder then return end
            local hrp = getHRP()
            if not hrp then return end
            
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
            if nearest then teleportTo(nearest + Vector3.new(0, 5, 0)) end
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
            else
                disableFly()
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
            local url = 'https://pastebin.com/raw/5dQ40eZG'
            local ok, code = pcall(function() return game:HttpGet(url) end)
            if ok and code then
                local success, err = pcall(loadstring(code))
                if success then
                    Library.Notifications:Notify({Title = "Server Invis", Content = "Loaded successfully!", Duration = 3})
                else
                    Library.Notifications:Notify({Title = "Error", Content = tostring(err), Duration = 5})
                end
            end
        end
    })
    
    ExtrasSection:AddToggle({
        Text = "Barbarian Autofarm (Steal Food)",
        Default = false,
        Callback = function(value)
            Autofarm.BarbEnabled = value
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
        end
    })
    
    AutoteamSection:AddToggle({
        Text = "Auto Join Team",
        Default = false,
        Callback = function(value)
            Autofarm.AutoteamEnabled = value
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

    Library.Notifications:Init(Window.Gui)
    
    -- Show Compatibility Report
    if report and not report.UNC then
        Library.Notifications:Notify({Title = "Warning", Content = "Your executor does not support UNC standard.", Duration = 10})
    end
end)
