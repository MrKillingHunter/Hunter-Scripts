local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local togglemoney = false
local togglerebirths = false

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Hunter Library (v1.1) - Snow Plow Sim',
    Center = true,
    AutoShow = true,
    ShowCustomCursor = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Script features'),
    ['UI Settings'] = Window:AddTab('Credits And Configs'),
}

local Money = Tabs.Main:AddLeftGroupbox('Adding')
local Movement = Tabs.Main:AddRightGroupbox('Player')
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('GUI')
local Credits = Tabs['UI Settings']:AddRightGroupbox('Credits')

Money:AddToggle('MyToggle', {
    Text = 'Add Snow (Toggle)',
    Default = false, -- Default value (true / false)
    Tooltip = 'Infinitely Adds Snow until The Toggle Is Turned Off', -- Information shown when you hover over the toggle

    Callback = function()
        togglemoney = true
        while togglemoney == true do
            game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-99999999999999, "1 Stick", true)
            wait(0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)
        end
    end
})
local MyButton = Money:AddButton({
    Text = 'Add Snow',
    Func = function()
        game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-999999999999999, "1 Stick", true)
    end,
    DoubleClick = false,
    Tooltip = 'Adds 1mil Snow'
})
Money:AddToggle('MyToggle', {
    Text = 'Add Rebirths (Toggle)',
    Default = false, -- Default value (true / false)
    Tooltip = 'Infinitely Adds Rebirths until The Toggle Is Turned Off or You Run Out Of Snow', -- Information shown when you hover over the toggle

    Callback = function()      
        togglerebirths = true
        while togglerebirths == true do
            game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
            wait(0.001)
    end
    end
})
local MyButton = Money:AddButton({
    Text = 'Add Rebirths',
    Func = function()
        game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
    end,
    DoubleClick = false,
    Tooltip = 'Adds 10k Rebirths'
})

Money:AddDivider()


local MyButton = Money:AddButton({
    Text = 'Collect All Gems',
    Func = function()
            local Gems = game:GetService("Workspace").Gems
local LP = game:GetService("Players").LocalPlayer.Character

while wait() do
for _,v in pairs(Gems:GetDescendants()) do
   if v:IsA("TouchTransmitter") then
       firetouchinterest(LP.HumanoidRootPart, v.Parent, 0)
       firetouchinterest(LP.HumanoidRootPart, v.Parent, 1)
   end
end
end
local Snow = game:GetService("Workspace").HitParts
while task.wait() do
for _,v in pairs(Snow:GetChildren()) do
if v.Name == "Snow" then
game:GetService("ReplicatedStorage").Events.HitPart:FireServer(v)
end
end
end
    end,
    DoubleClick = false,
    Tooltip = 'Collects All Gems Now And In Future'
})
local MyButton = Money:AddButton({
    Text = 'Plow All Snow (READ DESC)',
    Func = function()
        local Snow = game:GetService("Workspace").HitParts
while task.wait() do
for _,v in pairs(Snow:GetChildren()) do
if v.Name == "Snow" then
game:GetService("ReplicatedStorage").Events.HitPart:FireServer(v)
end
end
end
    end,
    DoubleClick = false,
    Tooltip = 'You CANT disable this, and also very laggy'
})
Movement:AddSlider('MySlider', {
    Text = 'Walkspeed',
    Default = 16,
    Min = 16,
    Max = 999,
    Rounding = 1,
    Compact = false,

    Callback = function(Wspeed)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Wspeed
    end
})
Movement:AddLabel('Keybind'):AddKeyPicker('KeyPicker', {
    -- SyncToggleState only works with toggles.
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = 'F', -- String as the name of the keybind (MB1, MB2 for mouse buttons)
    SyncToggleState = false,


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Fly Keybind', -- Text to display in the keybind menu
    NoUI = true, -- Set to true if you want to hide from the Keybind menu,

    -- Occurs when the keybind is clicked, Value is `true`/`false`
    Callback = function()
        if flying == false then
            flying = true
        else
            flying = false
        end
            repeat wait() 
        until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
    local mouse = game.Players.LocalPlayer:GetMouse() 
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer 
    local torso = plr.Character.HumanoidRootPart 
    local deb = true 
    local ctrl = {f = 0, b = 0, l = 0, r = 0} 
    local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
    local maxspeed = 50 
    local speed = 0 
     
    function Fly() 
    local bg = Instance.new("BodyGyro", torso) 
    bg.P = 9e4 
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
    bg.cframe = torso.CFrame 
    local bv = Instance.new("BodyVelocity", torso) 
    bv.velocity = Vector3.new(0,0.1,0) 
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
    repeat wait() 
    plr.Character.Humanoid.PlatformStand = true 
    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
    speed = speed+.5+(speed/maxspeed) 
    if speed > maxspeed then 
    speed = maxspeed 
    end 
    elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
    speed = speed-1 
    if speed < 0 then 
    speed = 0 
    end 
    end 
    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
    elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
    else 
    bv.velocity = Vector3.new(0,0.1,0) 
    end 
    bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
    until not flying 
    ctrl = {f = 0, b = 0, l = 0, r = 0} 
    lastctrl = {f = 0, b = 0, l = 0, r = 0} 
    speed = 0 
    bg:Destroy() 
    bv:Destroy() 
    plr.Character.Humanoid.PlatformStand = false 
    end 
    mouse.KeyDown:connect(function(key) 
    if key:lower() == "`=`=`=`=" then 
    if flying then flying = false 
    else 
    flying = true 
    Fly() 
    end 
    elseif key:lower() == "w" then 
    ctrl.f = 1 
    elseif key:lower() == "s" then 
    ctrl.b = -1 
    elseif key:lower() == "a" then 
    ctrl.l = -1 
    elseif key:lower() == "d" then 
    ctrl.r = 1 
    end 
    end) 
    mouse.KeyUp:connect(function(key) 
    if key:lower() == "w" then 
    ctrl.f = 0 
    elseif key:lower() == "s" then 
    ctrl.b = 0 
    elseif key:lower() == "a" then 
    ctrl.l = 0 
    elseif key:lower() == "d" then 
    ctrl.r = 0 
    end 
    end)
    Fly()
    end})

Credits:AddLabel('UIs - violin-sutsuki and other\n respective creators')
Credits:AddLabel('Inspiration - Bobhub And MSHUB')
Credits:AddLabel('Scripting - mrkillinghunter ')

-- Library functions
-- Sets the watermark visibility
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

MenuGroup:AddButton('Close GUI', function() Library:Unload() end)
local MyButton = MenuGroup:AddButton({
    Text = 'Join The Discord Server',
    Func = function()
        if setclipboard then 
            setclipboard("https://discord.gg/NSwjbqHRs7")   
        end
    end,
    DoubleClick = false,
    Tooltip = ''
})
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'UI Toggle Keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('Hunter Library')
SaveManager:SetFolder('Hunter Library/Snow Plow Simulator')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
