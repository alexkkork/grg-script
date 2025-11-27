local Dropdown = {}
local Utility = require(script.Parent.Parent.Parent.Core.Utility)
local ThemeManager = require(script.Parent.Parent.Parent.Core.ThemeManager)

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
