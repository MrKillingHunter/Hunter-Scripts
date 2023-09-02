local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/LinoriaLibREMAKE/main/Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local loaderuniversallink = 'https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/'

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'UI Selector',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
  -- Creates a new tab titled Main
    Main = Window:AddTab('UI Selector'),
    ['UI Settings'] = Window:AddTab('Configs And Themes'),
}
    

local LeftGroupBox = Tabs.Main:AddLeftGroupbox("UI Libraries")
local MenuGroup = Tabs.Main:AddRightGroupbox("Selector Settings")
local Credits = Tabs['UI Settings']:AddLeftGroupbox('Credits')
local Discord = Tabs['UI Settings']:AddLeftGroupbox('Discord')


local linoria = LeftGroupBox:AddButton({
    Text = 'Linoria UI',
    Func = function()
        loadstring(game:HttpGet(loaderuniversallink .. 'Linoria%20UI%20(DEFAULT)/Hunter%20Library%20Loader.lua'))()
        Library.Unload()
    end,
    DoubleClick = false,
    Tooltip = 'Loads The Default Hunter Library'
})

local kavo = LeftGroupBox:AddButton({
    Text = 'Kavo UI',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Kavo%20UI%20Version/Hunter%20Library%20Kavo%20Loader.lua"))()
        Library.Unload()
    end,
    DoubleClick = false,
    Tooltip = 'Loads The Default Hunter Library'
})

local venyx = LeftGroupBox:AddButton({
    Text = 'Venyx UI',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Linoria%20UI%20(DEFAULT)/Hunter%20Library%20Loader.lua"))()
        Library.Unload()
    end,
    DoubleClick = false,
    Tooltip = 'Loads The Default Hunter Library'
})

local rayfield = LeftGroupBox:AddButton({
    Text = 'Rayfield UI',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Linoria%20UI%20(DEFAULT)/Hunter%20Library%20Loader.lua"))()
        Library.Unload()
    end,
    DoubleClick = false,
    Tooltip = 'Loads The Default Hunter Library'
})

local flux = LeftGroupBox:AddButton({
    Text = 'Flux UI',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Linoria%20UI%20(DEFAULT)/Hunter%20Library%20Loader.lua"))()
        Library.Unload()
    end,
    DoubleClick = false,
    Tooltip = 'Loads The Default Hunter Library'
})

local orion = LeftGroupBox:AddButton({
    Text = 'Orion Library',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library/Linoria%20UI%20(DEFAULT)/Hunter%20Library%20Loader.lua"))()
        Library.Unload()
    end,
    DoubleClick = false,
    Tooltip = 'Loads The Default Hunter Library'
})

MenuGroup:AddButton('Destroy Selector', function() Library:Unload() end)

MenuGroup:AddDivider()

Credits:AddLabel('Hunter Library is Made And updated By mrkillinghunter_, A Hard Working Programmer/Developer Whom Works Hard To bring Awesome\n Scripts For You', true)
Credits:AddDivider()
Credits:AddLabel('Hunter Library Concept And Scripting - mrkillinghunter_', true)
Credits:AddLabel('Hunter Library Concept - yieviro92creepy', true)
Credits:AddLabel('LinoriaUI - violin sutsuki', true)
Credits:AddLabel('OtherUIs - idk but credits and prompts for them', true)
local mrkillinghunter = Discord:AddButton({
    Text = 'mrkillinghunter_',
    Func = function()
        if setclipboard then
                setclipboard("mrkillinghunter_")
            end
    end,
    DoubleClick = false,
    Tooltip = ''
})
local yieviro = Discord:AddButton({
    Text = 'yieviro92creepy',
    Func = function()
        if setclipboard then
                setclipboard("yieviro92creepy")
            end
    end,
    DoubleClick = false,
    Tooltip = ''
})

Discord:AddDivider()

local discordserver = Discord:AddButton({
    Text = 'Join Discord Server',
    Func = function()
        if setclipboard then
                setclipboard("https://discord.gg/NSwjbqHRs7")
            end
    end,
    DoubleClick = false,
    Tooltip = 'Discord invite Link'
})

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

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('Hunter Library')
SaveManager:SetFolder('Hunter Library/Ui Selector')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToGroupbox(MenuGroup)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
