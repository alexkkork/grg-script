local Section = {}
local ThemeManager = require(script.Parent.Parent.Core.ThemeManager)

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
    
    -- Element Loaders
    function SectionObj:AddButton(options)
        return require(script.Parent.Elements.Button).new(options, SectionObj)
    end
    
    function SectionObj:AddToggle(options)
        return require(script.Parent.Elements.Toggle).new(options, SectionObj)
    end

    function SectionObj:AddSlider(options)
        return require(script.Parent.Elements.Slider).new(options, SectionObj)
    end
    
    function SectionObj:AddDropdown(options)
        return require(script.Parent.Elements.Dropdown).new(options, SectionObj)
    end

    function SectionObj:AddColorPicker(options)
        return require(script.Parent.Elements.ColorPicker).new(options, SectionObj)
    end

    function SectionObj:AddKeybind(options)
        return require(script.Parent.Elements.Keybind).new(options, SectionObj)
    end

    return SectionObj
end

return Section

