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
