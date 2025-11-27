local KeybindList = {}
local UserInputService = game:GetService("UserInputService")
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)
local Utility = require(script.Parent.Parent.Core.Utility)
local SaveManager = require(script.Parent.Parent.Core.SaveManager)

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
