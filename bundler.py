import os
import re
from pathlib import Path

# Mapping of module names to their file paths (NO old GRG stuff)
files = {
    "Utility": "src/Core/Utility.lua",
    "ThemeManager": "src/Core/ThemeManager.lua",
    "Acrylic": "src/Core/Acrylic.lua",
    "Particles": "src/Core/Particles.lua",
    "SaveManager": "src/Core/SaveManager.lua",
    "Compatibility": "src/Core/Compatibility.lua",
    "Loader": "src/Core/Loader.lua",
    "Library": "src/Core/Library.lua",
    "Window": "src/Components/Window.lua",
    "Tab": "src/Components/Tab.lua",
    "Section": "src/Components/Section.lua",
    "Button": "src/Components/Elements/Button.lua",
    "Toggle": "src/Components/Elements/Toggle.lua",
    "Slider": "src/Components/Elements/Slider.lua",
    "TextBox": "src/Components/Elements/TextBox.lua",
    "Dropdown": "src/Components/Elements/Dropdown.lua",
    "ColorPicker": "src/Components/Elements/ColorPicker.lua",
    "Keybind": "src/Components/Elements/Keybind.lua",
    "Notifications": "src/Features/Notifications.lua",
    "Tooltips": "src/Features/Tooltips.lua",
    "Search": "src/Features/Search.lua",
    "Watermark": "src/Features/Watermark.lua",
    "KeybindList": "src/Features/KeybindList.lua"
}

# 1. Generate Release.lua (Standalone Library)
release_content = """--[[
    Premium Glassmorphism UI Library
    Bundled Release (V8 Compatibility)
]]

local Library = {}
local modules = {}

local function LoadModule(name)
    if not modules[name] then return nil end
    if modules[name].cached then return modules[name].cached end
    
    local moduleFn = modules[name].fn
    local result = moduleFn()
    modules[name].cached = result
    return result
end

"""

modules_content = ""

# Sort keys by length descending
sorted_keys = sorted(files.keys(), key=len, reverse=True)

for name in sorted_keys:
    path = files[name]
    with open(path, 'r') as f:
        content = f.read()
    
    content = re.sub(r'return\s+\w+\s*$', '', content.strip())
    
    def replace_require(match):
        full_match = match.group(0)
        for mod_name in sorted_keys:
            if mod_name in full_match and f'"{mod_name}"' not in full_match:
                return f'LoadModule("{mod_name}")'
        return full_match

    content = re.sub(r'require\([^)]+\)', replace_require, content)
    
    modules_content += f"""
modules["{name}"] = {{
    fn = function()
        {content}
        return {name}
    end
}}
"""

release_content += modules_content
release_content += """
return LoadModule("Library")
"""

with open('Release.lua', 'w') as f:
    f.write(release_content)

print("Built Release.lua")

# 2. Generate Universal.lua (Wrapped Library + Example)
universal_content = """--[[
    Premium Glassmorphism UI Library + Example (V8 Compatibility)
    Universal Script
]]

local LibraryBundle = function()
    local Library = {}
    local modules = {}

    local function LoadModule(name)
        if not modules[name] then return nil end
        if modules[name].cached then return modules[name].cached end
        
        local moduleFn = modules[name].fn
        local result = moduleFn()
        modules[name].cached = result
        return result
    end
"""

universal_content += modules_content

universal_content += """
    return LoadModule("Library")
end

-- --- EXAMPLE USAGE ---

"""

# Append Example.lua content
with open('example.lua', 'r') as f:
    example_lines = f.readlines()

# Inject Loader Logic into Example
example_code = """
local Library = LibraryBundle()
local Loader = Library.Loader
local Compatibility = Library.Compatibility

Loader:Start(function(report)
    if report and not report.FileIO then
        warn("This script requires FileIO support for Configs.")
    end
"""

# Process original example code
original_example = ""
for line in example_lines:
    if "require(" not in line and "LibraryBundle()" not in line and "Library.Notifications:Init" not in line:
        original_example += line

# Indent it for the callback
indented_example = ""
for line in original_example.splitlines():
    indented_example += "    " + line + "\n"

example_code += indented_example
example_code += """
    Library.Notifications:Init(Window.Gui)
    
    -- Show Compatibility Report
    if report and not report.UNC then
        Library.Notifications:Notify({Title = "Warning", Content = "Your executor does not support UNC standard.", Duration = 10})
    end
end)
"""

universal_content += example_code

with open('Universal.lua', 'w') as f:
    f.write(universal_content)

print("Built Universal.lua")

# 3. Generate standalone GRG script (keep original G2L for reference)
GRG_SOURCE_PATH = Path("src/Components/grg")
if GRG_SOURCE_PATH.exists():
    grg_source_text = GRG_SOURCE_PATH.read_text().rstrip()
    with open('GRGStandalone.lua', 'w') as f:
        f.write(grg_source_text + "\n")
    print("Built GRGStandalone.lua")
else:
    print("Skipped GRGStandalone.lua (no source)")
