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
    Default = { Accent = Color3.fromRGB(0, 170, 255), Background = Color3.fromRGB(15, 15, 15) },
    Ocean = { Accent = Color3.fromRGB(0, 255, 255), Background = Color3.fromRGB(10, 20, 30) },
    Midnight = { Accent = Color3.fromRGB(150, 100, 255), Background = Color3.fromRGB(10, 10, 15) },
    Forest = { Accent = Color3.fromRGB(50, 255, 100), Background = Color3.fromRGB(15, 25, 15) },
    Crimson = { Accent = Color3.fromRGB(255, 50, 50), Background = Color3.fromRGB(25, 10, 10) }
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
