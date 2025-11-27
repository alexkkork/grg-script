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
