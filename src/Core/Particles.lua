local Particles = {}
local RunService = game:GetService("RunService")
local ThemeManager = require(script.Parent.ThemeManager)

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

