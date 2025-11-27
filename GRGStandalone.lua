--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 298 | Scripts: 73 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.#1 GRG Script
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[#1 GRG Script]];
G2L["1"]["ResetOnSpawn"] = false;


-- StarterGui.#1 GRG Script.Main
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 231, 246);
G2L["2"]["Size"] = UDim2.new(0, 560, 0, 380);
G2L["2"]["Position"] = UDim2.new(0, 58, 0, 99);
G2L["2"]["Name"] = [[Main]];


-- StarterGui.#1 GRG Script.Main.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 18);


-- StarterGui.#1 GRG Script.Main.UIStroke
G2L["4"] = Instance.new("UIStroke", G2L["2"]);
G2L["4"]["Thickness"] = 2;
G2L["4"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.UIPadding
G2L["5"] = Instance.new("UIPadding", G2L["2"]);
G2L["5"]["PaddingTop"] = UDim.new(0, 10);
G2L["5"]["PaddingRight"] = UDim.new(0, 10);
G2L["5"]["PaddingLeft"] = UDim.new(0, 10);
G2L["5"]["PaddingBottom"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.TextLabel
G2L["6"] = Instance.new("TextLabel", G2L["2"]);
G2L["6"]["TextWrapped"] = true;
G2L["6"]["TextScaled"] = true;
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 121, 191);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Size"] = UDim2.new(1, -20, 0, 40);
G2L["6"]["Text"] = [[#1 GRG Script]];
G2L["6"]["Position"] = UDim2.new(0, 10, 0, 6);


-- StarterGui.#1 GRG Script.Main.Frame
G2L["7"] = Instance.new("Frame", G2L["2"]);
G2L["7"]["Size"] = UDim2.new(1, 0, 0, 44);
G2L["7"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame
G2L["8"] = Instance.new("Frame", G2L["2"]);
G2L["8"]["Size"] = UDim2.new(1, -20, 1, -64);
G2L["8"]["Position"] = UDim2.new(0, 10, 0, 52);
G2L["8"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame
G2L["9"] = Instance.new("Frame", G2L["8"]);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 216, 241);
G2L["9"]["Size"] = UDim2.new(0, 180, 1, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.UICorner
G2L["a"] = Instance.new("UICorner", G2L["9"]);
G2L["a"]["CornerRadius"] = UDim.new(0, 14);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.UIStroke
G2L["b"] = Instance.new("UIStroke", G2L["9"]);
G2L["b"]["Transparency"] = 0.15;
G2L["b"]["Thickness"] = 2;
G2L["b"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.UIPadding
G2L["c"] = Instance.new("UIPadding", G2L["9"]);
G2L["c"]["PaddingTop"] = UDim.new(0, 8);
G2L["c"]["PaddingRight"] = UDim.new(0, 8);
G2L["c"]["PaddingLeft"] = UDim.new(0, 8);
G2L["c"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.UIListLayout
G2L["d"] = Instance.new("UIListLayout", G2L["9"]);
G2L["d"]["Padding"] = UDim.new(0, 8);
G2L["d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_ESP&Teleport
G2L["e"] = Instance.new("TextButton", G2L["9"]);
G2L["e"]["TextSize"] = 15;
G2L["e"]["AutoButtonColor"] = false;
G2L["e"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["e"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["e"]["LayoutOrder"] = 1;
G2L["e"]["Text"] = [[ESP & Teleport]];
G2L["e"]["Name"] = [[Tab_ESP&Teleport]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_ESP&Teleport.LocalScript
G2L["f"] = Instance.new("LocalScript", G2L["e"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_ESP&Teleport.UICorner
G2L["10"] = Instance.new("UICorner", G2L["e"]);
G2L["10"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_ESP&Teleport.UIStroke
G2L["11"] = Instance.new("UIStroke", G2L["e"]);
G2L["11"]["Transparency"] = 0.15;
G2L["11"]["Thickness"] = 2;
G2L["11"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["11"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Player
G2L["12"] = Instance.new("TextButton", G2L["9"]);
G2L["12"]["TextSize"] = 15;
G2L["12"]["AutoButtonColor"] = false;
G2L["12"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["12"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["12"]["LayoutOrder"] = 2;
G2L["12"]["Text"] = [[Player]];
G2L["12"]["Name"] = [[Tab_Player]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Player.LocalScript
G2L["13"] = Instance.new("LocalScript", G2L["12"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Player.UICorner
G2L["14"] = Instance.new("UICorner", G2L["12"]);
G2L["14"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Player.UIStroke
G2L["15"] = Instance.new("UIStroke", G2L["12"]);
G2L["15"]["Transparency"] = 0.15;
G2L["15"]["Thickness"] = 2;
G2L["15"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["15"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Extras
G2L["16"] = Instance.new("TextButton", G2L["9"]);
G2L["16"]["TextSize"] = 15;
G2L["16"]["AutoButtonColor"] = false;
G2L["16"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["16"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["16"]["LayoutOrder"] = 3;
G2L["16"]["Text"] = [[Extras]];
G2L["16"]["Name"] = [[Tab_Extras]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Extras.LocalScript
G2L["17"] = Instance.new("LocalScript", G2L["16"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Extras.UICorner
G2L["18"] = Instance.new("UICorner", G2L["16"]);
G2L["18"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Extras.UIStroke
G2L["19"] = Instance.new("UIStroke", G2L["16"]);
G2L["19"]["Transparency"] = 0.15;
G2L["19"]["Thickness"] = 2;
G2L["19"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["19"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Credits
G2L["1a"] = Instance.new("TextButton", G2L["9"]);
G2L["1a"]["TextSize"] = 15;
G2L["1a"]["AutoButtonColor"] = false;
G2L["1a"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["1a"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["1a"]["LayoutOrder"] = 3;
G2L["1a"]["Text"] = [[Credits]];
G2L["1a"]["Name"] = [[Tab_Credits]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Credits.LocalScript
G2L["1b"] = Instance.new("LocalScript", G2L["1a"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Credits.UICorner
G2L["1c"] = Instance.new("UICorner", G2L["1a"]);
G2L["1c"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Credits.UIStroke
G2L["1d"] = Instance.new("UIStroke", G2L["1a"]);
G2L["1d"]["Transparency"] = 0.15;
G2L["1d"]["Thickness"] = 2;
G2L["1d"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["1d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_GUI & Keybinds
G2L["1e"] = Instance.new("TextButton", G2L["9"]);
G2L["1e"]["TextSize"] = 15;
G2L["1e"]["AutoButtonColor"] = false;
G2L["1e"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["1e"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["1e"]["LayoutOrder"] = 3;
G2L["1e"]["Text"] = [[GUI & Keybinds]];
G2L["1e"]["Name"] = [[Tab_GUI & Keybinds]];
G2L["1e"]["Position"] = UDim2.new(0, 0, 0.51429, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_GUI & Keybinds.LocalScript
G2L["1f"] = Instance.new("LocalScript", G2L["1e"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_GUI & Keybinds.UICorner
G2L["20"] = Instance.new("UICorner", G2L["1e"]);
G2L["20"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_GUI & Keybinds.UIStroke
G2L["21"] = Instance.new("UIStroke", G2L["1e"]);
G2L["21"]["Transparency"] = 0.15;
G2L["21"]["Thickness"] = 2;
G2L["21"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["21"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_AutoBuy
G2L["22"] = Instance.new("TextButton", G2L["9"]);
G2L["22"]["TextSize"] = 15;
G2L["22"]["AutoButtonColor"] = false;
G2L["22"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["22"]["Size"] = UDim2.new(1, -10, 0, 40);
G2L["22"]["LayoutOrder"] = 1;
G2L["22"]["Text"] = [[Auto Buy]];
G2L["22"]["Name"] = [[Tab_AutoBuy]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_AutoBuy.LocalScript
G2L["23"] = Instance.new("LocalScript", G2L["22"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_AutoBuy.UICorner
G2L["24"] = Instance.new("UICorner", G2L["22"]);
G2L["24"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_AutoBuy.UIStroke
G2L["25"] = Instance.new("UIStroke", G2L["22"]);
G2L["25"]["Transparency"] = 0.15;
G2L["25"]["Thickness"] = 2;
G2L["25"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["25"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame
G2L["26"] = Instance.new("Frame", G2L["8"]);
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["Size"] = UDim2.new(1, -192, 1, 0);
G2L["26"]["Position"] = UDim2.new(0, 192, 0, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.UICorner
G2L["27"] = Instance.new("UICorner", G2L["26"]);
G2L["27"]["CornerRadius"] = UDim.new(0, 14);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.UIStroke
G2L["28"] = Instance.new("UIStroke", G2L["26"]);
G2L["28"]["Transparency"] = 0.15;
G2L["28"]["Thickness"] = 2;
G2L["28"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["28"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.UIPadding
G2L["29"] = Instance.new("UIPadding", G2L["26"]);
G2L["29"]["PaddingTop"] = UDim.new(0, 10);
G2L["29"]["PaddingRight"] = UDim.new(0, 10);
G2L["29"]["PaddingLeft"] = UDim.new(0, 10);
G2L["29"]["PaddingBottom"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1
G2L["2a"] = Instance.new("Frame", G2L["26"]);
G2L["2a"]["Visible"] = false;
G2L["2a"]["Size"] = UDim2.new(1.08442, 0, 1, 0);
G2L["2a"]["Position"] = UDim2.new(-0.03247, 0, 0, 0);
G2L["2a"]["Name"] = [[Frame1]];
G2L["2a"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.LocalScript
G2L["2b"] = Instance.new("LocalScript", G2L["2a"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll
G2L["2c"] = Instance.new("ScrollingFrame", G2L["2a"]);
G2L["2c"]["CanvasSize"] = UDim2.new(0, 0, 3, 2);
G2L["2c"]["Name"] = [[Scroll]];
G2L["2c"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["2c"]["Size"] = UDim2.new(0.97904, 0, 1, 1);
G2L["2c"]["Position"] = UDim2.new(0.02096, 0, 0, 0);
G2L["2c"]["ScrollBarThickness"] = 6;
G2L["2c"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.TextLabel
G2L["2d"] = Instance.new("TextLabel", G2L["2c"]);
G2L["2d"]["TextSize"] = 16;
G2L["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["2d"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["2d"]["BackgroundTransparency"] = 1;
G2L["2d"]["Size"] = UDim2.new(1, -10, 0, 28);
G2L["2d"]["Text"] = [[ESP]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame
G2L["2e"] = Instance.new("Frame", G2L["2c"]);
G2L["2e"]["Size"] = UDim2.new(1, -6, 0, 120);
G2L["2e"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.UIGridLayout
G2L["2f"] = Instance.new("UIGridLayout", G2L["2e"]);
G2L["2f"]["CellSize"] = UDim2.new(0.5, -10, 0, 36);
G2L["2f"]["FillDirectionMaxCells"] = 2;
G2L["2f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["2f"]["CellPadding"] = UDim2.new(0, 8, 0, 8);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:Players
G2L["30"] = Instance.new("TextButton", G2L["2e"]);
G2L["30"]["TextSize"] = 15;
G2L["30"]["AutoButtonColor"] = false;
G2L["30"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["30"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["30"]["Text"] = [[ESP: Players]];
G2L["30"]["Name"] = [[ESP:Players]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:Players.esp script
G2L["31"] = Instance.new("LocalScript", G2L["30"]);
G2L["31"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:Players.UICorner
G2L["32"] = Instance.new("UICorner", G2L["30"]);
G2L["32"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:Players.UIStroke
G2L["33"] = Instance.new("UIStroke", G2L["30"]);
G2L["33"]["Transparency"] = 0.15;
G2L["33"]["Thickness"] = 2;
G2L["33"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["33"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:MoneyTrees
G2L["34"] = Instance.new("TextButton", G2L["2e"]);
G2L["34"]["TextSize"] = 15;
G2L["34"]["AutoButtonColor"] = false;
G2L["34"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["34"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["34"]["Text"] = [[ESP: Money Tree]];
G2L["34"]["Name"] = [[ESP:MoneyTrees]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:MoneyTrees.esp script
G2L["35"] = Instance.new("LocalScript", G2L["34"]);
G2L["35"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:MoneyTrees.UICorner
G2L["36"] = Instance.new("UICorner", G2L["34"]);
G2L["36"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:MoneyTrees.UIStroke
G2L["37"] = Instance.new("UIStroke", G2L["34"]);
G2L["37"]["Transparency"] = 0.15;
G2L["37"]["Thickness"] = 2;
G2L["37"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["37"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP: FruitTrees
G2L["38"] = Instance.new("TextButton", G2L["2e"]);
G2L["38"]["TextSize"] = 15;
G2L["38"]["AutoButtonColor"] = false;
G2L["38"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["38"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["38"]["Text"] = [[ESP: Fruit Tree]];
G2L["38"]["Name"] = [[ESP: FruitTrees]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP: FruitTrees.esp script
G2L["39"] = Instance.new("LocalScript", G2L["38"]);
G2L["39"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP: FruitTrees.UICorner
G2L["3a"] = Instance.new("UICorner", G2L["38"]);
G2L["3a"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP: FruitTrees.UIStroke
G2L["3b"] = Instance.new("UIStroke", G2L["38"]);
G2L["3b"]["Transparency"] = 0.15;
G2L["3b"]["Thickness"] = 2;
G2L["3b"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["3b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.TextLabel
G2L["3c"] = Instance.new("TextLabel", G2L["2c"]);
G2L["3c"]["TextSize"] = 16;
G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3c"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["3c"]["BackgroundTransparency"] = 1;
G2L["3c"]["Size"] = UDim2.new(1, -10, 0, 28);
G2L["3c"]["Text"] = [[Teleports]];
G2L["3c"]["Position"] = UDim2.new(0.01529, 0, 0.97762, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame
G2L["3d"] = Instance.new("Frame", G2L["2c"]);
G2L["3d"]["Size"] = UDim2.new(1, -6, 0, 184);
G2L["3d"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_1
G2L["3e"] = Instance.new("TextButton", G2L["3d"]);
G2L["3e"]["TextWrapped"] = true;
G2L["3e"]["TextSize"] = 15;
G2L["3e"]["AutoButtonColor"] = false;
G2L["3e"]["TextScaled"] = true;
G2L["3e"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["3e"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["3e"]["Text"] = [[Nearest Money Tree]];
G2L["3e"]["Name"] = [[Teleport_1]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_1.esp script
G2L["3f"] = Instance.new("LocalScript", G2L["3e"]);
G2L["3f"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_1.UICorner
G2L["40"] = Instance.new("UICorner", G2L["3e"]);
G2L["40"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_1.UIStroke
G2L["41"] = Instance.new("UIStroke", G2L["3e"]);
G2L["41"]["Transparency"] = 0.15;
G2L["41"]["Thickness"] = 2;
G2L["41"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["41"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_2
G2L["42"] = Instance.new("TextButton", G2L["3d"]);
G2L["42"]["TextWrapped"] = true;
G2L["42"]["TextSize"] = 15;
G2L["42"]["AutoButtonColor"] = false;
G2L["42"]["TextScaled"] = true;
G2L["42"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["42"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["42"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["42"]["Text"] = [[Nearest Fruit Tree]];
G2L["42"]["Name"] = [[Teleport_2]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_2.esp script
G2L["43"] = Instance.new("LocalScript", G2L["42"]);
G2L["43"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_2.UICorner
G2L["44"] = Instance.new("UICorner", G2L["42"]);
G2L["44"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_2.UIStroke
G2L["45"] = Instance.new("UIStroke", G2L["42"]);
G2L["45"]["Transparency"] = 0.15;
G2L["45"]["Thickness"] = 2;
G2L["45"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["45"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_3
G2L["46"] = Instance.new("TextButton", G2L["3d"]);
G2L["46"]["TextWrapped"] = true;
G2L["46"]["TextSize"] = 15;
G2L["46"]["AutoButtonColor"] = false;
G2L["46"]["TextScaled"] = true;
G2L["46"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["46"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["46"]["Text"] = [[Arena]];
G2L["46"]["Name"] = [[Teleport_3]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_3.teleport script
G2L["47"] = Instance.new("LocalScript", G2L["46"]);
G2L["47"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_3.UICorner
G2L["48"] = Instance.new("UICorner", G2L["46"]);
G2L["48"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_3.UIStroke
G2L["49"] = Instance.new("UIStroke", G2L["46"]);
G2L["49"]["Transparency"] = 0.15;
G2L["49"]["Thickness"] = 2;
G2L["49"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["49"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_4
G2L["4a"] = Instance.new("TextButton", G2L["3d"]);
G2L["4a"]["TextWrapped"] = true;
G2L["4a"]["TextSize"] = 15;
G2L["4a"]["AutoButtonColor"] = false;
G2L["4a"]["TextScaled"] = true;
G2L["4a"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["4a"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["4a"]["Text"] = [[Barb Beach]];
G2L["4a"]["Name"] = [[Teleport_4]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_4.teleport script
G2L["4b"] = Instance.new("LocalScript", G2L["4a"]);
G2L["4b"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_4.UICorner
G2L["4c"] = Instance.new("UICorner", G2L["4a"]);
G2L["4c"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_4.UIStroke
G2L["4d"] = Instance.new("UIStroke", G2L["4a"]);
G2L["4d"]["Transparency"] = 0.15;
G2L["4d"]["Thickness"] = 2;
G2L["4d"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["4d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_5
G2L["4e"] = Instance.new("TextButton", G2L["3d"]);
G2L["4e"]["TextWrapped"] = true;
G2L["4e"]["TextSize"] = 15;
G2L["4e"]["AutoButtonColor"] = false;
G2L["4e"]["TextScaled"] = true;
G2L["4e"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["4e"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["4e"]["Text"] = [[Barb Food]];
G2L["4e"]["Name"] = [[Teleport_5]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_5.teleport script
G2L["4f"] = Instance.new("LocalScript", G2L["4e"]);
G2L["4f"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_5.UICorner
G2L["50"] = Instance.new("UICorner", G2L["4e"]);
G2L["50"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_5.UIStroke
G2L["51"] = Instance.new("UIStroke", G2L["4e"]);
G2L["51"]["Transparency"] = 0.15;
G2L["51"]["Thickness"] = 2;
G2L["51"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["51"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_6
G2L["52"] = Instance.new("TextButton", G2L["3d"]);
G2L["52"]["TextWrapped"] = true;
G2L["52"]["TextSize"] = 15;
G2L["52"]["AutoButtonColor"] = false;
G2L["52"]["TextScaled"] = true;
G2L["52"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["52"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["52"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["52"]["Text"] = [[Town Food]];
G2L["52"]["Name"] = [[Teleport_6]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_6.teleport script
G2L["53"] = Instance.new("LocalScript", G2L["52"]);
G2L["53"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_6.UICorner
G2L["54"] = Instance.new("UICorner", G2L["52"]);
G2L["54"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_6.UIStroke
G2L["55"] = Instance.new("UIStroke", G2L["52"]);
G2L["55"]["Transparency"] = 0.15;
G2L["55"]["Thickness"] = 2;
G2L["55"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["55"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_7
G2L["56"] = Instance.new("TextButton", G2L["3d"]);
G2L["56"]["TextWrapped"] = true;
G2L["56"]["TextSize"] = 15;
G2L["56"]["AutoButtonColor"] = false;
G2L["56"]["TextScaled"] = true;
G2L["56"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["56"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["56"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["56"]["Text"] = [[Beach]];
G2L["56"]["Name"] = [[Teleport_7]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_7.teleport script
G2L["57"] = Instance.new("LocalScript", G2L["56"]);
G2L["57"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_7.UICorner
G2L["58"] = Instance.new("UICorner", G2L["56"]);
G2L["58"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_7.UIStroke
G2L["59"] = Instance.new("UIStroke", G2L["56"]);
G2L["59"]["Transparency"] = 0.15;
G2L["59"]["Thickness"] = 2;
G2L["59"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["59"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_8
G2L["5a"] = Instance.new("TextButton", G2L["3d"]);
G2L["5a"]["TextWrapped"] = true;
G2L["5a"]["TextSize"] = 15;
G2L["5a"]["AutoButtonColor"] = false;
G2L["5a"]["TextScaled"] = true;
G2L["5a"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["5a"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["5a"]["Text"] = [[Council]];
G2L["5a"]["Name"] = [[Teleport_8]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_8.teleport script
G2L["5b"] = Instance.new("LocalScript", G2L["5a"]);
G2L["5b"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_8.UICorner
G2L["5c"] = Instance.new("UICorner", G2L["5a"]);
G2L["5c"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_8.UIStroke
G2L["5d"] = Instance.new("UIStroke", G2L["5a"]);
G2L["5d"]["Transparency"] = 0.15;
G2L["5d"]["Thickness"] = 2;
G2L["5d"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["5d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_9
G2L["5e"] = Instance.new("TextButton", G2L["3d"]);
G2L["5e"]["TextWrapped"] = true;
G2L["5e"]["TextSize"] = 15;
G2L["5e"]["AutoButtonColor"] = false;
G2L["5e"]["TextScaled"] = true;
G2L["5e"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["5e"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["5e"]["Text"] = [[FarmKart]];
G2L["5e"]["Name"] = [[Teleport_9]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_9.teleport script
G2L["5f"] = Instance.new("LocalScript", G2L["5e"]);
G2L["5f"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_9.UICorner
G2L["60"] = Instance.new("UICorner", G2L["5e"]);
G2L["60"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_9.UIStroke
G2L["61"] = Instance.new("UIStroke", G2L["5e"]);
G2L["61"]["Transparency"] = 0.15;
G2L["61"]["Thickness"] = 2;
G2L["61"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["61"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_10
G2L["62"] = Instance.new("TextButton", G2L["3d"]);
G2L["62"]["TextWrapped"] = true;
G2L["62"]["TextSize"] = 15;
G2L["62"]["AutoButtonColor"] = false;
G2L["62"]["TextScaled"] = true;
G2L["62"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["62"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["62"]["Text"] = [[Gate]];
G2L["62"]["Name"] = [[Teleport_10]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_10.teleport script
G2L["63"] = Instance.new("LocalScript", G2L["62"]);
G2L["63"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_10.UICorner
G2L["64"] = Instance.new("UICorner", G2L["62"]);
G2L["64"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_10.UIStroke
G2L["65"] = Instance.new("UIStroke", G2L["62"]);
G2L["65"]["Transparency"] = 0.15;
G2L["65"]["Thickness"] = 2;
G2L["65"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["65"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_11
G2L["66"] = Instance.new("TextButton", G2L["3d"]);
G2L["66"]["TextWrapped"] = true;
G2L["66"]["TextSize"] = 15;
G2L["66"]["AutoButtonColor"] = false;
G2L["66"]["TextScaled"] = true;
G2L["66"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["66"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["66"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["66"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["66"]["Text"] = [[Leader Tower]];
G2L["66"]["Name"] = [[Teleport_11]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_11.teleport script
G2L["67"] = Instance.new("LocalScript", G2L["66"]);
G2L["67"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_11.UICorner
G2L["68"] = Instance.new("UICorner", G2L["66"]);
G2L["68"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_11.UIStroke
G2L["69"] = Instance.new("UIStroke", G2L["66"]);
G2L["69"]["Transparency"] = 0.15;
G2L["69"]["Thickness"] = 2;
G2L["69"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["69"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_12
G2L["6a"] = Instance.new("TextButton", G2L["3d"]);
G2L["6a"]["TextWrapped"] = true;
G2L["6a"]["TextSize"] = 15;
G2L["6a"]["AutoButtonColor"] = false;
G2L["6a"]["TextScaled"] = true;
G2L["6a"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["6a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["6a"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["6a"]["Text"] = [[Barb Village]];
G2L["6a"]["Name"] = [[Teleport_12]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_12.teleport script
G2L["6b"] = Instance.new("LocalScript", G2L["6a"]);
G2L["6b"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_12.UICorner
G2L["6c"] = Instance.new("UICorner", G2L["6a"]);
G2L["6c"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_12.UIStroke
G2L["6d"] = Instance.new("UIStroke", G2L["6a"]);
G2L["6d"]["Transparency"] = 0.15;
G2L["6d"]["Thickness"] = 2;
G2L["6d"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["6d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_13
G2L["6e"] = Instance.new("TextButton", G2L["3d"]);
G2L["6e"]["TextWrapped"] = true;
G2L["6e"]["TextSize"] = 15;
G2L["6e"]["AutoButtonColor"] = false;
G2L["6e"]["TextScaled"] = true;
G2L["6e"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["6e"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["6e"]["Text"] = [[Current Leader]];
G2L["6e"]["Name"] = [[Teleport_13]];
G2L["6e"]["Position"] = UDim2.new(0.02318, 0, -0.21739, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_13.esp script
G2L["6f"] = Instance.new("LocalScript", G2L["6e"]);
G2L["6f"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_13.UICorner
G2L["70"] = Instance.new("UICorner", G2L["6e"]);
G2L["70"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_13.UIStroke
G2L["71"] = Instance.new("UIStroke", G2L["6e"]);
G2L["71"]["Transparency"] = 0.15;
G2L["71"]["Thickness"] = 2;
G2L["71"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["71"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.UIGridLayout
G2L["72"] = Instance.new("UIGridLayout", G2L["3d"]);
G2L["72"]["CellSize"] = UDim2.new(0.33333, -12, 0, 36);
G2L["72"]["FillDirectionMaxCells"] = 3;
G2L["72"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["72"]["CellPadding"] = UDim2.new(0, 8, 0, 8);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_14
G2L["73"] = Instance.new("TextButton", G2L["3d"]);
G2L["73"]["TextWrapped"] = true;
G2L["73"]["TextSize"] = 15;
G2L["73"]["AutoButtonColor"] = false;
G2L["73"]["TextScaled"] = true;
G2L["73"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["73"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["73"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["73"]["Text"] = [[Hospital]];
G2L["73"]["Name"] = [[Teleport_14]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_14.teleport script
G2L["74"] = Instance.new("LocalScript", G2L["73"]);
G2L["74"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_14.UICorner
G2L["75"] = Instance.new("UICorner", G2L["73"]);
G2L["75"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_14.UIStroke
G2L["76"] = Instance.new("UIStroke", G2L["73"]);
G2L["76"]["Transparency"] = 0.15;
G2L["76"]["Thickness"] = 2;
G2L["76"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["76"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.UIListLayout
G2L["77"] = Instance.new("UIListLayout", G2L["2c"]);
G2L["77"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["77"]["Padding"] = UDim.new(0, 8);
G2L["77"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2
G2L["78"] = Instance.new("Frame", G2L["26"]);
G2L["78"]["Visible"] = false;
G2L["78"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["78"]["Name"] = [[Frame2]];
G2L["78"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.LocalScript
G2L["79"] = Instance.new("LocalScript", G2L["78"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll
G2L["7a"] = Instance.new("ScrollingFrame", G2L["78"]);
G2L["7a"]["CanvasSize"] = UDim2.new(0, 0, 2, 134);
G2L["7a"]["Name"] = [[Scroll]];
G2L["7a"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["7a"]["ScrollBarThickness"] = 6;
G2L["7a"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.TextLabel
G2L["7b"] = Instance.new("TextLabel", G2L["7a"]);
G2L["7b"]["TextSize"] = 16;
G2L["7b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7b"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["7b"]["BackgroundTransparency"] = 1;
G2L["7b"]["Size"] = UDim2.new(1, -10, 0, 28);
G2L["7b"]["Text"] = [[Player]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame
G2L["7c"] = Instance.new("Frame", G2L["7a"]);
G2L["7c"]["Size"] = UDim2.new(1, -6, 0, 88);
G2L["7c"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Vehicle Fly Button
G2L["7d"] = Instance.new("TextButton", G2L["7c"]);
G2L["7d"]["TextSize"] = 15;
G2L["7d"]["AutoButtonColor"] = false;
G2L["7d"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["7d"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["7d"]["Text"] = [[Toggle Vehicle Fly]];
G2L["7d"]["Name"] = [[Vehicle Fly Button]];
G2L["7d"]["Position"] = UDim2.new(0.01656, 0, 0.09091, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Vehicle Fly Button.Vehicle Fly script
G2L["7e"] = Instance.new("LocalScript", G2L["7d"]);
G2L["7e"]["Name"] = [[Vehicle Fly script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Vehicle Fly Button.UICorner
G2L["7f"] = Instance.new("UICorner", G2L["7d"]);
G2L["7f"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Vehicle Fly Button.UIStroke
G2L["80"] = Instance.new("UIStroke", G2L["7d"]);
G2L["80"]["Transparency"] = 0.15;
G2L["80"]["Thickness"] = 2;
G2L["80"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["80"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Infinite Jump Button
G2L["81"] = Instance.new("TextButton", G2L["7c"]);
G2L["81"]["TextSize"] = 15;
G2L["81"]["AutoButtonColor"] = false;
G2L["81"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["81"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["81"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["81"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["81"]["Text"] = [[Toggle Infinite Jump]];
G2L["81"]["Name"] = [[Infinite Jump Button]];
G2L["81"]["Position"] = UDim2.new(0.00993, 0, 0.67045, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Infinite Jump Button.INFJUMP script
G2L["82"] = Instance.new("LocalScript", G2L["81"]);
G2L["82"]["Name"] = [[INFJUMP script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Infinite Jump Button.UICorner
G2L["83"] = Instance.new("UICorner", G2L["81"]);
G2L["83"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Infinite Jump Button.UIStroke
G2L["84"] = Instance.new("UIStroke", G2L["81"]);
G2L["84"]["Transparency"] = 0.15;
G2L["84"]["Thickness"] = 2;
G2L["84"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["84"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Hitbox Button
G2L["85"] = Instance.new("TextButton", G2L["7c"]);
G2L["85"]["TextSize"] = 15;
G2L["85"]["AutoButtonColor"] = false;
G2L["85"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["85"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["85"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["85"]["Size"] = UDim2.new(0.5298, -10, 0, 36);
G2L["85"]["Text"] = [[Toggle Hitbox Script]];
G2L["85"]["Name"] = [[Hitbox Button]];
G2L["85"]["Position"] = UDim2.new(0.00993, 0, 1.30682, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Hitbox Button.INFJUMP script
G2L["86"] = Instance.new("LocalScript", G2L["85"]);
G2L["86"]["Name"] = [[INFJUMP script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Hitbox Button.UICorner
G2L["87"] = Instance.new("UICorner", G2L["85"]);
G2L["87"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Hitbox Button.UIStroke
G2L["88"] = Instance.new("UIStroke", G2L["85"]);
G2L["88"]["Transparency"] = 0.15;
G2L["88"]["Thickness"] = 2;
G2L["88"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["88"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.TextBox
G2L["89"] = Instance.new("TextBox", G2L["7c"]);
G2L["89"]["BorderSizePixel"] = 0;
G2L["89"]["TextWrapped"] = true;
G2L["89"]["TextSize"] = 14;
G2L["89"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["89"]["TextScaled"] = true;
G2L["89"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["89"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["89"]["Size"] = UDim2.new(0, 83, 0, 36);
G2L["89"]["Position"] = UDim2.new(0.54967, 0, 1.30682, 0);
G2L["89"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["89"]["Text"] = [[ENTER VALUE]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.TextBox.UIStroke
G2L["8a"] = Instance.new("UIStroke", G2L["89"]);
G2L["8a"]["Transparency"] = 0.15;
G2L["8a"]["Thickness"] = 2;
G2L["8a"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["8a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.TextBox.UICorner
G2L["8b"] = Instance.new("UICorner", G2L["89"]);
G2L["8b"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.BarbCurrentFood
G2L["8c"] = Instance.new("TextLabel", G2L["7a"]);
G2L["8c"]["TextWrapped"] = true;
G2L["8c"]["BorderSizePixel"] = 0;
G2L["8c"]["TextSize"] = 28;
G2L["8c"]["TextScaled"] = true;
G2L["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8c"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8c"]["Size"] = UDim2.new(0, 292, 0, 27);
G2L["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8c"]["Text"] = [[MUST BE A BARB TO SEE THIS VALUE]];
G2L["8c"]["Name"] = [[BarbCurrentFood]];
G2L["8c"]["Position"] = UDim2.new(0.02, 0, 0.25, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.BarbCurrentFood.LocalScript
G2L["8d"] = Instance.new("LocalScript", G2L["8c"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.HUNGERLabel
G2L["8e"] = Instance.new("TextLabel", G2L["7a"]);
G2L["8e"]["BorderSizePixel"] = 0;
G2L["8e"]["TextSize"] = 28;
G2L["8e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8e"]["Size"] = UDim2.new(0, 292, 0, 27);
G2L["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8e"]["Text"] = [[HUNGER: ]];
G2L["8e"]["Name"] = [[HUNGERLabel]];
G2L["8e"]["Position"] = UDim2.new(0.02, 0, 0.3, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.HUNGERLabel.LocalScript
G2L["8f"] = Instance.new("LocalScript", G2L["8e"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.HealthLabel
G2L["90"] = Instance.new("TextLabel", G2L["7a"]);
G2L["90"]["BorderSizePixel"] = 0;
G2L["90"]["TextSize"] = 28;
G2L["90"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["90"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["90"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["90"]["Size"] = UDim2.new(0, 292, 0, 27);
G2L["90"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["90"]["Text"] = [[HEALTH: ]];
G2L["90"]["Name"] = [[HealthLabel]];
G2L["90"]["Position"] = UDim2.new(0.02, 0, 0.35, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.HealthLabel.LocalScript
G2L["91"] = Instance.new("LocalScript", G2L["90"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.MoneyLabel
G2L["92"] = Instance.new("TextLabel", G2L["7a"]);
G2L["92"]["TextWrapped"] = true;
G2L["92"]["BorderSizePixel"] = 0;
G2L["92"]["TextSize"] = 28;
G2L["92"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["92"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["92"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["92"]["Size"] = UDim2.new(0, 292, 0, 27);
G2L["92"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["92"]["Text"] = [[MONEY:]];
G2L["92"]["Name"] = [[MoneyLabel]];
G2L["92"]["Position"] = UDim2.new(0.02, 0, 0.4, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.MoneyLabel.LocalScript
G2L["93"] = Instance.new("LocalScript", G2L["92"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3
G2L["94"] = Instance.new("Frame", G2L["26"]);
G2L["94"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["94"]["Name"] = [[Frame3]];
G2L["94"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.LocalScript
G2L["95"] = Instance.new("LocalScript", G2L["94"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll
G2L["96"] = Instance.new("ScrollingFrame", G2L["94"]);
G2L["96"]["CanvasSize"] = UDim2.new(0, 0, 0, 85);
G2L["96"]["Name"] = [[Scroll]];
G2L["96"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["96"]["Size"] = UDim2.new(1.05195, 0, 1.03623, 0);
G2L["96"]["Position"] = UDim2.new(-0.03247, 0, 0, 0);
G2L["96"]["ScrollBarThickness"] = 6;
G2L["96"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.TextLabel
G2L["97"] = Instance.new("TextLabel", G2L["96"]);
G2L["97"]["TextSize"] = 16;
G2L["97"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["97"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["97"]["BackgroundTransparency"] = 1;
G2L["97"]["Size"] = UDim2.new(1, -10, 0, 28);
G2L["97"]["Text"] = [[Extras]];
G2L["97"]["Position"] = UDim2.new(0.01235, 0, -0.00699, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame
G2L["98"] = Instance.new("Frame", G2L["96"]);
G2L["98"]["Size"] = UDim2.new(1, -6, 0, 36);
G2L["98"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.Server Invis
G2L["99"] = Instance.new("TextButton", G2L["98"]);
G2L["99"]["TextSize"] = 15;
G2L["99"]["AutoButtonColor"] = false;
G2L["99"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["99"]["BackgroundColor3"] = Color3.fromRGB(255, 216, 241);
G2L["99"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["99"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["99"]["Text"] = [[Server Invisibility (only visible to others)]];
G2L["99"]["Name"] = [[Server Invis]];
G2L["99"]["Position"] = UDim2.new(0.03, 0, 0.72222, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.Server Invis.desync toggle
G2L["9a"] = Instance.new("LocalScript", G2L["99"]);
G2L["9a"]["Name"] = [[desync toggle]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.Server Invis.UICorner
G2L["9b"] = Instance.new("UICorner", G2L["99"]);
G2L["9b"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.Server Invis.UIStroke
G2L["9c"] = Instance.new("UIStroke", G2L["99"]);
G2L["9c"]["Transparency"] = 0.15;
G2L["9c"]["Thickness"] = 2;
G2L["9c"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["9c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM
G2L["9d"] = Instance.new("TextButton", G2L["98"]);
G2L["9d"]["TextSize"] = 15;
G2L["9d"]["AutoButtonColor"] = false;
G2L["9d"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["9d"]["BackgroundColor3"] = Color3.fromRGB(255, 216, 241);
G2L["9d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["9d"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["9d"]["Text"] = [[Barbarian Autofarm (Auto Steal Food)]];
G2L["9d"]["Name"] = [[BARB AUTOFARM]];
G2L["9d"]["Position"] = UDim2.new(0.03, 0, 2.94444, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.desync toggle
G2L["9e"] = Instance.new("LocalScript", G2L["9d"]);
G2L["9e"]["Name"] = [[desync toggle]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.LocalScript
G2L["9f"] = Instance.new("LocalScript", G2L["9d"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.setvalues
G2L["a0"] = Instance.new("LocalScript", G2L["9d"]);
G2L["a0"]["Name"] = [[setvalues]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.prevent errors
G2L["a1"] = Instance.new("LocalScript", G2L["9d"]);
G2L["a1"]["Name"] = [[prevent errors]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.UICorner
G2L["a2"] = Instance.new("UICorner", G2L["9d"]);
G2L["a2"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.UIStroke
G2L["a3"] = Instance.new("UIStroke", G2L["9d"]);
G2L["a3"]["Transparency"] = 0.15;
G2L["a3"]["Thickness"] = 2;
G2L["a3"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["a3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.RefillingFood
G2L["a4"] = Instance.new("BoolValue", G2L["9d"]);
G2L["a4"]["Name"] = [[RefillingFood]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.RefillingFood.LocalScript
G2L["a5"] = Instance.new("LocalScript", G2L["a4"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.EmptyingFood
G2L["a6"] = Instance.new("BoolValue", G2L["9d"]);
G2L["a6"]["Name"] = [[EmptyingFood]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.EmptyingFood.LocalScript
G2L["a7"] = Instance.new("LocalScript", G2L["a6"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.IsOn
G2L["a8"] = Instance.new("BoolValue", G2L["9d"]);
G2L["a8"]["Name"] = [[IsOn]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM
G2L["a9"] = Instance.new("TextButton", G2L["98"]);
G2L["a9"]["TextSize"] = 15;
G2L["a9"]["AutoButtonColor"] = false;
G2L["a9"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["a9"]["BackgroundColor3"] = Color3.fromRGB(255, 216, 241);
G2L["a9"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["a9"]["Size"] = UDim2.new(0.5447, -10, 0, 36);
G2L["a9"]["Text"] = [[AUTOTEAM]];
G2L["a9"]["Name"] = [[AUTOTEAM]];
G2L["a9"]["Position"] = UDim2.new(0.03, 0, 5.8, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.button toggled
G2L["aa"] = Instance.new("LocalScript", G2L["a9"]);
G2L["aa"]["Name"] = [[button toggled]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.setting values
G2L["ab"] = Instance.new("LocalScript", G2L["a9"]);
G2L["ab"]["Name"] = [[setting values]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.proximity script
G2L["ac"] = Instance.new("LocalScript", G2L["a9"]);
G2L["ac"]["Name"] = [[proximity script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.teleport char script
G2L["ad"] = Instance.new("LocalScript", G2L["a9"]);
G2L["ad"]["Name"] = [[teleport char script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame
G2L["ae"] = Instance.new("ScrollingFrame", G2L["a9"]);
G2L["ae"]["Visible"] = false;
G2L["ae"]["Active"] = true;
G2L["ae"]["BorderSizePixel"] = 0;
G2L["ae"]["CanvasSize"] = UDim2.new(0, 0, 7, 0);
G2L["ae"]["BackgroundColor3"] = Color3.fromRGB(161, 162, 162);
G2L["ae"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["ae"]["Size"] = UDim2.new(0, 150, 0, 50);
G2L["ae"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["ae"]["Position"] = UDim2.new(1.05502, 0, 0, 0);
G2L["ae"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.visiblescript
G2L["af"] = Instance.new("LocalScript", G2L["ae"]);
G2L["af"]["Name"] = [[visiblescript]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.BARBARIAN
G2L["b0"] = Instance.new("TextButton", G2L["ae"]);
G2L["b0"]["BorderSizePixel"] = 0;
G2L["b0"]["TextSize"] = 20;
G2L["b0"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b0"]["BackgroundColor3"] = Color3.fromRGB(87, 37, 37);
G2L["b0"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b0"]["Size"] = UDim2.new(0, 150, 0, 30);
G2L["b0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b0"]["Text"] = [[BARBARIAN]];
G2L["b0"]["Name"] = [[BARBARIAN]];
G2L["b0"]["Position"] = UDim2.new(0, 0, -0.008, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.BARBARIAN.LocalScript
G2L["b1"] = Instance.new("LocalScript", G2L["b0"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.PEASANT
G2L["b2"] = Instance.new("TextButton", G2L["ae"]);
G2L["b2"]["BorderSizePixel"] = 0;
G2L["b2"]["TextSize"] = 20;
G2L["b2"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b2"]["BackgroundColor3"] = Color3.fromRGB(107, 58, 10);
G2L["b2"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b2"]["Size"] = UDim2.new(0, 150, 0, 30);
G2L["b2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b2"]["Text"] = [[PEASANT]];
G2L["b2"]["Name"] = [[PEASANT]];
G2L["b2"]["Position"] = UDim2.new(0, 0, 0.75, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.PEASANT.LocalScript
G2L["b3"] = Instance.new("LocalScript", G2L["b2"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.CIVILIAN
G2L["b4"] = Instance.new("TextButton", G2L["ae"]);
G2L["b4"]["BorderSizePixel"] = 0;
G2L["b4"]["TextSize"] = 20;
G2L["b4"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b4"]["BackgroundColor3"] = Color3.fromRGB(34, 85, 186);
G2L["b4"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b4"]["Size"] = UDim2.new(0, 150, 0, 30);
G2L["b4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b4"]["Text"] = [[CIVILIAN]];
G2L["b4"]["Name"] = [[CIVILIAN]];
G2L["b4"]["Position"] = UDim2.new(0, 0, 1.5, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.CIVILIAN.LocalScript
G2L["b5"] = Instance.new("LocalScript", G2L["b4"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.Tp on
G2L["b6"] = Instance.new("BoolValue", G2L["a9"]);
G2L["b6"]["Name"] = [[Tp on]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.Role
G2L["b7"] = Instance.new("StringValue", G2L["a9"]);
G2L["b7"]["Name"] = [[Role]];
G2L["b7"]["Value"] = [[None]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.autoteamselectedprompt
G2L["b8"] = Instance.new("TextLabel", G2L["a9"]);
G2L["b8"]["TextWrapped"] = true;
G2L["b8"]["BorderSizePixel"] = 0;
G2L["b8"]["TextSize"] = 14;
G2L["b8"]["TextScaled"] = true;
G2L["b8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b8"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b8"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b8"]["BackgroundTransparency"] = 1;
G2L["b8"]["Size"] = UDim2.new(0, 155, 0, 31);
G2L["b8"]["Visible"] = false;
G2L["b8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b8"]["Text"] = [[AUTOTEAM SELECTED: N/A]];
G2L["b8"]["Name"] = [[autoteamselectedprompt]];
G2L["b8"]["Position"] = UDim2.new(0, 0, 1, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.autoteamselectedprompt.LocalScript
G2L["b9"] = Instance.new("LocalScript", G2L["b8"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.autoteamselectedprompt.visiblescript
G2L["ba"] = Instance.new("LocalScript", G2L["b8"]);
G2L["ba"]["Name"] = [[visiblescript]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.Path
G2L["bb"] = Instance.new("StringValue", G2L["a9"]);
G2L["bb"]["Name"] = [[Path]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.tpvalue
G2L["bc"] = Instance.new("StringValue", G2L["a9"]);
G2L["bc"]["Name"] = [[tpvalue]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.UICorner
G2L["bd"] = Instance.new("UICorner", G2L["a9"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.UIStroke
G2L["be"] = Instance.new("UIStroke", G2L["a9"]);
G2L["be"]["Transparency"] = 0.15;
G2L["be"]["Thickness"] = 2;
G2L["be"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["be"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AXE AUTOFARM
G2L["bf"] = Instance.new("TextButton", G2L["98"]);
G2L["bf"]["TextWrapped"] = true;
G2L["bf"]["TextSize"] = 15;
G2L["bf"]["AutoButtonColor"] = false;
G2L["bf"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["bf"]["BackgroundColor3"] = Color3.fromRGB(255, 216, 241);
G2L["bf"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["bf"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["bf"]["Text"] = [[Axe Autofarm (MUST HAVE PEASANT AUTOTEAM ON!!!)]];
G2L["bf"]["Name"] = [[AXE AUTOFARM]];
G2L["bf"]["Position"] = UDim2.new(0.03, 0, 4.27778, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AXE AUTOFARM.UICorner
G2L["c0"] = Instance.new("UICorner", G2L["bf"]);
G2L["c0"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AXE AUTOFARM.UIStroke
G2L["c1"] = Instance.new("UIStroke", G2L["bf"]);
G2L["c1"]["Transparency"] = 0.15;
G2L["c1"]["Thickness"] = 2;
G2L["c1"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["c1"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AXE AUTOFARM.LocalScript
G2L["c2"] = Instance.new("LocalScript", G2L["bf"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.TextLabel
G2L["c3"] = Instance.new("TextLabel", G2L["96"]);
G2L["c3"]["TextWrapped"] = true;
G2L["c3"]["TextSize"] = 15;
G2L["c3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["c3"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["c3"]["BackgroundTransparency"] = 1;
G2L["c3"]["Size"] = UDim2.new(1, -10, 0.03496, 28);
G2L["c3"]["Text"] = [[Known Supported Executors:             Macsploit, ]];
G2L["c3"]["Position"] = UDim2.new(0, 0, 0.23776, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4
G2L["c4"] = Instance.new("Frame", G2L["26"]);
G2L["c4"]["Visible"] = false;
G2L["c4"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["c4"]["Name"] = [[Frame4]];
G2L["c4"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.LocalScript
G2L["c5"] = Instance.new("LocalScript", G2L["c4"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll
G2L["c6"] = Instance.new("ScrollingFrame", G2L["c4"]);
G2L["c6"]["CanvasSize"] = UDim2.new(0, 0, 0, 82);
G2L["c6"]["Name"] = [[Scroll]];
G2L["c6"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["c6"]["ScrollBarThickness"] = 6;
G2L["c6"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.Frame
G2L["c7"] = Instance.new("Frame", G2L["c6"]);
G2L["c7"]["Size"] = UDim2.new(1, -6, 0.88043, 36);
G2L["c7"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.Frame.TextLabel
G2L["c8"] = Instance.new("TextLabel", G2L["c7"]);
G2L["c8"]["TextWrapped"] = true;
G2L["c8"]["TextSize"] = 11;
G2L["c8"]["TextScaled"] = true;
G2L["c8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["c8"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["c8"]["BackgroundTransparency"] = 1;
G2L["c8"]["Size"] = UDim2.new(1, -10, 0.14695, 28);
G2L["c8"]["Text"] = [[Script made by ash, discord: nattykol any suggestions? Join my dc server!]];
G2L["c8"]["Position"] = UDim2.new(0, 0, 0.13371, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.Frame.Copy dc link
G2L["c9"] = Instance.new("TextButton", G2L["c7"]);
G2L["c9"]["TextSize"] = 20;
G2L["c9"]["AutoButtonColor"] = false;
G2L["c9"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["c9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["c9"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["c9"]["Text"] = [[Copy Discord]];
G2L["c9"]["Name"] = [[Copy dc link]];
G2L["c9"]["Position"] = UDim2.new(0, 0, 0.4, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.Frame.Copy dc link.copy link script
G2L["ca"] = Instance.new("LocalScript", G2L["c9"]);
G2L["ca"]["Name"] = [[copy link script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.Frame.Copy dc link.UICorner
G2L["cb"] = Instance.new("UICorner", G2L["c9"]);
G2L["cb"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.Frame.Copy dc link.UIStroke
G2L["cc"] = Instance.new("UIStroke", G2L["c9"]);
G2L["cc"]["Transparency"] = 0.15;
G2L["cc"]["Thickness"] = 2;
G2L["cc"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["cc"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.TextLabel
G2L["cd"] = Instance.new("TextLabel", G2L["c6"]);
G2L["cd"]["TextSize"] = 24;
G2L["cd"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["cd"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["cd"]["BackgroundTransparency"] = 1;
G2L["cd"]["Size"] = UDim2.new(1, -10, 0, 28);
G2L["cd"]["Text"] = [[Credits]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.UIListLayout
G2L["ce"] = Instance.new("UIListLayout", G2L["c6"]);
G2L["ce"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["ce"]["Padding"] = UDim.new(0, 8);
G2L["ce"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5
G2L["cf"] = Instance.new("Frame", G2L["26"]);
G2L["cf"]["Visible"] = false;
G2L["cf"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["cf"]["Name"] = [[Frame5]];
G2L["cf"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.LocalScript
G2L["d0"] = Instance.new("LocalScript", G2L["cf"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll
G2L["d1"] = Instance.new("ScrollingFrame", G2L["cf"]);
G2L["d1"]["CanvasSize"] = UDim2.new(0, 0, 0, 82);
G2L["d1"]["Name"] = [[Scroll]];
G2L["d1"]["Size"] = UDim2.new(1.05195, 0, 1, 0);
G2L["d1"]["Position"] = UDim2.new(-0.03247, 0, 0, 0);
G2L["d1"]["ScrollBarThickness"] = 6;
G2L["d1"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI
G2L["d2"] = Instance.new("Frame", G2L["d1"]);
G2L["d2"]["Size"] = UDim2.new(1, -6, 0.88043, 36);
G2L["d2"]["Name"] = [[GUI]];
G2L["d2"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change to Dark Mode
G2L["d3"] = Instance.new("TextButton", G2L["d2"]);
G2L["d3"]["TextSize"] = 20;
G2L["d3"]["AutoButtonColor"] = false;
G2L["d3"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["d3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["d3"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["d3"]["Text"] = [[Dark Mode]];
G2L["d3"]["Name"] = [[Change to Dark Mode]];
G2L["d3"]["Position"] = UDim2.new(0.01572, 0, 0.16344, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change to Dark Mode.ui color script
G2L["d4"] = Instance.new("LocalScript", G2L["d3"]);
G2L["d4"]["Name"] = [[ui color script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change to Dark Mode.UICorner
G2L["d5"] = Instance.new("UICorner", G2L["d3"]);
G2L["d5"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change to Dark Mode.UIStroke
G2L["d6"] = Instance.new("UIStroke", G2L["d3"]);
G2L["d6"]["Transparency"] = 0.15;
G2L["d6"]["Thickness"] = 2;
G2L["d6"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["d6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change Text Rainbow
G2L["d7"] = Instance.new("TextButton", G2L["d2"]);
G2L["d7"]["TextSize"] = 20;
G2L["d7"]["AutoButtonColor"] = false;
G2L["d7"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["d7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["d7"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["d7"]["Text"] = [[Rainbow Text]];
G2L["d7"]["Name"] = [[Change Text Rainbow]];
G2L["d7"]["Position"] = UDim2.new(0.02201, 0, 0.33548, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change Text Rainbow.text color change script
G2L["d8"] = Instance.new("LocalScript", G2L["d7"]);
G2L["d8"]["Name"] = [[text color change script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change Text Rainbow.UICorner
G2L["d9"] = Instance.new("UICorner", G2L["d7"]);
G2L["d9"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change Text Rainbow.UIStroke
G2L["da"] = Instance.new("UIStroke", G2L["d7"]);
G2L["da"]["Transparency"] = 0.15;
G2L["da"]["Thickness"] = 2;
G2L["da"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["da"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI THEMES
G2L["db"] = Instance.new("TextLabel", G2L["d1"]);
G2L["db"]["TextSize"] = 24;
G2L["db"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["db"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["db"]["BackgroundTransparency"] = 1;
G2L["db"]["Size"] = UDim2.new(1.0974, -10, 0, 28);
G2L["db"]["Text"] = [[GUI THEMES]];
G2L["db"]["Name"] = [[GUI THEMES]];
G2L["db"]["Position"] = UDim2.new(-0.03247, 0, 0.01449, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.Keybinds
G2L["dc"] = Instance.new("TextLabel", G2L["d1"]);
G2L["dc"]["TextSize"] = 24;
G2L["dc"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["dc"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["dc"]["BackgroundTransparency"] = 1;
G2L["dc"]["Size"] = UDim2.new(1.0974, -10, 0, 28);
G2L["dc"]["Text"] = [[Keybinds Coming Soon]];
G2L["dc"]["Name"] = [[Keybinds]];
G2L["dc"]["Position"] = UDim2.new(-0.03247, 0, 0.55797, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.UIListLayout
G2L["dd"] = Instance.new("UIListLayout", G2L["d1"]);
G2L["dd"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["dd"]["Padding"] = UDim.new(0, 8);
G2L["dd"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6
G2L["de"] = Instance.new("Frame", G2L["26"]);
G2L["de"]["Visible"] = false;
G2L["de"]["Size"] = UDim2.new(1.08442, 0, 1, 0);
G2L["de"]["Position"] = UDim2.new(-0.03247, 0, 0, 0);
G2L["de"]["Name"] = [[Frame6]];
G2L["de"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.LocalScript
G2L["df"] = Instance.new("LocalScript", G2L["de"]);



-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll
G2L["e0"] = Instance.new("ScrollingFrame", G2L["de"]);
G2L["e0"]["CanvasSize"] = UDim2.new(0, 0, 3, 2);
G2L["e0"]["Name"] = [[Scroll]];
G2L["e0"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["e0"]["Size"] = UDim2.new(0.97904, 0, 1, 1);
G2L["e0"]["Position"] = UDim2.new(0.02096, 0, 0, 0);
G2L["e0"]["ScrollBarThickness"] = 6;
G2L["e0"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.TextLabel
G2L["e1"] = Instance.new("TextLabel", G2L["e0"]);
G2L["e1"]["TextSize"] = 16;
G2L["e1"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["e1"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["e1"]["BackgroundTransparency"] = 1;
G2L["e1"]["Size"] = UDim2.new(1, -10, 0, 28);
G2L["e1"]["Text"] = [[Auto Buy]];
G2L["e1"]["Position"] = UDim2.new(0.01529, 0, 0.97762, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame
G2L["e2"] = Instance.new("Frame", G2L["e0"]);
G2L["e2"]["Size"] = UDim2.new(1, -6, 0.2852, 184);
G2L["e2"]["Position"] = UDim2.new(0.00917, 0, 0, 0);
G2L["e2"]["BackgroundTransparency"] = 1;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_1
G2L["e3"] = Instance.new("TextButton", G2L["e2"]);
G2L["e3"]["TextWrapped"] = true;
G2L["e3"]["TextSize"] = 15;
G2L["e3"]["AutoButtonColor"] = false;
G2L["e3"]["TextScaled"] = true;
G2L["e3"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["e3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["e3"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["e3"]["Text"] = [[Basic Food]];
G2L["e3"]["Name"] = [[Teleport_1]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_1.esp script
G2L["e4"] = Instance.new("LocalScript", G2L["e3"]);
G2L["e4"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_1.UICorner
G2L["e5"] = Instance.new("UICorner", G2L["e3"]);
G2L["e5"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_1.UIStroke
G2L["e6"] = Instance.new("UIStroke", G2L["e3"]);
G2L["e6"]["Transparency"] = 0.15;
G2L["e6"]["Thickness"] = 2;
G2L["e6"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["e6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_2
G2L["e7"] = Instance.new("TextButton", G2L["e2"]);
G2L["e7"]["TextWrapped"] = true;
G2L["e7"]["TextSize"] = 15;
G2L["e7"]["AutoButtonColor"] = false;
G2L["e7"]["TextScaled"] = true;
G2L["e7"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["e7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["e7"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["e7"]["Text"] = [[Good Food]];
G2L["e7"]["Name"] = [[Teleport_2]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_2.esp script
G2L["e8"] = Instance.new("LocalScript", G2L["e7"]);
G2L["e8"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_2.UICorner
G2L["e9"] = Instance.new("UICorner", G2L["e7"]);
G2L["e9"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_2.UIStroke
G2L["ea"] = Instance.new("UIStroke", G2L["e7"]);
G2L["ea"]["Transparency"] = 0.15;
G2L["ea"]["Thickness"] = 2;
G2L["ea"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["ea"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_3
G2L["eb"] = Instance.new("TextButton", G2L["e2"]);
G2L["eb"]["TextWrapped"] = true;
G2L["eb"]["TextSize"] = 15;
G2L["eb"]["AutoButtonColor"] = false;
G2L["eb"]["TextScaled"] = true;
G2L["eb"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["eb"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["eb"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["eb"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["eb"]["Text"] = [[Best Food]];
G2L["eb"]["Name"] = [[Teleport_3]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_3.teleport script
G2L["ec"] = Instance.new("LocalScript", G2L["eb"]);
G2L["ec"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_3.UICorner
G2L["ed"] = Instance.new("UICorner", G2L["eb"]);
G2L["ed"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_3.UIStroke
G2L["ee"] = Instance.new("UIStroke", G2L["eb"]);
G2L["ee"]["Transparency"] = 0.15;
G2L["ee"]["Thickness"] = 2;
G2L["ee"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["ee"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_4
G2L["ef"] = Instance.new("TextButton", G2L["e2"]);
G2L["ef"]["TextWrapped"] = true;
G2L["ef"]["TextSize"] = 15;
G2L["ef"]["AutoButtonColor"] = false;
G2L["ef"]["TextScaled"] = true;
G2L["ef"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["ef"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["ef"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["ef"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["ef"]["Text"] = [[Heal]];
G2L["ef"]["Name"] = [[Teleport_4]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_4.teleport script
G2L["f0"] = Instance.new("LocalScript", G2L["ef"]);
G2L["f0"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_4.UICorner
G2L["f1"] = Instance.new("UICorner", G2L["ef"]);
G2L["f1"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_4.UIStroke
G2L["f2"] = Instance.new("UIStroke", G2L["ef"]);
G2L["f2"]["Transparency"] = 0.15;
G2L["f2"]["Thickness"] = 2;
G2L["f2"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["f2"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_5
G2L["f3"] = Instance.new("TextButton", G2L["e2"]);
G2L["f3"]["TextWrapped"] = true;
G2L["f3"]["TextSize"] = 15;
G2L["f3"]["AutoButtonColor"] = false;
G2L["f3"]["TextScaled"] = true;
G2L["f3"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["f3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["f3"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["f3"]["Text"] = [[Limbs]];
G2L["f3"]["Name"] = [[Teleport_5]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_5.teleport script
G2L["f4"] = Instance.new("LocalScript", G2L["f3"]);
G2L["f4"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_5.UICorner
G2L["f5"] = Instance.new("UICorner", G2L["f3"]);
G2L["f5"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_5.UIStroke
G2L["f6"] = Instance.new("UIStroke", G2L["f3"]);
G2L["f6"]["Transparency"] = 0.15;
G2L["f6"]["Thickness"] = 2;
G2L["f6"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["f6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_6
G2L["f7"] = Instance.new("TextButton", G2L["e2"]);
G2L["f7"]["TextWrapped"] = true;
G2L["f7"]["TextSize"] = 15;
G2L["f7"]["AutoButtonColor"] = false;
G2L["f7"]["TextScaled"] = true;
G2L["f7"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["f7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["f7"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["f7"]["Text"] = [[Wheelchair]];
G2L["f7"]["Name"] = [[Teleport_6]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_6.teleport script
G2L["f8"] = Instance.new("LocalScript", G2L["f7"]);
G2L["f8"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_6.UICorner
G2L["f9"] = Instance.new("UICorner", G2L["f7"]);
G2L["f9"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_6.UIStroke
G2L["fa"] = Instance.new("UIStroke", G2L["f7"]);
G2L["fa"]["Transparency"] = 0.15;
G2L["fa"]["Thickness"] = 2;
G2L["fa"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["fa"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_7
G2L["fb"] = Instance.new("TextButton", G2L["e2"]);
G2L["fb"]["TextWrapped"] = true;
G2L["fb"]["TextSize"] = 15;
G2L["fb"]["AutoButtonColor"] = false;
G2L["fb"]["TextScaled"] = true;
G2L["fb"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["fb"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["fb"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["fb"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["fb"]["Text"] = [[Basic Fishing Net]];
G2L["fb"]["Name"] = [[Teleport_7]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_7.teleport script
G2L["fc"] = Instance.new("LocalScript", G2L["fb"]);
G2L["fc"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_7.UICorner
G2L["fd"] = Instance.new("UICorner", G2L["fb"]);
G2L["fd"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_7.UIStroke
G2L["fe"] = Instance.new("UIStroke", G2L["fb"]);
G2L["fe"]["Transparency"] = 0.15;
G2L["fe"]["Thickness"] = 2;
G2L["fe"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["fe"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_8
G2L["ff"] = Instance.new("TextButton", G2L["e2"]);
G2L["ff"]["TextWrapped"] = true;
G2L["ff"]["TextSize"] = 15;
G2L["ff"]["AutoButtonColor"] = false;
G2L["ff"]["TextScaled"] = true;
G2L["ff"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["ff"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["ff"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["ff"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["ff"]["Text"] = [[Good Fishing Net]];
G2L["ff"]["Name"] = [[Teleport_8]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_8.teleport script
G2L["100"] = Instance.new("LocalScript", G2L["ff"]);
G2L["100"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_8.UICorner
G2L["101"] = Instance.new("UICorner", G2L["ff"]);
G2L["101"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_8.UIStroke
G2L["102"] = Instance.new("UIStroke", G2L["ff"]);
G2L["102"]["Transparency"] = 0.15;
G2L["102"]["Thickness"] = 2;
G2L["102"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["102"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_9
G2L["103"] = Instance.new("TextButton", G2L["e2"]);
G2L["103"]["TextWrapped"] = true;
G2L["103"]["TextSize"] = 15;
G2L["103"]["AutoButtonColor"] = false;
G2L["103"]["TextScaled"] = true;
G2L["103"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["103"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["103"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["103"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["103"]["Text"] = [[Best Fishing Net]];
G2L["103"]["Name"] = [[Teleport_9]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_9.teleport script
G2L["104"] = Instance.new("LocalScript", G2L["103"]);
G2L["104"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_9.UICorner
G2L["105"] = Instance.new("UICorner", G2L["103"]);
G2L["105"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_9.UIStroke
G2L["106"] = Instance.new("UIStroke", G2L["103"]);
G2L["106"]["Transparency"] = 0.15;
G2L["106"]["Thickness"] = 2;
G2L["106"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["106"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_10
G2L["107"] = Instance.new("TextButton", G2L["e2"]);
G2L["107"]["TextWrapped"] = true;
G2L["107"]["TextSize"] = 15;
G2L["107"]["AutoButtonColor"] = false;
G2L["107"]["TextScaled"] = true;
G2L["107"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["107"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["107"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["107"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["107"]["Text"] = [[Basic Axe]];
G2L["107"]["Name"] = [[Teleport_10]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_10.teleport script
G2L["108"] = Instance.new("LocalScript", G2L["107"]);
G2L["108"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_10.UICorner
G2L["109"] = Instance.new("UICorner", G2L["107"]);
G2L["109"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_10.UIStroke
G2L["10a"] = Instance.new("UIStroke", G2L["107"]);
G2L["10a"]["Transparency"] = 0.15;
G2L["10a"]["Thickness"] = 2;
G2L["10a"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["10a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_11
G2L["10b"] = Instance.new("TextButton", G2L["e2"]);
G2L["10b"]["TextWrapped"] = true;
G2L["10b"]["TextSize"] = 15;
G2L["10b"]["AutoButtonColor"] = false;
G2L["10b"]["TextScaled"] = true;
G2L["10b"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["10b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["10b"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["10b"]["Text"] = [[Good Axe]];
G2L["10b"]["Name"] = [[Teleport_11]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_11.teleport script
G2L["10c"] = Instance.new("LocalScript", G2L["10b"]);
G2L["10c"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_11.UICorner
G2L["10d"] = Instance.new("UICorner", G2L["10b"]);
G2L["10d"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_11.UIStroke
G2L["10e"] = Instance.new("UIStroke", G2L["10b"]);
G2L["10e"]["Transparency"] = 0.15;
G2L["10e"]["Thickness"] = 2;
G2L["10e"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["10e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_12
G2L["10f"] = Instance.new("TextButton", G2L["e2"]);
G2L["10f"]["TextWrapped"] = true;
G2L["10f"]["TextSize"] = 15;
G2L["10f"]["AutoButtonColor"] = false;
G2L["10f"]["TextScaled"] = true;
G2L["10f"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["10f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10f"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["10f"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["10f"]["Text"] = [[Best Axe]];
G2L["10f"]["Name"] = [[Teleport_12]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_12.teleport script
G2L["110"] = Instance.new("LocalScript", G2L["10f"]);
G2L["110"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_12.UICorner
G2L["111"] = Instance.new("UICorner", G2L["10f"]);
G2L["111"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_12.UIStroke
G2L["112"] = Instance.new("UIStroke", G2L["10f"]);
G2L["112"]["Transparency"] = 0.15;
G2L["112"]["Thickness"] = 2;
G2L["112"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["112"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_13
G2L["113"] = Instance.new("TextButton", G2L["e2"]);
G2L["113"]["TextWrapped"] = true;
G2L["113"]["TextSize"] = 15;
G2L["113"]["AutoButtonColor"] = false;
G2L["113"]["TextScaled"] = true;
G2L["113"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["113"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["113"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["113"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["113"]["Text"] = [[Bow]];
G2L["113"]["Name"] = [[Teleport_13]];
G2L["113"]["Position"] = UDim2.new(0.02318, 0, -0.21739, 0);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_13.esp script
G2L["114"] = Instance.new("LocalScript", G2L["113"]);
G2L["114"]["Name"] = [[esp script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_13.UICorner
G2L["115"] = Instance.new("UICorner", G2L["113"]);
G2L["115"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_13.UIStroke
G2L["116"] = Instance.new("UIStroke", G2L["113"]);
G2L["116"]["Transparency"] = 0.15;
G2L["116"]["Thickness"] = 2;
G2L["116"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["116"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_14
G2L["117"] = Instance.new("TextButton", G2L["e2"]);
G2L["117"]["TextWrapped"] = true;
G2L["117"]["TextSize"] = 15;
G2L["117"]["AutoButtonColor"] = false;
G2L["117"]["TextScaled"] = true;
G2L["117"]["TextColor3"] = Color3.fromRGB(61, 41, 61);
G2L["117"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["117"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["117"]["Size"] = UDim2.new(1, -10, 0, 36);
G2L["117"]["Text"] = [[Bomb]];
G2L["117"]["Name"] = [[Teleport_14]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_14.teleport script
G2L["118"] = Instance.new("LocalScript", G2L["117"]);
G2L["118"]["Name"] = [[teleport script]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_14.UICorner
G2L["119"] = Instance.new("UICorner", G2L["117"]);
G2L["119"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_14.UIStroke
G2L["11a"] = Instance.new("UIStroke", G2L["117"]);
G2L["11a"]["Transparency"] = 0.15;
G2L["11a"]["Thickness"] = 2;
G2L["11a"]["Color"] = Color3.fromRGB(255, 121, 191);
G2L["11a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.UIGridLayout
G2L["11b"] = Instance.new("UIGridLayout", G2L["e2"]);
G2L["11b"]["CellSize"] = UDim2.new(0.33333, -12, 0, 36);
G2L["11b"]["FillDirectionMaxCells"] = 3;
G2L["11b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["11b"]["CellPadding"] = UDim2.new(0, 8, 0, 8);


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.UIListLayout
G2L["11c"] = Instance.new("UIListLayout", G2L["e0"]);
G2L["11c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["11c"]["Padding"] = UDim.new(0, 8);
G2L["11c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.#1 GRG Script.Main.UIDragDetector
G2L["11d"] = Instance.new("UIDragDetector", G2L["2"]);



-- StarterGui.#1 GRG Script.Main.Close
G2L["11e"] = Instance.new("TextButton", G2L["2"]);
G2L["11e"]["BorderSizePixel"] = 0;
G2L["11e"]["TextSize"] = 48;
G2L["11e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11e"]["BackgroundTransparency"] = 1;
G2L["11e"]["Size"] = UDim2.new(0, 28, 0, 23);
G2L["11e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11e"]["Text"] = [[X]];
G2L["11e"]["Name"] = [[Close]];
G2L["11e"]["Position"] = UDim2.new(0.92222, 0, 0.01389, 0);


-- StarterGui.#1 GRG Script.Main.Close.LocalScript
G2L["11f"] = Instance.new("LocalScript", G2L["11e"]);



-- StarterGui.#1 GRG Script.ESPGui
G2L["120"] = Instance.new("BoolValue", G2L["1"]);
G2L["120"]["Name"] = [[ESPGui]];
G2L["120"]["Value"] = true;


-- StarterGui.#1 GRG Script.PlayerGui
G2L["121"] = Instance.new("BoolValue", G2L["1"]);
G2L["121"]["Name"] = [[PlayerGui]];


-- StarterGui.#1 GRG Script.ExtrasGui
G2L["122"] = Instance.new("BoolValue", G2L["1"]);
G2L["122"]["Name"] = [[ExtrasGui]];


-- StarterGui.#1 GRG Script.UIDragDetector
G2L["123"] = Instance.new("UIDragDetector", G2L["1"]);



-- StarterGui.#1 GRG Script.GUItoggled
G2L["124"] = Instance.new("BoolValue", G2L["1"]);
G2L["124"]["Name"] = [[GUItoggled]];
G2L["124"]["Value"] = true;


-- StarterGui.#1 GRG Script.Open
G2L["125"] = Instance.new("TextButton", G2L["1"]);
G2L["125"]["BorderSizePixel"] = 0;
G2L["125"]["TextSize"] = 27;
G2L["125"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["125"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["125"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["125"]["Size"] = UDim2.new(0, 96, 0, 43);
G2L["125"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["125"]["Text"] = [[Open]];
G2L["125"]["Name"] = [[Open]];
G2L["125"]["Visible"] = false;
G2L["125"]["Position"] = UDim2.new(0, 0, 0.60355, 0);


-- StarterGui.#1 GRG Script.Open.LocalScript
G2L["126"] = Instance.new("LocalScript", G2L["125"]);



-- StarterGui.#1 GRG Script.Open.UICorner
G2L["127"] = Instance.new("UICorner", G2L["125"]);



-- StarterGui.#1 GRG Script.CreditsGui
G2L["128"] = Instance.new("BoolValue", G2L["1"]);
G2L["128"]["Name"] = [[CreditsGui]];


-- StarterGui.#1 GRG Script.KeybindsGui
G2L["129"] = Instance.new("BoolValue", G2L["1"]);
G2L["129"]["Name"] = [[KeybindsGui]];


-- StarterGui.#1 GRG Script.AutoBuyGui
G2L["12a"] = Instance.new("BoolValue", G2L["1"]);
G2L["12a"]["Name"] = [[AutoBuyGui]];


-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_ESP&Teleport.LocalScript
local function C_f()
local script = G2L["f"];
	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local PlayerGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("PlayerGui")
		local ESPGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ESPGui")
		local ExtrasGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ExtrasGui")
		local CreditsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("CreditsGui")
		local KeybindsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("KeybindsGui")
		local AutoBuyGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("AutoBuyGui")
		AutoBuyGui.Value = false
		KeybindsGui.Value = false
		ExtrasGui.Value = false
		PlayerGui.Value = false
		ESPGui.Value = true
		CreditsGui.Value = false
	end)
	
end;
task.spawn(C_f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Player.LocalScript
local function C_13()
local script = G2L["13"];
	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local PlayerGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("PlayerGui")
		local ESPGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ESPGui")
		local ExtrasGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ExtrasGui")
		local CreditsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("CreditsGui")
		local KeybindsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("KeybindsGui")
		local AutoBuyGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("AutoBuyGui")
		AutoBuyGui.Value = false
		KeybindsGui.Value = false
		ExtrasGui.Value = false
		PlayerGui.Value = true
		ESPGui.Value = false
		CreditsGui.Value = false
	end)
	
end;
task.spawn(C_13);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Extras.LocalScript
local function C_17()
local script = G2L["17"];
	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local PlayerGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("PlayerGui")
		local ESPGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ESPGui")
		local ExtrasGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ExtrasGui")
		local CreditsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("CreditsGui")
		local KeybindsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("KeybindsGui")
		local AutoBuyGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("AutoBuyGui")
		AutoBuyGui.Value = false
		KeybindsGui.Value = false
		ExtrasGui.Value = true
		PlayerGui.Value = false
		ESPGui.Value = false
		CreditsGui.Value = false
	end)
	
end;
task.spawn(C_17);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_Credits.LocalScript
local function C_1b()
local script = G2L["1b"];
	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local PlayerGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("PlayerGui")
		local ESPGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ESPGui")
		local ExtrasGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ExtrasGui")
		local CreditsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("CreditsGui")
		local KeybindsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("KeybindsGui")
		local AutoBuyGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("AutoBuyGui")
		AutoBuyGui.Value = false
		KeybindsGui.Value = false
		ExtrasGui.Value = false
		PlayerGui.Value = false
		ESPGui.Value = false
		CreditsGui.Value = true
	end)
	
end;
task.spawn(C_1b);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_GUI & Keybinds.LocalScript
local function C_1f()
local script = G2L["1f"];
	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local PlayerGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("PlayerGui")
		local ESPGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ESPGui")
		local ExtrasGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ExtrasGui")
		local CreditsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("CreditsGui")
		local KeybindsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("KeybindsGui")
		local AutoBuyGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("AutoBuyGui")
		AutoBuyGui.Value = false
		KeybindsGui.Value = true
		ExtrasGui.Value = false
		PlayerGui.Value = false
		ESPGui.Value = false
		CreditsGui.Value = false
	end)
	
end;
task.spawn(C_1f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Tab_AutoBuy.LocalScript
local function C_23()
local script = G2L["23"];
	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local PlayerGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("PlayerGui")
		local ESPGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ESPGui")
		local ExtrasGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ExtrasGui")
		local CreditsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("CreditsGui")
		local KeybindsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("KeybindsGui")
		local AutoBuyGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("AutoBuyGui")
		AutoBuyGui.Value = true
		KeybindsGui.Value = false
		ExtrasGui.Value = false
		PlayerGui.Value = false
		ESPGui.Value = false
		CreditsGui.Value = false
	end)
	
end;
task.spawn(C_23);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.LocalScript
local function C_2b()
local script = G2L["2b"];
	local ESPGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ESPGui")
	
	-- Set initial visibility
	script.Parent.Visible = ESPGui.Value
	
	-- Update when the BoolValue changes
	ESPGui.Changed:Connect(function(newValue)
		script.Parent.Visible = newValue
	end)
end;
task.spawn(C_2b);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:Players.esp script
local function C_31()
local script = G2L["31"];
	local isOn = false -- Tracks the toggle state of the ESP
	
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 255, 255)
	
	-- Core Roblox Services
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	
	-- --- ESP HIGHLIGHTING FUNCTIONS ---
	
	-- Function to remove a player's highlight and name tag
	local function removeHighlight(character)
		if not character then return end
	
		local highlight = character:FindFirstChild("PlayerHighlight")
		if highlight then highlight:Destroy() end
	
		local head = character:FindFirstChild("Head")
		if head then
			local billboard = head:FindFirstChild("NameBillboard")
			if billboard then billboard:Destroy() end
		end
	end
	
	-- Function to apply a player's highlight and name tag
	local function highlightCharacter(player, character)
		-- IMPORTANT: Only highlight if the ESP is currently turned on.
		if not isOn then return end 
	
		if not character then return end
	
		-- Cleanup existing highlights before adding new ones
		removeHighlight(character)
	
		-- Create Highlight
		local highlight = Instance.new("Highlight")
		highlight.Name = "PlayerHighlight"
		highlight.FillColor = player.Team and player.Team.TeamColor.Color or Color3.fromRGB(255, 255, 0)
		highlight.OutlineColor = Color3.new(1, 1, 1)
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.Parent = character
	
		-- Create BillboardGui for name
		local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
		if head then
			local billboard = Instance.new("BillboardGui")
			billboard.Name = "NameBillboard"
			billboard.AlwaysOnTop = true
			billboard.Size = UDim2.new(0, 100, 0, 25) -- Smaller size
			billboard.StudsOffset = Vector3.new(0, 3, 0)
			billboard.Parent = head
	
			local textLabel = Instance.new("TextLabel")
			textLabel.Parent = billboard
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = player.DisplayName or player.Name
			textLabel.TextColor3 = player.Team and player.Team.TeamColor.Color or Color3.new(1, 1, 1)
			textLabel.TextStrokeTransparency = 0.5
			textLabel.Font = Enum.Font.GothamBold
			textLabel.TextScaled = false
			textLabel.TextSize = 14
			textLabel.TextWrapped = true
		end
	end
	
	-- Function to handle character spawning
	local function onCharacterAdded(character)
		-- This check ensures we only highlight characters if the ESP is active when they spawn
		if isOn then
			highlightCharacter(character.Parent, character)
		end
	end
	
	-- Function to handle player joining
	local function onPlayerAdded(player)
		if player ~= LocalPlayer then
			-- Connect the CharacterAdded event for future spawns
			player.CharacterAdded:Connect(onCharacterAdded)
	
			-- If the character is already loaded, check if we should highlight them now
			if player.Character then
				onCharacterAdded(player.Character)
			end
		end
	end
	
	-- Start listening for all players (events run regardless of state, but the highlight function checks 'isOn')
	for _, player in ipairs(Players:GetPlayers()) do
		onPlayerAdded(player)
	end
	Players.PlayerAdded:Connect(onPlayerAdded)
	
	-- --- BUTTON CLICK LOGIC ---
	
	script.Parent.MouseButton1Click:Connect(function()
		-- 1. Toggle the state
		if isOn == false then
			script.Parent.BackgroundColor3 = ColorGreen
			isOn = true
		else
			script.Parent.BackgroundColor3 = ColorRed
			isOn = false
		end
	
		-- 2. Apply the ESP action based on the new state
		if isOn == true then
			-- ESP ON: Iterate through existing players and apply highlights
			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character then
					highlightCharacter(player, player.Character)
				end
			end
		else
			-- ESP OFF: Iterate through existing players and remove highlights
			for _, player in ipairs(Players:GetPlayers()) do
				if player.Character then
					removeHighlight(player.Character)
				end
			end
		end
	end)
end;
task.spawn(C_31);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP:MoneyTrees.esp script
local function C_35()
local script = G2L["35"];
	local RunService = game:GetService("RunService")
	local Workspace = game:GetService("Workspace")
	local camera = Workspace.CurrentCamera
	local button = script.Parent -- Assuming this script is a LocalScript inside the TextButton
	
	local treesFolder = Workspace:WaitForChild("Trees")
	local treeBoxes = {}
	local renderConnection = nil -- Stores the RunService connection
	
	-- Button and State Settings
	local isOn = false
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = ColorRed -- Set initial state
	
	-- ESP Settings
	local drawLabels = true
	local rainbowSpeed = 0.1
	
	
	-- Create ESP for one tree
	local function createBoxForTree(treeModel)
		if treeModel:IsA("Model") and treeModel.Name == "OG_Money" then
			for _, existing in ipairs(treeBoxes) do
				if existing.tree == treeModel then return end
			end
	
			local phys = treeModel:FindFirstChild("PhysicalTree")
			if phys then
				local middle = phys:FindFirstChild("Middle")
				if middle and middle:IsA("BasePart") then
					local box = Drawing.new("Square")
					box.Thickness = 2
					box.Transparency = 1
					box.Filled = false
					box.Visible = false -- Start hidden
	
					local text = Drawing.new("Text")
					text.Size = 14
					text.Center = true
					text.Outline = true
					text.Text = "💰 Money Tree 🤑"
					text.Visible = false -- Start hidden
	
					table.insert(treeBoxes, {
						part = middle,
						tree = treeModel,
						box = box,
						text = text
					})
				end
			end
		end
	end
	
	-- Function to hide all existing ESP elements
	local function hideAllESP()
		for _, item in ipairs(treeBoxes) do
			item.box.Visible = false
			item.text.Visible = false
		end
	end
	
	-- The main rendering loop function
	local function renderESP()
		local hue = (tick() * rainbowSpeed) % 1
		local color = Color3.fromHSV(hue, 1, 1)
	
		for _, item in ipairs(treeBoxes) do
			local part, box, text = item.part, item.box, item.text
			if part and part:IsDescendantOf(Workspace) then
				local pos, onScreen = camera:WorldToViewportPoint(part.Position)
				if onScreen then
					local size = Vector2.new(60, 60)
					box.Position = Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2)
					box.Size = size
					box.Color = color
					box.Visible = true
	
					text.Position = Vector2.new(pos.X, pos.Y - 40)
					text.Color = color
					text.Visible = drawLabels
				else
					-- If off-screen
					box.Visible = false
					text.Visible = false
				end
			else
				-- If the part is destroyed
				box.Visible = false
				text.Visible = false
			end
		end
	end
	
	
	-- Detect new trees on a background thread
	task.spawn(function()
		while true do
			task.wait(0.5)
			for _, tree in ipairs(treesFolder:GetChildren()) do
				createBoxForTree(tree)
			end
		end
	end)
	
	---
	
	button.MouseButton1Click:Connect(function()
		if not isOn then
			-- Turn ON
			button.BackgroundColor3 = ColorGreen
			isOn = true
			print("ESP ON")
	
			-- Start the rendering loop
			if not renderConnection then
				renderConnection = RunService.RenderStepped:Connect(renderESP)
			end
		else
			-- Turn OFF
			button.BackgroundColor3 = ColorRed
			isOn = false
			print("ESP OFF")
	
			-- Stop the rendering loop
			if renderConnection then
				renderConnection:Disconnect()
				renderConnection = nil
			end
	
			-- Hide all visuals
			hideAllESP()
		end
	end)
end;
task.spawn(C_35);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.ESP: FruitTrees.esp script
local function C_39()
local script = G2L["39"];
	local RunService = game:GetService("RunService")
	local Workspace = game:GetService("Workspace")
	local camera = Workspace.CurrentCamera
	local button = script.Parent -- Assuming this script is a LocalScript inside the TextButton
	
	local treesFolder = Workspace:WaitForChild("Trees")
	local treeBoxes = {}
	local renderConnection = nil -- Stores the RunService connection
	
	-- Button and State Settings
	local isOn = false
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = ColorRed -- Set initial state
	
	-- ESP Settings
	local drawLabels = true
	local rainbowSpeed = 0.1
	
	
	-- Create ESP for one tree
	local function createBoxForTree(treeModel)
		if treeModel:IsA("Model") and treeModel.Name == "OG_Fruit" then
			for _, existing in ipairs(treeBoxes) do
				if existing.tree == treeModel then return end
			end
	
			local phys = treeModel:FindFirstChild("PhysicalTree")
			if phys then
				local middle = phys:FindFirstChild("Middle")
				if middle and middle:IsA("BasePart") then
					local box = Drawing.new("Square")
					box.Thickness = 2
					box.Transparency = 1
					box.Filled = false
					box.Visible = false -- Start hidden
	
					local text = Drawing.new("Text")
					text.Size = 14
					text.Center = true
					text.Outline = true
					text.Text = "🍎 Fruit Tree 🍎"
					text.Visible = false -- Start hidden
	
					table.insert(treeBoxes, {
						part = middle,
						tree = treeModel,
						box = box,
						text = text
					})
				end
			end
		end
	end
	
	-- Function to hide all existing ESP elements
	local function hideAllESP()
		for _, item in ipairs(treeBoxes) do
			item.box.Visible = false
			item.text.Visible = false
		end
	end
	
	-- The main rendering loop function
	local function renderESP()
		local hue = (tick() * rainbowSpeed) % 1
		local color = Color3.fromHSV(hue, 1, 1)
	
		for _, item in ipairs(treeBoxes) do
			local part, box, text = item.part, item.box, item.text
			if part and part:IsDescendantOf(Workspace) then
				local pos, onScreen = camera:WorldToViewportPoint(part.Position)
				if onScreen then
					local size = Vector2.new(60, 60)
					box.Position = Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2)
					box.Size = size
					box.Color = color
					box.Visible = true
	
					text.Position = Vector2.new(pos.X, pos.Y - 40)
					text.Color = color
					text.Visible = drawLabels
				else
					-- If off-screen
					box.Visible = false
					text.Visible = false
				end
			else
				-- If the part is destroyed
				box.Visible = false
				text.Visible = false
			end
		end
	end
	
	
	-- Detect new trees on a background thread
	task.spawn(function()
		while true do
			task.wait(0.5)
			for _, tree in ipairs(treesFolder:GetChildren()) do
				createBoxForTree(tree)
			end
		end
	end)
	
	---
	
	button.MouseButton1Click:Connect(function()
		if not isOn then
			-- Turn ON
			button.BackgroundColor3 = ColorGreen
			isOn = true
			print("ESP ON")
	
			-- Start the rendering loop
			if not renderConnection then
				renderConnection = RunService.RenderStepped:Connect(renderESP)
			end
		else
			-- Turn OFF
			button.BackgroundColor3 = ColorRed
			isOn = false
			print("ESP OFF")
	
			-- Stop the rendering loop
			if renderConnection then
				renderConnection:Disconnect()
				renderConnection = nil
			end
	
			-- Hide all visuals
			hideAllESP()
		end
	end)
end;
task.spawn(C_39);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_1.esp script
local function C_3f()
local script = G2L["3f"];
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local workspace = game:GetService("Workspace")
	
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:WaitForChild("HumanoidRootPart")
	local camera = workspace.CurrentCamera
	local treesFolder = workspace:WaitForChild("Trees")
	
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	local function AnticheatBypass()
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
		task.wait(0.3)
	end
	
	local tpButton = script.Parent
	
	tpButton.MouseButton1Click:Connect(function()
		local nearest = nil
		local shortestDist = math.huge
		for _, tree in ipairs(treesFolder:GetChildren()) do
			if tree.Name == "OG_Money" then
				local phys = tree:FindFirstChild("PhysicalTree")
				if phys then
					local mid = phys:FindFirstChild("Middle")
					if mid then
						local dist = (hrp.Position - mid.Position).Magnitude
						if dist < shortestDist then
							shortestDist = dist
							nearest = mid
						end
					end
				end
			end
		end
	
		if nearest then
			AnticheatBypass()
			hrp.CFrame = CFrame.new(nearest.Position + Vector3.new(0, 5, 0))
		end
	end)
end;
task.spawn(C_3f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_2.esp script
local function C_43()
local script = G2L["43"];
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local workspace = game:GetService("Workspace")
	
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:WaitForChild("HumanoidRootPart")
	local camera = workspace.CurrentCamera
	local treesFolder = workspace:WaitForChild("Trees")
	
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	local function AnticheatBypass()
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
		task.wait(0.3)
	end
	
	local tpButton = script.Parent
	
	tpButton.MouseButton1Click:Connect(function()
		local nearest = nil
		local shortestDist = math.huge
	
		for _, tree in ipairs(treesFolder:GetChildren()) do
			-- only consider trees named OG_Fruit
			if tree.Name ~= "OG_Fruit" then
				-- skip non-fruit trees
			else
				-- Owner is an ObjectValue inside the OG_Fruit
				local owner = tree:FindFirstChild("Owner")
				local skipTree = false
	
				if owner and owner:IsA("ObjectValue") then
					-- if Owner.Value exists and is NOT the local player, skip this tree
					if owner.Value and owner.Value ~= player then
						skipTree = true
					end
					-- if owner.Value == player or owner.Value is nil, we do NOT skip
				end
	
				if not skipTree then
					local phys = tree:FindFirstChild("PhysicalTree")
					if phys then
						local mid = phys:FindFirstChild("Middle")
						if mid and mid:IsA("BasePart") then
							local dist = (hrp.Position - mid.Position).Magnitude
							if dist < shortestDist then
								shortestDist = dist
								nearest = mid
							end
						end
					end
				end
			end
		end
	
		if nearest then
			AnticheatBypass()
			hrp.CFrame = CFrame.new(nearest.Position + Vector3.new(0, 5, 0))
		end
	end)
	
end;
task.spawn(C_43);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_3.teleport script
local function C_47()
local script = G2L["47"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(-228, 29, 342)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_47);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_4.teleport script
local function C_4b()
local script = G2L["4b"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(12, -10, -1319)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_4b);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_5.teleport script
local function C_4f()
local script = G2L["4f"];
	-- Services
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = Workspace:FindFirstChild("DOCONLY", true)
	local guard = Workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Teleport position
	local TELEPORT_POSITION = Vector3.new(61, 5, -1293)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		if a and b then
			firetouchinterest(a, b, 0)
			firetouchinterest(a, b, 1)
		end
	end
	
	-- Anticheat bypass
	local function AnticheatBypass(hrp)
		if not hrp then return end
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Teleport function with timing retry for anticheat
	local function teleportToPosition(maxRetries)
		maxRetries = maxRetries or 5
		for attempt = 1, maxRetries do
			local char = player.Character or player.CharacterAdded:Wait()
			local hrp = char:FindFirstChild("HumanoidRootPart")
	
			if hrp then
				-- Run anticheat bypass
				AnticheatBypass(hrp)
				task.wait(0.25) -- wait for server to register bypass
	
				-- Teleport
				hrp.CFrame = CFrame.new(TELEPORT_POSITION)
	
				-- Verify if teleport stuck
				task.wait(0.05)
				if (hrp.Position - TELEPORT_POSITION).Magnitude < 2 then
					return true -- teleport succeeded
				end
			end
	
			-- Retry if failed
			task.wait(0.1)
		end
		warn("Teleport failed due to anticheat timing.")
		return false
	end
	
	-- Button click handler
	script.Parent.MouseButton1Click:Connect(function()
		-- Change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_4f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_6.teleport script
local function C_53()
local script = G2L["53"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(59, 30, 293)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_53);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_7.teleport script
local function C_57()
local script = G2L["57"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(-500, -2, 531)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_57);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_8.teleport script
local function C_5b()
local script = G2L["5b"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(-0, 43, 628)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_5b);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_9.teleport script
local function C_5f()
local script = G2L["5f"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(173, 1, -18)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_5f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_10.teleport script
local function C_63()
local script = G2L["63"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(-0, 21, 180)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_63);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_11.teleport script
local function C_67()
local script = G2L["67"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(-1, 44, 430)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_67);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_12.teleport script
local function C_6b()
local script = G2L["6b"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(1, -1, -1254)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_6b);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_13.esp script
local function C_6f()
local script = G2L["6f"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	-- We use CharacterAdded:Wait() to ensure the character is available.
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Toggle State and Colors
	local isOn = false
	local ColorGreen = Color3.fromRGB(0,255,0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		-- Fire touch interest to simulate part 'a' touching part 'b'
		firetouchinterest(a, b, 0)
		-- Fire touch interest to simulate the touch ending
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		-- Re-check HRP in case of recent respawn
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to a random player on the "Leader" team
	local function teleportToLeader()
		-- Ensure references are current (in case of death/respawn)
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Get all players on the "Leader" team, excluding yourself
		local leaders = {}
		for _, p in pairs(Players:GetPlayers()) do
			if p.Team and p.Team.Name == "Leader" and p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				table.insert(leaders, p)
			end
		end
	
		-- If there’s at least one leader, teleport
		if #leaders > 0 then
			local targetPlayer = leaders[math.random(1, #leaders)]
			local targetHRP = targetPlayer.Character.HumanoidRootPart
	
			-- 1. Run anticheat bypass *BEFORE* the teleport
			AnticheatBypass()
	
			-- Wait for the bypass touch to register before moving.
			task.wait(0.3) 
	
			-- 2. Teleport slightly above the leader
			humanoidRootPart.CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0)
	
		else
			warn("No players found on the 'Leader' team!")
		end
	end
	
	-- Button click handler (This script must be a LocalScript inside the Button)
	script.Parent.MouseButton1Click:Connect(function()
		-- Toggle the state and color
		if isOn == false then
			script.Parent.BackgroundColor3 = ColorGreen
			isOn = true
	
			-- Use task.spawn to run the teleport loop in a separate thread.
			-- This prevents the button from locking up, allowing you to click it again to turn it off.
			task.spawn(function()
				while isOn == true do
					teleportToLeader()
					task.wait(0.1) -- Short delay between continuous teleports
				end
			end)
	
		else
			script.Parent.BackgroundColor3 = ColorRed
			isOn = false
		end
	end)
end;
task.spawn(C_6f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame1.Scroll.Frame.Teleport_14.teleport script
local function C_74()
local script = G2L["74"];
	-- Services
	local Players = game:GetService("Players")
	local workspace = game:GetService("Workspace")
	
	-- Player references
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Anticheat objects
	local doc = workspace:FindFirstChild("DOCONLY", true)
	local guard = workspace:FindFirstChild("GUARDONLY", true)
	
	-- Colors for feedback
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Function to simulate touching an object for anticheat bypass
	local function touch(a, b)
		firetouchinterest(a, b, 0)
		firetouchinterest(a, b, 1)
	end
	
	-- Function to handle the actual touch/bypass logic
	local function AnticheatBypass()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	-- Function to teleport to fixed position
	local TELEPORT_POSITION = Vector3.new(-23, 22, 243)
	local function teleportToPosition()
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Run anticheat bypass before teleporting
		AnticheatBypass()
		task.wait(0.3)
	
		humanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITION)
	end
	
	-- Button click handler (teleport happens once per click)
	script.Parent.MouseButton1Click:Connect(function()
		-- Optional: change button color for feedback
		script.Parent.BackgroundColor3 = ColorGreen
	
		teleportToPosition()
	
		-- Optional: revert button color after teleport
		task.wait(0.2)
		script.Parent.BackgroundColor3 = ColorRed
	end)
	
end;
task.spawn(C_74);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.LocalScript
local function C_79()
local script = G2L["79"];
	local PlayerGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("PlayerGui")
	
	-- Set initial visibility
	script.Parent.Visible = PlayerGui.Value
	
	-- Update when the BoolValue changes
	PlayerGui.Changed:Connect(function(newValue)
		script.Parent.Visible = newValue
	end)
	
	-- Optional: if you really want a loop to constantly check (not recommended)
	-- while true do
	--     script.Parent.Visible = ESPGui.Value
	--     wait(0.01)
	-- end
	
end;
task.spawn(C_79);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Vehicle Fly Button.Vehicle Fly script
local function C_7e()
local script = G2L["7e"];
	-- Vehicle/Character Fly Toggle (LocalScript for a UI Button)
	-- Put this LocalScript inside the Button (TextButton) in a ScreenGui
	
	local isOn = false
	local ColorGreen = Color3.fromRGB(0,255,0)
	local ColorRed = Color3.fromRGB(168, 92, 255)
	
	local player = game.Players.LocalPlayer
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	
	local flyGyro
	local flyVelocity
	local rootPart
	local speed = 100
	
	-- Directions accumulator
	local moveVector = Vector3.new(0,0,0)
	
	-- Create body movers
	local function enableFly(part)
		if not part then return end
		flyGyro = Instance.new("BodyGyro")
		flyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
		flyGyro.P = 1e4
		flyGyro.CFrame = part.CFrame
		flyGyro.Parent = part
	
		flyVelocity = Instance.new("BodyVelocity")
		flyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		flyVelocity.Velocity = Vector3.zero
		flyVelocity.P = 1e4
		flyVelocity.Parent = part
	end
	
	local function disableFly()
		if flyGyro then flyGyro:Destroy() flyGyro = nil end
		if flyVelocity then flyVelocity:Destroy() flyVelocity = nil end
	end
	
	-- Input handling (fixed forward/backward mapping)
	UserInputService.InputBegan:Connect(function(input, gpe)
		if gpe or not isOn then return end
		if input.KeyCode == Enum.KeyCode.W then moveVector = moveVector + Vector3.new(0, 0,  1) end -- FORWARD
		if input.KeyCode == Enum.KeyCode.S then moveVector = moveVector + Vector3.new(0, 0, -1) end -- BACK
		if input.KeyCode == Enum.KeyCode.A then moveVector = moveVector + Vector3.new(-1, 0, 0) end
		if input.KeyCode == Enum.KeyCode.D then moveVector = moveVector + Vector3.new( 1, 0, 0) end
		if input.KeyCode == Enum.KeyCode.Space then moveVector = moveVector + Vector3.new(0, 1, 0) end -- UP
		if input.KeyCode == Enum.KeyCode.LeftShift then moveVector = moveVector + Vector3.new(0, -1, 0) end -- DOWN
	end)
	
	UserInputService.InputEnded:Connect(function(input)
		if not isOn then return end
		if input.KeyCode == Enum.KeyCode.W then moveVector = moveVector - Vector3.new(0, 0,  1) end
		if input.KeyCode == Enum.KeyCode.S then moveVector = moveVector - Vector3.new(0, 0, -1) end
		if input.KeyCode == Enum.KeyCode.A then moveVector = moveVector - Vector3.new(-1, 0, 0) end
		if input.KeyCode == Enum.KeyCode.D then moveVector = moveVector - Vector3.new( 1, 0, 0) end
		if input.KeyCode == Enum.KeyCode.Space then moveVector = moveVector - Vector3.new(0, 1, 0) end
		if input.KeyCode == Enum.KeyCode.LeftShift then moveVector = moveVector - Vector3.new(0, -1, 0) end
	end)
	
	-- Fly update
	RunService.RenderStepped:Connect(function()
		if not isOn or not flyVelocity or not rootPart then return end
	
		local camCFrame = workspace.CurrentCamera.CFrame
		-- Move relative to camera: right, up, look
		local moveDir = (camCFrame.RightVector * moveVector.X)
			+ (camCFrame.UpVector    * moveVector.Y)
			+ (camCFrame.LookVector  * moveVector.Z)
	
		-- normalize so diagonal doesn't exceed speed, but keep zero safe
		if moveDir.Magnitude > 0 then
			moveDir = moveDir.Unit
		else
			moveDir = Vector3.zero
		end
	
		flyVelocity.Velocity = moveDir * speed
		flyGyro.CFrame = CFrame.new(rootPart.Position, rootPart.Position + camCFrame.LookVector)
	end)
	
	-- Button toggle
	script.Parent.MouseButton1Click:Connect(function()
		if isOn == false then
			script.Parent.BackgroundColor3 = ColorGreen
			isOn = true
	
			local char = player.Character or player.CharacterAdded:Wait()
			rootPart = char:FindFirstChild("HumanoidRootPart")
			if not rootPart then
				warn("No HumanoidRootPart found.")
				isOn = false
				script.Parent.BackgroundColor3 = ColorRed
				return
			end
			enableFly(rootPart)
	
		else
			script.Parent.BackgroundColor3 = ColorRed
			isOn = false
			-- reset moveVector so you don't keep momentum when re-enabling
			moveVector = Vector3.new(0,0,0)
			disableFly()
		end
	end)
	
end;
task.spawn(C_7e);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Infinite Jump Button.INFJUMP script
local function C_82()
local script = G2L["82"];
	-- Infinite Jump Toggle Button Script
	-- Put this LocalScript inside your TextButton (in a ScreenGui)
	
	local UserInputService = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	
	local player = Players.LocalPlayer
	local humanoid
	
	-- Wait for character and humanoid to load
	local function getHumanoid()
		local character = player.Character or player.CharacterAdded:Wait()
		return character:WaitForChild("Humanoid", 5)
	end
	
	humanoid = getHumanoid()
	player.CharacterAdded:Connect(function(char)
		humanoid = char:WaitForChild("Humanoid", 5)
	end)
	
	-- Button + colors
	local button = script.Parent
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(168, 92, 255)
	
	local isOn = false
	
	button.MouseButton1Click:Connect(function()
		isOn = not isOn
		button.BackgroundColor3 = isOn and ColorGreen or ColorRed
		print("Infinite Jump:", isOn and "ON" or "OFF")
	end)
	
	-- Infinite jump logic
	UserInputService.JumpRequest:Connect(function()
		if not isOn then return end
		if not humanoid or humanoid.Health <= 0 then return end
		local state = humanoid:GetState()
		if state == Enum.HumanoidStateType.Seated or state == Enum.HumanoidStateType.PlatformStanding then
			return
		end
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end)
	
end;
task.spawn(C_82);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.Frame.Hitbox Button.INFJUMP script
local function C_86()
local script = G2L["86"];
	-- Infinite Jump Toggle Button Script
	-- Put this LocalScript inside your TextButton (in a ScreenGui)
	
	local UserInputService = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	
	local player = Players.LocalPlayer
	local humanoid
	
	-- Wait for character and humanoid to load
	local function getHumanoid()
		local character = player.Character or player.CharacterAdded:Wait()
		return character:WaitForChild("Humanoid", 5)
	end
	
	humanoid = getHumanoid()
	player.CharacterAdded:Connect(function(char)
		humanoid = char:WaitForChild("Humanoid", 5)
	end)
	
	-- Button + colors
	local button = script.Parent
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(168, 92, 255)
	
	local isOn = false
	
	button.MouseButton1Click:Connect(function()
		isOn = not isOn
		button.BackgroundColor3 = isOn and ColorGreen or ColorRed
		print("Infinite Jump:", isOn and "ON" or "OFF")
	end)
	
	-- Infinite jump logic
	UserInputService.JumpRequest:Connect(function()
		if not isOn then return end
		if not humanoid or humanoid.Health <= 0 then return end
		local state = humanoid:GetState()
		if state == Enum.HumanoidStateType.Seated or state == Enum.HumanoidStateType.PlatformStanding then
			return
		end
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end)
	
end;
task.spawn(C_86);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.BarbCurrentFood.LocalScript
local function C_8d()
local script = G2L["8d"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer or game.Players.LocalPlayer
	
	-- Function to find the tool in backpack or workspace
	local function findStealFoodTool()
		-- Check backpack
		local backpack = player:FindFirstChild("Backpack")
		if backpack then
			local tool = backpack:FindFirstChild("steal food")
			if tool then
				return tool
			end
		end
	
		-- Check character (if equipped)
		local character = player.Character or player.CharacterAdded:Wait()
		local equippedTool = character:FindFirstChild("steal food")
		if equippedTool then
			return equippedTool
		end
	
		-- Check workspace (if dropped)
		local droppedTool = workspace:FindFirstChild("steal food")
		if droppedTool then
			return droppedTool
		end
	
		return nil
	end
	
	-- Wait until the tool exists somewhere
	local tool
	repeat
		tool = findStealFoodTool()
		if not tool then
			task.wait(1)
		end
	until tool
	
	-- Wait for the attribute "CurrentFood" to exist
	while tool:GetAttribute("CurrentFood") == nil do
		task.wait(1)
	end
	
	-- Update when it changes
	tool:GetAttributeChangedSignal("CurrentFood"):Connect(function()
		local newValue = tool:GetAttribute("CurrentFood")
	end)
	
	-- (Optional) Periodically print every second
	task.spawn(function()
		while tool and tool.Parent do
			local food = tool:GetAttribute("CurrentFood")
			if food ~= nil then
				script.Parent.Text = "Current Food: " .. food .. ""
			end
			task.wait(1)
		end
	end)
	
end;
task.spawn(C_8d);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.HUNGERLabel.LocalScript
local function C_8f()
local script = G2L["8f"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Wait until stats folder exists
	local stats
	repeat
		stats = player:FindFirstChild("stats") -- make sure this matches EXACT capitalization in Explorer
		if not stats then
			task.wait(1)
		end
	until stats
	
	-- Wait for Hunger value
	local hunger
	repeat
		hunger = stats:FindFirstChild("Hunger")
		if not hunger then
			task.wait(1)
		end
	until hunger
	
	-- Now print it every second (rounded)
	while true do
		local roundedHunger = math.round(hunger.Value)
		script.Parent.Text = "Hunger: " .. roundedHunger
		task.wait(1)
	end
	
end;
task.spawn(C_8f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.HealthLabel.LocalScript
local function C_91()
local script = G2L["91"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Wait until PlayerGui exists
	local playerGui
	repeat
		playerGui = player:FindFirstChild("PlayerGui")
		if not playerGui then
			task.wait(1)
		end
	until playerGui
	
	-- Wait for ScreenGui
	local screenGui
	repeat
		screenGui = playerGui:FindFirstChild("ScreenGui")
		if not screenGui then
			task.wait(1)
		end
	until screenGui
	
	-- Wait for Status frame
	local statusFrame
	repeat
		statusFrame = screenGui:FindFirstChild("Status")
		if not statusFrame then
			task.wait(1)
		end
	until statusFrame
	
	-- Wait for Health label
	local healthLabel
	repeat
		healthLabel = statusFrame:FindFirstChild("Health")
		if not healthLabel then
			task.wait(1)
		end
	until healthLabel
	
	-- Now print/update it every 5 seconds (rounded)
	while true do
		local healthValue = math.round(healthLabel.Size.X.Scale * 100)
		script.Parent.Text = "Health: " .. healthValue
		task.wait(1)
	end
	
end;
task.spawn(C_91);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame2.Scroll.MoneyLabel.LocalScript
local function C_93()
local script = G2L["93"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Wait until stats folder exists
	local leaderstats
	repeat
		leaderstats = player:FindFirstChild("leaderstats") -- make sure this matches EXACT capitalization in Explorer
		if not leaderstats then
			task.wait(1)
		end
	until leaderstats
	
	-- Wait for Money value
	local money
	repeat
		money = leaderstats:FindFirstChild("Money")
		if not money then
			task.wait(1)
		end
	until money
	
	-- Now print it every second (rounded)
	while true do
		local roundedMoney = math.round(money.Value)
		script.Parent.Text = "Money: " .. roundedMoney
		task.wait(1)
	end
	
end;
task.spawn(C_93);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.LocalScript
local function C_95()
local script = G2L["95"];
	local ExtrasGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("ExtrasGui")
	
	-- Set initial visibility
	script.Parent.Visible = ExtrasGui.Value
	
	-- Update when the BoolValue changes
	ExtrasGui.Changed:Connect(function(newValue)
		script.Parent.Visible = newValue
	end)
	
	-- Optional: if you really want a loop to constantly check (not recommended)
	-- while true do
	--     script.Parent.Visible = ESPGui.Value
	--     wait(0.01)
	-- end
	
end;
task.spawn(C_95);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.Server Invis.desync toggle
local function C_9a()
local script = G2L["9a"];
	local isOn = false
	
	-- Define a variable to hold the reference to the running script/coroutine (if needed)
	local activeThread = nil
	
	-- The URL for the external script (your desync code)
	local EXTERNAL_SCRIPT_URL = 'https://pastebin.com/raw/5dQ40eZG'
	
	-- Ensure the button starts in the OFF state
	
	script.Parent.MouseButton1Click:Connect(function()
		-- Toggle the state
		isOn = not isOn
	
		if isOn == true then
	
	
			-- Fetch and run the external script code
			local code = game:HttpGet(EXTERNAL_SCRIPT_URL)
	
			-- Use pcall in case of errors during execution
			local success, result = pcall(loadstring(code))
	
			if not success then
				warn("Failed to execute external script: " .. result)
			else
				print("External script loaded and started.")
				-- If the external script is a function that returns a thread/coroutine,
				-- you would store it here to manage its state.
			end
	
		else
	
			-- If the external script needs explicit termination (e.g., stopping loops
			-- or disconnecting connections), that termination logic MUST be handled 
			-- by the external script itself, or by setting a global variable that it monitors.
			print("Toggle OFF. External script assumed to be stopped/finished.")
	
		end
	
		-- IMPORTANT: Removed the blocking 'while isOn == true do wait(0.1) end' loop.
		-- This loop would freeze the script, preventing the button from being clicked again.
	end)
end;
task.spawn(C_9a);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.desync toggle
local function C_9e()
local script = G2L["9e"];
	--========================================================--
	--                   INITIAL SETUP
	--========================================================--
	
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	
	local player = Players.LocalPlayer
	local button = script.Parent
	
	local BV_Refilling = button:WaitForChild("RefillingFood")
	local BV_Emptying = button:WaitForChild("EmptyingFood")
	local IsOn = button:WaitForChild("IsOn")
	
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	local ColorAnticheat = Color3.fromRGB(0, 255, 128)
	
	local REFILL_POINT = Vector3.new(59, 30, 293)
	local EMPTY_POINT  = Vector3.new(61, 5, -1293)
	local MAX_DISTANCE = 12
	
	local doc = Workspace:FindFirstChild("DOCONLY", true)
	local guard = Workspace:FindFirstChild("GUARDONLY", true)
	
	
	--========================================================--
	--                 SUPPORT FUNCTIONS
	--========================================================--
	
	local function touch(a, b)
		if a and b then
			firetouchinterest(a, b, 0)
			firetouchinterest(a, b, 1)
		end
	end
	
	local function AnticheatBypass(hrp)
		if not hrp then return end
		local isDoctor = player.Team and player.Team.Name == "Doctor"
	
		if isDoctor then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	local function getHRP()
		local char = player.Character or player.CharacterAdded:Wait()
		return char:FindFirstChild("HumanoidRootPart")
	end
	
	local function near(pos)
		local hrp = getHRP()
		if not hrp then return false end
		return (hrp.Position - pos).Magnitude < MAX_DISTANCE
	end
	
	
	--========================================================--
	--        TELEPORTING LOGIC (ONLY if IsOn == true)
	--========================================================--
	
	local function TeleportRefill()
		if not IsOn.Value then return end
	
		local hrp = getHRP()
		if not hrp then return end
	
		AnticheatBypass(hrp)
		task.wait(0.3)
		hrp.CFrame = CFrame.new(REFILL_POINT)
	end
	
	local function TeleportEmpty(maxRetries)
		if not IsOn.Value then return end
		maxRetries = maxRetries or 5
	
		for i = 1, maxRetries do
			local hrp = getHRP()
			if not hrp then continue end
	
			AnticheatBypass(hrp)
			task.wait(0.25)
			hrp.CFrame = CFrame.new(EMPTY_POINT)
	
			task.wait(0.05)
			if near(EMPTY_POINT) then return true end
			task.wait(0.1)
		end
	end
	
	
	--========================================================--
	--     BACKGROUND LOOP — Now properly checks IsOn
	--========================================================--
	
	task.spawn(function()
		while true do
			task.wait(7)
	
			if not IsOn.Value then continue end  -- <<< FIXED
	
			if BV_Refilling.Value then
				if not near(REFILL_POINT) then
					TeleportRefill()
				end
			end
	
			if BV_Emptying.Value then
				if not near(EMPTY_POINT) then
					TeleportEmpty()
				end
			end
		end
	end)
	
	
	--========================================================--
	--             BUTTON CLICK — REAL FIX
	--========================================================--
	
	button.MouseButton1Click:Connect(function()
		IsOn.Value = not IsOn.Value
	
		button.BackgroundColor3 = IsOn.Value and ColorGreen or ColorRed
	
		if IsOn.Value then
			-- turn on farm
			BV_Refilling.Value = true
			BV_Emptying.Value = false
		else
			-- turn off farm
			BV_Refilling.Value = false
			BV_Emptying.Value = false
			button.Text = "Current Food: --"
		end
	end)
	
end;
task.spawn(C_9e);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.LocalScript
local function C_9f()
local script = G2L["9f"];
	-- Toggle variable
	local isOn = false
	
	
	-- GUI Colors
	local ColorGreen = Color3.fromRGB(0, 255, 0)
	local ColorRed = Color3.fromRGB(255, 0, 0)
	
	-- Services
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Main function to equip and activate the tool
	local function performAction()
		local character = player.Character
		if not character then return end
	
		-- Check if the tool is equipped
		local tool = character:FindFirstChildOfClass("Tool")
		if not (tool and tool.Name == "steal food") then
			-- Try to find the tool in the Backpack
			local backpack = player:FindFirstChild("Backpack")
			if backpack then
				local t = backpack:FindFirstChild("steal food")
				if t then
					t.Parent = character -- Equip the tool
					tool = t
				else
					return -- Tool not found
				end
			else
				return -- Backpack not found
			end
		end
	
		-- Activate the tool
		tool:Activate()
		print("Tool equipped and activated automatically!")
	end
	
	-- Function to run the loop while isOn
	local function startLoop()
		task.spawn(function()
			while isOn do
				performAction()
				task.wait(0.1) -- Runs every 2 seconds
			end
		end)
	end
	
	-- GUI button toggle
	script.Parent.MouseButton1Click:Connect(function()
		isOn = not isOn
		script.Parent.BackgroundColor3 = isOn and ColorGreen or ColorRed
		if isOn then
			startLoop()
		end
	end)
	
end;
task.spawn(C_9f);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.setvalues
local function C_a0()
local script = G2L["a0"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	local Refill = script.Parent:WaitForChild("RefillingFood")
	local Empty = script.Parent:WaitForChild("EmptyingFood")
	local IsOn = script.Parent:WaitForChild("IsOn") -- AUTOFARM TOGGLE
	
	-- Function to find the tool in backpack, character, or workspace
	local function findStealFoodTool()
		local backpack = player:FindFirstChild("Backpack")
		if backpack then
			local tool = backpack:FindFirstChild("steal food")
			if tool then return tool end
		end
	
		local character = player.Character
		if character then
			local equippedTool = character:FindFirstChild("steal food")
			if equippedTool then return equippedTool end
		end
	
		local droppedTool = workspace:FindFirstChild("steal food")
		if droppedTool then return droppedTool end
	
		return nil
	end
	
	-- Main logic that restarts every time the player respawns
	local function startTracking()
		task.spawn(function()
			-- Wait until the tool exists
			local tool
			repeat
				tool = findStealFoodTool()
				task.wait(0.5)
			until tool
	
			-- Wait until the attribute exists
			while tool:GetAttribute("CurrentFood") == nil do
				task.wait(0.2)
			end
	
			-- ATTRIBUTE CHANGED SIGNAL
			tool:GetAttributeChangedSignal("CurrentFood"):Connect(function()
				if IsOn.Value == false then return end -- prevent autofarm when off
	
				local food = tool:GetAttribute("CurrentFood")
	
				if food >= 100 and Refill.Value == true then
					Refill.Value = false
					Empty.Value = true
				elseif food <= 0 and Empty.Value == true then
					Refill.Value = true
					Empty.Value = false
				end
			end)
	
			-- CONTINUOUS CHECK LOOP
			while tool and tool.Parent do
				local food = tool:GetAttribute("CurrentFood")
	
				if food and IsOn.Value == true then
					if food >= 100 and Refill.Value == true then
						Refill.Value = false
						Empty.Value = true
					elseif food <= 0 and Empty.Value == true then
						Refill.Value = true
						Empty.Value = false
					end
				end
	
				task.wait(1)
			end
	
			-- Tool disappeared → likely respawn or team change → restart
			startTracking()
		end)
	end
	
	-- Start once for the first character
	player.CharacterAdded:Connect(startTracking)
	if player.Character then
		startTracking()
	end
	
end;
task.spawn(C_a0);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.prevent errors
local function C_a1()
local script = G2L["a1"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	local Refill = script.Parent:WaitForChild("RefillingFood")
	local Empty = script.Parent:WaitForChild("EmptyingFood")
	local IsOn = script.Parent:WaitForChild("IsOn") -- ADD THIS
	
	-- Only change states if autofarm is enabled
	if IsOn.Value then
	
		-- If the player is Spectating and either value is true
		if (Refill.Value == true or Empty.Value == true) 
			and player.Team 
			and player.Team.Name == "Spectating" then
	
			Refill.Value = false
			Empty.Value = false
	
			-- If the player is Barbarian and either value is false
		elseif (Refill.Value == false or Empty.Value == false)
			and player.Team
			and player.Team.Name == "Barbarian" then
	
			Refill.Value = true
			Empty.Value = false
		end
	
	end
	
end;
task.spawn(C_a1);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.RefillingFood.LocalScript
local function C_a5()
local script = G2L["a5"];
	--============================================================--
	-- CONFIG
	--============================================================--
	
	local RUN_FLAG = script.Parent  -- BoolValue that controls ON/OFF
	local TELEPORT_POSITION = Vector3.new(59, 30, 293)
	local REQUIRED_DISTANCE = 10 -- studs allowed before stopping
	
	--============================================================--
	-- CACHED SERVICES
	--============================================================--
	
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	
	local player = Players.LocalPlayer
	local doc = Workspace:FindFirstChild("DOCONLY", true)
	local guard = Workspace:FindFirstChild("GUARDONLY", true)
	
	--============================================================--
	-- FUNCTIONS
	--============================================================--
	
	local function touch(a, b)
		if a and b then
			firetouchinterest(a, b, 0)
			firetouchinterest(a, b, 1)
		end
	end
	
	local function AnticheatBypass()
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	local function TeleportUntilClose()
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
	
		-- Keep teleporting until distance is good
		while RUN_FLAG.Value == true do
			local distance = (hrp.Position - TELEPORT_POSITION).Magnitude
	
			-- If close enough, stop teleporting
			if distance <= REQUIRED_DISTANCE then
				break
			end
	
			AnticheatBypass()
			task.wait(0.35)
	
			hrp.CFrame = CFrame.new(TELEPORT_POSITION)
			task.wait(1)
		end
	end
	
	--============================================================--
	-- MAIN LOOP
	--============================================================--
	
	task.spawn(function()
		while true do
			task.wait(1)
	
			if RUN_FLAG.Value == true then
				TeleportUntilClose()
			end
		end
	end)
	
end;
task.spawn(C_a5);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.BARB AUTOFARM.EmptyingFood.LocalScript
local function C_a7()
local script = G2L["a7"];
	--============================================================--
	-- CONFIG
	--============================================================--
	
	local RUN_FLAG = script.Parent  -- must be a BoolValue with .Value = true/false
	local TELEPORT_POSITION = Vector3.new(61, 5, -1293)
	local REQUIRED_DISTANCE = 10
	
	--============================================================--
	-- CACHED SERVICES
	--============================================================--
	
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	
	local player = Players.LocalPlayer
	local doc = Workspace:FindFirstChild("DOCONLY", true)
	local guard = Workspace:FindFirstChild("GUARDONLY", true)
	
	--============================================================--
	-- FUNCTIONS
	--============================================================--
	
	local function touch(a, b)
		if a and b then
			firetouchinterest(a, b, 0)
			firetouchinterest(a, b, 1)
		end
	end
	
	local function AnticheatBypass()
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		if player.Team and player.Team.Name == "Doctor" then
			touch(hrp, guard)
		else
			touch(hrp, doc)
		end
	end
	
	local function TeleportUntilClose()
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
	
		-- Keep teleporting until distance is good
		while RUN_FLAG.Value == true do
			local distance = (hrp.Position - TELEPORT_POSITION).Magnitude
	
			-- If close enough, stop teleporting
			if distance <= REQUIRED_DISTANCE then
				break
			end
	
			AnticheatBypass()
			task.wait(0.35)
	
			hrp.CFrame = CFrame.new(TELEPORT_POSITION)
			task.wait(1)
		end
	end
	
	--============================================================--
	-- MAIN LOOP
	--============================================================--
	
	task.spawn(function()
		while true do
			task.wait(1)
	
			if RUN_FLAG.Value == true then
				TeleportUntilClose()
			end
		end
	end)
end;
task.spawn(C_a7);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.button toggled
local function C_aa()
local script = G2L["aa"];
	local button = script.Parent
	local status = button:WaitForChild("Tp on") -- BoolValue
	
	button.MouseButton1Click:Connect(function()
		-- Toggle the value
		status.Value = not status.Value
	
		-- Update button appearance
		if status.Value then
			button.Text = "Tp on"
			button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		else
			button.Text = "Tp off"
			button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		end
	end)
	
end;
task.spawn(C_aa);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.setting values
local function C_ab()
local script = G2L["ab"];
	local tp = script.Parent:WaitForChild("Tp on")      -- BoolValue
	local path = script.Parent:WaitForChild("Path")     -- StringValue
	local role = script.Parent:WaitForChild("Role")     -- StringValue
	local tpv = script.Parent:WaitForChild("tpvalue")   -- StringValue (lowercase as you said)
	
	-- Mapping roles to their path and tpvalue strings
	local roleMap = {
		Barbarian = {
			path = "workspace.SpawnArea.Spawns.BarbarianSpawn.BarbarianNPC.BarbarianTP.ProximityPrompt",
			tpv = "workspace.SpawnArea.Spawns.BarbarianSpawn.BarbarianNPC.BarbarianTP"
		},
		Peasant = {
			path = "workspace.SpawnArea.Spawns.PeasantSpawn.PeasantNPC.PeasantTP.ProximityPrompt",
			tpv = "workspace.SpawnArea.Spawns.PeasantSpawn.PeasantNPC.PeasantTP"
		},
		Civilian = {
			path = "workspace.SpawnArea.Spawns.CivilianSpawn.CivilianNPC.CivilianTP.ProximityPrompt",
			tpv = "workspace.SpawnArea.Spawns.CivilianSpawn.CivilianNPC.CivilianTP"
		}
	}
	
	-- Function to update Path and TpValue
	local function updateValues()
		if tp.Value and roleMap[role.Value] then
			path.Value = roleMap[role.Value].path
			tpv.Value = roleMap[role.Value].tpv
		end
	end
	
	-- Continuously update every 0.1 seconds
	while true do
		updateValues()
		task.wait(0.1)
	end
	
end;
task.spawn(C_ab);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.proximity script
local function C_ac()
local script = G2L["ac"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local RunService = game:GetService("RunService")
	
	local tpOn = script.Parent:WaitForChild("Tp on")      -- BoolValue
	local pathValue = script.Parent:WaitForChild("Path")  -- StringValue containing the path
	
	-- Converts a string path to an actual Instance
	local function getInstanceFromPath(pathStr)
		local current = game
		for section in pathStr:gmatch("[^%.]+") do
			if section == "game" then
				current = game
			elseif section == "workspace" then
				current = workspace
			else
				current = current:FindFirstChild(section)
				if not current then
					warn("Path not found:", section)
					return nil
				end
			end
		end
		return current
	end
	
	-- Find a part to measure distance from the prompt
	local function getPromptPart(prompt)
		if prompt.Parent:IsA("BasePart") then
			return prompt.Parent
		else
			return prompt.Parent:FindFirstChildWhichIsA("BasePart", true)
		end
	end
	
	-- Function to hold and activate the prompt
	local function activatePrompt(prompt)
		local triggered = false
		local conn
		conn = prompt.Triggered:Connect(function()
			triggered = true
			conn:Disconnect()
		end)
	
		prompt:InputHoldBegin()
		while not triggered do
			task.wait()
		end
		prompt:InputHoldEnd()
	end
	
	-- Main loop
	RunService.RenderStepped:Connect(function()
		if not tpOn.Value then return end
		if not (player.Team and player.Team.Name == "Spectating") then return end
	
		-- Get the current ProximityPrompt from Path StringValue
		local prompt = getInstanceFromPath(pathValue.Value)
		if not prompt or not prompt:IsA("ProximityPrompt") then return end
	
		local promptPart = getPromptPart(prompt)
		if not promptPart then return end
	
		local character = player.Character
		local hrp = character and character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		local distance = (hrp.Position - promptPart.Position).Magnitude
		if distance <= prompt.MaxActivationDistance then
			activatePrompt(prompt)
		end
	end)
	
end;
task.spawn(C_ac);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.teleport char script
local function C_ad()
local script = G2L["ad"];
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	local tpOn = script.Parent:WaitForChild("Tp on")      -- BoolValue
	local tpValue = script.Parent:WaitForChild("tpvalue")
	
	-- Converts a string path to an actual Instance
	local function getInstanceFromPath(pathStr)
		local current = game
		for section in pathStr:gmatch("[^%.]+") do
			if section == "game" then
				current = game
			elseif section == "workspace" then
				current = workspace
			else
				current = current:FindFirstChild(section)
				if not current then
					warn("tpvalue path not found:", section)
					return nil
				end
			end
		end
		return current
	end
	
	-- Teleport function
	local function teleportPlayer()
		local character = player.Character
		if not character then return end
	
		local hrp = character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
	
		local target = getInstanceFromPath(tpValue.Value)
		if not target or not target:IsA("BasePart") then
			warn("tpvalue does not point to a valid BasePart")
			return
		end
	
		-- Teleport the player
		hrp.CFrame = target.CFrame + Vector3.new(0, 3, 0) -- small offset so they don't clip into the part
	end
	
	-- Main loop
	while true do
		if tpOn.Value and player.Team and player.Team.Name == "Spectating" then
			teleportPlayer()
		end
		task.wait(5) -- run every 5 seconds
	end
	
end;
task.spawn(C_ad);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.visiblescript
local function C_af()
local script = G2L["af"];
	tp = script.Parent.Parent:WaitForChild("Tp on")
	tp.Changed:Connect(function()
		if tp.Value == true then
			script.Parent.Visible = true	
		else
			script.Parent.Visible = false
		end
	end)
end;
task.spawn(C_af);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.BARBARIAN.LocalScript
local function C_b1()
local script = G2L["b1"];
	local button = script.Parent
	local status = button.Parent.Parent:WaitForChild("Role") -- StringValue
	
	button.MouseButton1Click:Connect(function()
		status.Value = "Barbarian"
	end)
	
end;
task.spawn(C_b1);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.PEASANT.LocalScript
local function C_b3()
local script = G2L["b3"];
	local button = script.Parent
	local status = button.Parent.Parent:WaitForChild("Role") -- StringValue
	
	button.MouseButton1Click:Connect(function()
		status.Value = "Peasant"
	end)
	
end;
task.spawn(C_b3);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.ScrollingFrame.CIVILIAN.LocalScript
local function C_b5()
local script = G2L["b5"];
	local button = script.Parent
	local status = button.Parent.Parent:WaitForChild("Role") -- StringValue
	
	button.MouseButton1Click:Connect(function()
		status.Value = "Civilian"
	end)
	
end;
task.spawn(C_b5);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.autoteamselectedprompt.LocalScript
local function C_b9()
local script = G2L["b9"];
	local role = script.Parent.Parent:WaitForChild("Role")
	
	-- Update the text whenever Role changes
	role.Changed:Connect(function()
		script.Parent.Text = "AUTO TEAM SELECTED: " .. role.Value
	end)
	
	-- Optional: also set it once immediately
	script.Parent.Text = "AUTO TEAM SELECTED: " .. role.Value
	
end;
task.spawn(C_b9);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AUTOTEAM.autoteamselectedprompt.visiblescript
local function C_ba()
local script = G2L["ba"];
	tp = script.Parent.Parent:WaitForChild("Tp on")
	tp.Changed:Connect(function()
		if tp.Value == true then
			script.Parent.Visible = true	
		else
			script.Parent.Visible = false
		end
	end)
end;
task.spawn(C_ba);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame3.Scroll.Frame.AXE AUTOFARM.LocalScript
local function C_c2()
local script = G2L["c2"];
	button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		local success, errorMessage = pcall(function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/Noodlezxo/2a058c59c1b4342b0bd326cbc41954c1/raw/d29ed2327a9d1d0d1ff9f5f4861212ccda239e32/gistfile1.txt", true))()
		end)
	
		if not success then
			warn("Script failed to load: " .. errorMessage)
		end
	end)
end;
task.spawn(C_c2);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.LocalScript
local function C_c5()
local script = G2L["c5"];
	local CreditsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("CreditsGui")
	
	-- Set initial visibility
	script.Parent.Visible = CreditsGui.Value
	
	-- Update when the BoolValue changes
	CreditsGui.Changed:Connect(function(newValue)
		script.Parent.Visible = newValue
	end)
	
	-- Optional: if you really want a loop to constantly check (not recommended)
	-- while true do
	--     script.Parent.Visible = ESPGui.Value
	--     wait(0.01)
	-- end
	
end;
task.spawn(C_c5);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame4.Scroll.Frame.Copy dc link.copy link script
local function C_ca()
local script = G2L["ca"];
	script.Parent.MouseButton1Click:Connect(function()
		setclipboard("discord.gg/rYbnn63Whv")
		script.Parent.Text = "Copied!"
		wait(1)
		script.Parent.Text = "Copy Discord"
	end)
end;
task.spawn(C_ca);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.LocalScript
local function C_d0()
local script = G2L["d0"];
	local KeybindsGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("KeybindsGui")
	
	-- Set initial visibility
	script.Parent.Visible = KeybindsGui.Value
	
	-- Update when the BoolValue changes
	KeybindsGui.Changed:Connect(function(newValue)
		script.Parent.Visible = newValue
	end)
	
	-- Optional: if you really want a loop to constantly check (not recommended)
	-- while true do
	--     script.Parent.Visible = ESPGui.Value
	--     wait(0.01)
	-- end
	
end;
task.spawn(C_d0);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change to Dark Mode.ui color script
local function C_d4()
local script = G2L["d4"];
	local button = script.Parent
	local screenGui = button:FindFirstAncestorOfClass("ScreenGui")
	
	if not screenGui then
		warn("ScreenGui not found!")
		return
	end
	
	local TOLERANCE = 0.05
	
	local colorMappings = {
		{target = Color3.fromRGB(255, 215, 240), replacement = Color3.fromRGB(66, 66, 66)},
		{target = Color3.fromRGB(255, 255, 255), replacement = Color3.fromRGB(33, 33, 33)},
		{target = Color3.fromRGB(255, 230, 245), replacement = Color3.fromRGB(0, 0, 0)},
	}
	
	local UI_STROKE_ORIGINAL = Color3.fromRGB(255, 120, 190)
	local UI_STROKE_DARK     = Color3.fromRGB(0, 0, 0)
	
	local function colorsClose(a, b)
		return math.abs(a.R - b.R) <= TOLERANCE
			and math.abs(a.G - b.G) <= TOLERANCE
			and math.abs(a.B - b.B) <= TOLERANCE
	end
	
	local isDarkMode = false
	
	local function applyDarkMode()
		for _, obj in ipairs(screenGui:GetDescendants()) do
			-- BackgroundColor3
			if obj:IsA("GuiObject") then
				local bg = obj.BackgroundColor3
				for _, map in colorMappings do
					if colorsClose(bg, map.target) then
						-- Save original if not saved yet
						if obj:GetAttribute("OrigBG") == nil then
							obj:SetAttribute("OrigBG", bg)
						end
						obj.BackgroundColor3 = map.replacement
					end
				end
			end
	
			-- ImageColor3
			if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
				local img = obj.ImageColor3
				for _, map in colorMappings do
					if colorsClose(img, map.target) then
						if obj:GetAttribute("OrigImg") == nil then
							obj:SetAttribute("OrigImg", img)
						end
						obj.ImageColor3 = map.replacement
					end
				end
			end
	
			-- TextColor3 → White
			if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
				if obj:GetAttribute("OrigText") == nil then
					obj:SetAttribute("OrigText", obj.TextColor3)
				end
				obj.TextColor3 = Color3.fromRGB(255, 255, 255)
				obj.TextTransparency = 0
			end
	
			-- UIStroke
			for _, child in obj:GetChildren() do
				if child:IsA("UIStroke") and colorsClose(child.Color, UI_STROKE_ORIGINAL) then
					if child:GetAttribute("OrigStroke") == nil then
						child:SetAttribute("OrigStroke", child.Color)
					end
					child.Color = UI_STROKE_DARK
				end
			end
		end
	end
	
	local function applyLightMode()
		for _, obj in ipairs(screenGui:GetDescendants()) do
			-- Restore Background
			if obj:GetAttribute("OrigBG") then
				obj.BackgroundColor3 = obj:GetAttribute("OrigBG")
				obj:SetAttribute("OrigBG", nil)
			end
	
			-- Restore ImageColor3
			if obj:GetAttribute("OrigImg") then
				obj.ImageColor3 = obj:GetAttribute("OrigImg")
				obj:SetAttribute("OrigImg", nil)
			end
	
			-- Restore TextColor3
			if obj:GetAttribute("OrigText") then
				obj.TextColor3 = obj:GetAttribute("OrigText")
				obj:SetAttribute("OrigText", nil)
			end
	
			-- Restore UIStroke
			for _, child in obj:GetChildren() do
				if child:IsA("UIStroke") and child:GetAttribute("OrigStroke") then
					child.Color = child:GetAttribute("OrigStroke")
					child:SetAttribute("OrigStroke", nil)
				end
			end
		end
	end
	
	button.MouseButton1Click:Connect(function()
		isDarkMode = not isDarkMode
	
		if isDarkMode then
			applyDarkMode()
			print("Dark Mode ON")
		else
			applyLightMode()
			print("Light Mode Restored")
		end
	end)
	
	-- Optional: Auto-restore when GUI is reset/re-enabled
	screenGui:GetPropertyChangedSignal("Enabled"):Connect(function()
		if not screenGui.Enabled and isDarkMode then
			task.wait() -- wait for re-enable
			if screenGui.Enabled and isDarkMode then
				isDarkMode = false
				applyLightMode()
			end
		end
	end)
end;
task.spawn(C_d4);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame5.Scroll.GUI.Change Text Rainbow.text color change script
local function C_d8()
local script = G2L["d8"];
	local button = script.Parent
	local screenGui = button:FindFirstAncestorOfClass("ScreenGui")
	local RunService = game:GetService("RunService")
	
	if not screenGui then
		warn("ScreenGui not found!")
		return
	end
	
	-- Rainbow settings
	local speed = 0.05      -- slow hue change per second (can be adjusted 0.01-1)
	local saturation = 1
	local value = 1
	
	local rainbowActive = false
	local connection
	local textObjects = {}
	local originalColors = {}
	
	-- Collect text objects and store original colors
	local function collectTextObjects()
		textObjects = {}
		originalColors = {}
		for _, obj in ipairs(screenGui:GetDescendants()) do
			if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) and obj.Parent then
				table.insert(textObjects, obj)
				originalColors[obj] = obj.TextColor3
				obj.TextTransparency = 0
				if obj:IsA("TextLabel") or obj:IsA("TextButton") then
					obj.TextStrokeTransparency = 1
				end
			end
		end
	end
	
	button.MouseButton1Click:Connect(function()
		if rainbowActive then
			-- Stop rainbow and restore original colors
			if connection then
				connection:Disconnect()
				connection = nil
			end
			for obj, color in pairs(originalColors) do
				if obj and obj.Parent then
					obj.TextColor3 = color
				end
			end
			rainbowActive = false
		else
			-- Start rainbow
			collectTextObjects()
			rainbowActive = true
			local hue = 0
			connection = RunService.RenderStepped:Connect(function(dt)
				-- Clamp dt to avoid huge jumps at low FPS
				local clampedDt = math.clamp(dt, 0, 0.03) -- max 30ms per frame
				hue = (hue + clampedDt * speed) % 1
				local color = Color3.fromHSV(hue, saturation, value)
				for _, obj in ipairs(textObjects) do
					if obj and obj.Parent then
						obj.TextColor3 = color
					end
				end
			end)
		end
	end)
	
end;
task.spawn(C_d8);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.LocalScript
local function C_df()
local script = G2L["df"];
	local AutoBuyGui = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("AutoBuyGui")
	
	-- Set initial visibility
	script.Parent.Visible = AutoBuyGui.Value
	
	-- Update when the BoolValue changes
	AutoBuyGui.Changed:Connect(function(newValue)
		script.Parent.Visible = newValue
	end)
end;
task.spawn(C_df);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_1.esp script
local function C_e4()
local script = G2L["e4"];
	-- LocalScript → Place directly inside a TextButton, ImageButton, or any clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (auto-updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Food store, seat 3
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Food")
		:WaitForChild("CustomerSeats")
		:WaitForChild("1")
	
	-- Safety check
	if not seat:IsA("Seat") and not seat:IsA("VehicleSeat") then
		warn("Target is not a seat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Food Customer Seat 1")
			end
		end)
	
		-- Clickable Part in workspace (auto-adds ClickDetector)
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Food Customer Seat 1")
				end
			end
		end)
	end
end;
task.spawn(C_e4);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_2.esp script
local function C_e8()
local script = G2L["e8"];
	-- LocalScript → Place directly inside a TextButton, ImageButton, or any clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (auto-updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Food store, seat 3
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Food")
		:WaitForChild("CustomerSeats")
		:WaitForChild("2")
	
	-- Safety check
	if not seat:IsA("Seat") and not seat:IsA("VehicleSeat") then
		warn("Target is not a seat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Food Customer Seat 2")
			end
		end)
	
		-- Clickable Part in workspace (auto-adds ClickDetector)
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Food Customer Seat 2")
				end
			end
		end)
	end
end;
task.spawn(C_e8);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_3.teleport script
local function C_ec()
local script = G2L["ec"];
	-- LocalScript → Place directly inside a TextButton, ImageButton, or any clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (auto-updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Food store, seat 3
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Food")
		:WaitForChild("CustomerSeats")
		:WaitForChild("3")
	
	-- Safety check
	if not seat:IsA("Seat") and not seat:IsA("VehicleSeat") then
		warn("Target is not a seat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Food Customer Seat 3")
			end
		end)
	
		-- Clickable Part in workspace (auto-adds ClickDetector)
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Food Customer Seat 3")
				end
			end
		end)
	end
end;
task.spawn(C_ec);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_4.teleport script
local function C_f0()
local script = G2L["f0"];
	-- LocalScript → Place directly inside a TextButton, ImageButton, or any Part you want clickable
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Character & HumanoidRootPart (auto-updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Doctor store, seat 1
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Doctor")
		:WaitForChild("CustomerSeats")
		:WaitForChild("1")
	
	-- Safety check
	if not (seat:IsA("Seat") or seat:IsA("VehicleSeat")) then
		warn("Doctor CustomerSeats['1'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- CLICK TO TELEPORT
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Doctor Customer Seat 1")
			end
		end)
	
		-- Clickable Part in the world
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Doctor Customer Seat 1")
				end
			end
		end)
	end
end;
task.spawn(C_f0);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_5.teleport script
local function C_f4()
local script = G2L["f4"];
	-- LocalScript → Put this directly inside your TextButton, ImageButton, or any clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (updates automatically when you respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
		humanoidRootPart = humanPart -- fixed typo in previous version
	end)
	
	-- Target seat: Doctor store, seat 2
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Doctor")
		:WaitForChild("CustomerSeats")
		:WaitForChild("2")
	
	-- Safety check
	if not (seat:IsA("Seat") or seat:IsA("VehicleSeat")) then
		warn("Doctor CustomerSeats['2'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Doctor Customer Seat 2")
			end
		end)
	
		-- Clickable Part in workspace
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Doctor Customer Seat 2")
				end
			end
		end)
	end
end;
task.spawn(C_f4);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_6.teleport script
local function C_f8()
local script = G2L["f8"];
	-- LocalScript → Place directly inside a TextButton, ImageButton, or any clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:WaitForChild("HumanoidRootPart")
	
	-- Keep working after you die/respawn
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Doctor store, seat 3
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Doctor")
		:WaitForChild("CustomerSeats")
		:WaitForChild("3")
	
	-- Safety check
	if not (seat:IsA("Seat") or seat:IsA("VehicleSeat")) then
		warn("Doctor CustomerSeats['3'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Doctor Customer Seat 3")
			end
		end)
	
		-- Clickable Part in the world
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Doctor Customer Seat 3")
				end
			end
		end)
	end
end;
task.spawn(C_f8);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_7.teleport script
local function C_fc()
local script = G2L["fc"];
	-- LocalScript → Put this INSIDE a TextButton, ImageButton, or any Part you want to click
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (auto-updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: FishingNet store, seat number 3
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("FishingNet")
		:WaitForChild("CustomerSeats")
		:WaitForChild("1")
	
	-- Safety check
	if not (seat:IsA("Seat") or seat:IsA("VehicleSeat")) then
		warn("FishingNet CustomerSeats['1'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to FishingNet Customer Seat 1")
			end
		end)
	
		-- Clickable Part in workspace
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to FishingNet Customer Seat 1")
				end
			end
		end)
	end
end;
task.spawn(C_fc);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_8.teleport script
local function C_100()
local script = G2L["100"];
	-- LocalScript → Put this INSIDE a TextButton, ImageButton, or any Part you want to click
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (auto-updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: FishingNet store, seat number 3
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("FishingNet")
		:WaitForChild("CustomerSeats")
		:WaitForChild("2")
	
	-- Safety check
	if not (seat:IsA("Seat") or seat:IsA("VehicleSeat")) then
		warn("FishingNet CustomerSeats['2'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to FishingNet Customer Seat 2")
			end
		end)
	
		-- Clickable Part in workspace
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to FishingNet Customer Seat 2")
				end
			end
		end)
	end
end;
task.spawn(C_100);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_9.teleport script
local function C_104()
local script = G2L["104"];
	-- LocalScript → Put this INSIDE a TextButton, ImageButton, or any Part you want to click
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (auto-updates on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: FishingNet store, seat number 3
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("FishingNet")
		:WaitForChild("CustomerSeats")
		:WaitForChild("3")
	
	-- Safety check
	if not (seat:IsA("Seat") or seat:IsA("VehicleSeat")) then
		warn("FishingNet CustomerSeats['3'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to FishingNet Customer Seat 3")
			end
		end)
	
		-- Clickable Part in workspace
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to FishingNet Customer Seat 3")
				end
			end
		end)
	end
end;
task.spawn(C_104);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_10.teleport script
local function C_108()
local script = G2L["108"];
	-- LocalScript → Place directly inside your TextButton, ImageButton, or a clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (updates automatically on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Keep it working after death/respawn
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Axe store, seat number 2
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Axe")
		:WaitForChild("CustomerSeats")
		:WaitForChild("1")
	
	-- Safety check
	if not seat:IsA("Seat") or seat:IsA("VehicleSeat") then
		-- All good
	else
		warn("Axe CustomerSeats['1'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Axe Customer Seat 1")
			end
		end)
	
		-- Clickable Part in the world
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Axe Customer Seat 1")
				end
			end
		end)
	end
end;
task.spawn(C_108);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_11.teleport script
local function C_10c()
local script = G2L["10c"];
	-- LocalScript → Place directly inside your TextButton, ImageButton, or a clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (updates automatically on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Keep it working after death/respawn
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Axe store, seat number 2
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Axe")
		:WaitForChild("CustomerSeats")
		:WaitForChild("2")
	
	-- Safety check
	if not seat:IsA("Seat") or seat:IsA("VehicleSeat") then
		-- All good
	else
		warn("Axe CustomerSeats['2'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Axe Customer Seat 2")
			end
		end)
	
		-- Clickable Part in the world
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Axe Customer Seat 2")
				end
			end
		end)
	end
end;
task.spawn(C_10c);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_12.teleport script
local function C_110()
local script = G2L["110"];
	-- LocalScript → Place directly inside your TextButton, ImageButton, or a clickable Part
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Current character (updates automatically on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Keep it working after death/respawn
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat: Axe store, seat number 2
	local seat = workspace
		:WaitForChild("Stores")
		:WaitForChild("Axe")
		:WaitForChild("CustomerSeats")
		:WaitForChild("3")
	
	-- Safety check
	if not seat:IsA("Seat") or seat:IsA("VehicleSeat") then
		-- All good
	else
		warn("Axe CustomerSeats['3'] is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Axe Customer Seat 3")
			end
		end)
	
		-- Clickable Part in the world
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Axe Customer Seat 3")
				end
			end
		end)
	end
end;
task.spawn(C_110);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_13.esp script
local function C_114()
local script = G2L["114"];
	-- LocalScript → Put this INSIDE your TextButton, ImageButton, or a Part (with or without ClickDetector)
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Get character and HumanoidRootPart (and keep it updated on respawn)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- Target seat
	local seat = workspace
		:WaitForChild("BarbStores")
		:WaitForChild("Bow")
		:WaitForChild("CustomerSeat")
	
	-- Safety check
	if not seat:IsA("Seat") and not seat:IsA("VehicleSeat") then
		warn("BarbStores.Bow.CustomerSeat is not a Seat or VehicleSeat!")
		return
	end
	
	-- === CLICK DETECTION ===
	local button = script.Parent
	
	-- GUI Button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to BarbStores Bow CustomerSeat")
			end
		end)
	
		-- Regular Part in workspace (auto-creates ClickDetector if missing)
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChildWhichIsA("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to BarbStores Bow CustomerSeat")
				end
			end
		end)
	end
end;
task.spawn(C_114);
-- StarterGui.#1 GRG Script.Main.Frame.Frame.Frame6.Scroll.Frame.Teleport_14.teleport script
local function C_118()
local script = G2L["118"];
	-- LocalScript → Place this inside a TextButton, ImageButton, or a Part with a ClickDetector
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Path to the target seat
	local seat = workspace
		:WaitForChild("BarbStores")
		:WaitForChild("Bomb")
		:WaitForChild("CustomerSeat")
	
	-- Safety check (runs once)
	if not seat:IsA("Seat") and not seat:IsA("VehicleSeat") then
		warn("Target is not a Seat/VehicleSeat!")
		return
	end
	
	-- Make sure the character is always up to date (in case of respawn)
	player.CharacterAdded:Connect(function(newChar)
		character = newChar
		humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
	end)
	
	-- === CLICK TO TELEPORT ===
	local button = script.Parent  -- This works whether it's a GuiButton or a Part with ClickDetector
	
	-- If it's a GUI button (TextButton, ImageButton, etc.)
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			if humanoidRootPart and humanoidRootPart.Parent then
				humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
				print(player.Name .. " teleported to Bomb CustomerSeat")
			end
		end)
	
		-- If it's a regular Part in the Workspace (needs a ClickDetector)
	elseif button:IsA("BasePart") then
		local clickDetector = button:FindFirstChild("ClickDetector") or Instance.new("ClickDetector")
		clickDetector.Parent = button
	
		clickDetector.MouseClick:Connect(function(clickingPlayer)
			if clickingPlayer == player then
				if humanoidRootPart and humanoidRootPart.Parent then
					humanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
					print(player.Name .. " teleported to Bomb CustomerSeat")
				end
			end
		end)
	end
end;
task.spawn(C_118);
-- StarterGui.#1 GRG Script.Main.Close.LocalScript
local function C_11f()
local script = G2L["11f"];
	button = script.Parent
	openbutton = script.Parent.Parent.Parent:WaitForChild("Open")
	status = script.Parent.Parent.Parent:WaitForChild("GUItoggled")
	button.MouseButton1Click:connect(function()
		status.Value = false
		if status.Value == false then
			script.Parent.Parent.Visible = false
			openbutton.Visible = true
		end
	end)
end;
task.spawn(C_11f);
-- StarterGui.#1 GRG Script.Open.LocalScript
local function C_126()
local script = G2L["126"];
	button = script.Parent
	status = script.Parent.Parent:WaitForChild("GUItoggled")
	button.MouseButton1Click:connect(function()
		status.Value = true
		if status.Value == true then
			script.Parent.Parent:WaitForChild("Main").Visible = true
			button.Visible = false
		if status.Value == false then
			script.Parent.Parent:WaitForChild("Main").Visible = true
		end
		end
	end)
end;
task.spawn(C_126);

return G2L["1"], require;
