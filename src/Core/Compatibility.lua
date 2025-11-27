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
