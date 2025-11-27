local rawSource = require(script.Parent.GRGRaw)

local function buildGRG()
    local fn, err = loadstring(rawSource, "GRGStandalone")
    if not fn then
        warn("[GRG] Failed to parse GRG UI script:", err)
        return nil
    end

    local ok, gui = pcall(fn)
    if not ok then
        warn("[GRG] Failed to run GRG UI script:", gui)
        return nil
    end

    return gui
end

return buildGRG

