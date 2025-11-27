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
