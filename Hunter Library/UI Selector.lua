local BOBHUBLOADED = false
local orionidk = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Orion%20Library%20Version/Hunter%20Library%20Orion%20Loader.lua'),true)()
local Fluxshit = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Flux%20UI%20Version/Hunter%20Library%20Flux%20Loader.lua'),true)()
local rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Linoria%20UI%20(DEFAULT)/Hunter%20Library%20Loader.lua'),true)()
local venyx = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Venyx%20UI%20Version/Hunter%20Library%20Venyx%20Loader.lua'),true)()
local kavo = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Kavo%20UI%20Version/Hunter%20Library%20Kavo%20Loader.lua'),true)()
local linoria = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Linoria%20UI%20(DEFAULT)/Hunter%20Library%20Loader.lua'),true)()

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/LinoriaLibREMAKE/main/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'UI Selector',
    Center = true,
})

local Tabs = {
  -- Creates a new tab titled Main
    Main = Window:AddTab('UI Selector'),
    ['UI Settings'] = Window:AddTab('Configs And Themes'),
}
    

local LeftGroupBox = Tabs.Main:AddLeftGroupbox("UI Libraries")
local MenuGroup = Tabs.Main:AddRightGroupBox("Selector Settings")

LeftGroupBox:AddButton('Linoria UI', function(val), Tooltip = 'Loads the Default Hunter Library (Linoria UI)', Library:Unload() getgenv().BOBHUBLOADED = false end),
LeftGroupBox:AddButton('Kavo UI', function(val1), Tooltip = 'Loads the Kavo UI Version of Hunter Library', Library:Unload() getgenv().BOBHUBLOADED = false end),
LeftGroupBox:AddButton('Venyx UI', function(val2), Tooltip = 'Loads the Venyx Ui Version of Hunter Library', Library:Unload() getgenv().BOBHUBLOADED = false end),
LeftGroupBox:AddButton('Rayfield UI', function(val3), Tooltip = 'Loads the Rayfield UI Version Of Hunter Library', Library:Unload() getgenv().BOBHUBLOADED = false end),
LeftGroupBox:AddButton('Flux UI', function(val4), Tooltip = 'Loads The Flux Version Of Hunter Library', Library:Unload() getgenv().BOBHUBLOADED = false end),
LeftGroupBox:AddButton('Orion Library UI', function(val5), Tooltip = 'Loads The Orion Library Version Of Hunter Library', Library:Unload() getgenv().BOBHUBLOADED = false end),






Library:SetWatermarkVisibility(false)

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark((''):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('Hunter Library')
SaveManager:SetFolder('Hunter Library/Loader-Configs?')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
