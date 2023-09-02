-- VARIABLES --

local mouse = game.Players.LocalPlayer:GetMouse()
local BodyParts = {'LeftFoot', 'LeftHand', 'LeftLowerArm', 'LeftLowerLeg', 'LeftUpperArm', 'LeftUpperLeg', 'LowerTorso', 'RightFoot', 'RightHand', 'RightLowerArm', 'RightLowerLeg', 'RightUpperLeg', 'RightUpperArm', 'UpperTorso', 'Head'}
local invitecode = ""
local HAMEWARE_Chatspam = {"HAMEWARE ON TOP!", "OWNING ANY OTHER CHEAT THEN HAMEWARE MAKES YOU AN IDIOT LIBERAL", "HAMEWARE PENCE 2020", "HAMEWARE WINNING", "GET GOOD GET HAMEWARE", "discoard.gg/"..invitecode.." discoard.gg/"..invitecode.." discoard.gg/"..invitecode.." discoard.gg/"..invitecode.." discoard.gg/"..invitecode.." discoard.gg/"..invitecode.." discoard.gg/"..invitecode.." discoard.gg/"..invitecode.." discoard.gg/"..invitecode, "HAMEWARE | TWO STUDS AHEAD OF THE GAME"}
local Furry_Chatspam = {'UwU Sowwiez! Im using hameware and owning youwww </3', 'OwO hameware is tapping aww of youw fwiends :c', 'e.e you arent using hameware?? Dat makes meh angerye!! >:c', '>.< I am tapping eyes closed with hameware~', ':3 come get hameware! discoard.gg/'..invitecode, 'OvO hameware is slotted!! C:', 'UvU no challenge for hameware! </3'}
local Swiss_Chatspam = {'SalÃ¼ zÃ¤mme Ig bin en schwiizer.', 'Hei u-huara dreck isch denn da imfall', 'Ier sing alli extrem schlecht i dem spiil lol', 'Wa wennd ier eigentlich, ich bin eh besser also leafet doch???', 'Han kei bock meh gege euch spiele, ier sind alli extrem schlecht', 'Boah alter in zuri hets boes fuetz!', 'Ig schwoer hameware isch immer ontop!', 'Hameware isch de best script wo nid full-public isch', 'holl der doch hameware! discord.gg/'..invitecode}
local HvH_Chatspam = {"HHHHHH D0g owned by Hameware user hhh", "No Hameware no talk dog LLLL", "hhhh imagine not owning hameware NN dog 2k20 Hamewareless", "come 5v5 dumb dog", "Absolute dog hhhh no Hameware no talk nn", "I'm hvh legende so shhhh", "hdf eins du hs", 'einsclick hdf hund', 'schnauze nn ich bin hvh legende', 'Hvh legend here', 'Hameware hameware nr #1 cheat', 'Antiaim top of the game'}
local China_Chatspam = {"HAMEWAREæä½³", "HAMEWAREä¸è¡£", "èæ¬é»å®¢è½¯ä»¶", "äºé©¬é", "æ·éè", "æåæºé»å®¢hameware", "å¤©å®é¨å¹¿åºæ¯åçï¼ä¸é¢æhameware, tianamen square", "ä¹æ²»Â·å¼æ´ä¼å¾·", "ç·äººå¥³äººç«ä¸­å½é¡¶", "å¯æçé»äºº", "æ¯ç²è´´è½¯ä»¶", "xå¼å¾", "æ°´å°ç", "é´èææ¯", "é»è²çæ´»æ æè°BLM", "femboyesæ¯åæ§æ"}
local uion = true
local circle = Drawing.new("Circle")
local LP = game:GetService("Players").LocalPlayer
circle.Visible = false
local fakeanim = Instance.new('Animation', workspace)
fakeanim.AnimationId = 'rbxassetid://0'
local userInputService = game:GetService("UserInputService")
userInputService.MouseBehavior = Enum.MouseBehavior.Default

local target;
local bodyname;
local ChatDebounce = false
local NameTags_Toggled = false
local ArmChams = false
local WeaponChams = false
local ArmMaterial = 'Plastic'
local WeaponMaterial = 'Plastic'
local debris = game:GetService("Workspace").Debris
local SilentAimFOV_Thickness = 1
local Show_SILENTAIMFOV = false
local CollectDebris = false
local SilentAim_Toggled = false
local NoAnims_Toggle = false
local Teamcheck_Toggled = true
local Visuals_Toggled = false
local Chams_Toggled = false
local SilentAimFOV_Filled = false
local AntiAim_Toggle = false
local isthirdperson = false
local ChatSpam = false
local Movement_Toggled = false
local Bhop_Toggled = false
local Chatspam_Toggled = false
local Bhop_Speed = 1
local Chatspam_Wait = 1
local Chatspam_Type = nil
local SilentAim_FOV = 0
local SilentAimFOV_Transparency = 0
local silentaim_headhitchance = 0
local silentaim_bodyhitchance = 0
local Pitch_Type = nil
local Yaw_Type = nil
local AntiAim_Speed = 0
local CustomPitch_Value = 0
local ArmChams_Color = Color3.new(50, 50, 50)
local WeaponChams_Color = Color3.new(50, 50, 50)
local SilentAimFOV_Numsides = 3
local CustomYaw_Value = 0
local leftrotation = CFrame.new(-150, 0, 0)
local rightrotation = CFrame.new(150, 0, 0)
local backrotation = CFrame.new(-4, 0, 0)
local ChamsColor = Color3.fromRGB(50, 50, 50)
local SilentAimFOV_Color = Color3.fromRGB(50, 50, 50)
local defaultvector = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
local hed = Instance.new('Part', workspace.Terrain)
local rhead = Instance.new('Part', hed)
local rtors = Instance.new('Part', hed)
rhead.Name = "Head"
rtors.Name = 'UpperTorso'



local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local colors = {
    SchemeColor = Color3.fromRGB(58, 247, 232),
    Background = Color3.fromRGB(15, 15, 15),
    Header = Color3.fromRGB(15, 15, 15),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(58, 247, 232)
}
local Window = Library.CreateLib("Hunter Library (v1.0) - Arsenal", colors)

local MainTab = Window:NewTab("Aimbot")
local ESPTab = Window:NewTab("ESP")
local Other = Window:AddTab("Other")
local Credits = Window:AddTab("Credits And Settings")

local AimbotSection = MainTab:NewSection("Silent Aimbot")
local AimbotSettings = MainTab:NewSection("Silent Aimbot Settings")
local addonsectionAIMBOT = MainTab:NewSection("Aimbot Addons")
local addonsectionAIMBOTVisuals = MainTab:NewSection("Aimbot Addons(VISUAL)")

AimbotSection:NewToggle("Silent Aimbot", "Locks Your Aim onto The Nearest Enemy's Head As Well As Allowing To Shoot Through Anything", function(value)
    SilentAim_Toggled = value
end)
addonsectionAIMBOTVisuals:NewToggle("Show SilentAim FOV", "nil", function(value)
    Show_SILENTAIMFOV = value
 end)
 
 addonsectionAIMBOTVisuals:NewToggle("SilentAim FOV Filled", "nil", function(value)
    SilentAimFOV_Filled = value
 end)
addonsectionAIMBOTVisuals:NewSlider("SilentAim FOV Thickness", "nil", 5, 1, function(value) -- 500 (MaxValue) | 0 (MinValue)
    SilentAimFOV_Thickness = value
end)
addonsectionAIMBOTVisuals:NewSlider("SilentAim FOV numsides", "nil", 100, 3, function(value) -- 500 (MaxValue) | 0 (MinValue)
    SilentAimFOV_Numsides = value
end)
addonsectionAIMBOTVisuals:NewColorPicker('SilentAim FOV Color', "nil", Color3.fromRGB(50, 50, 50), function(color3)
    SilentAimFOV_Color = color3
end)

local ESPSECTION = ESPTab:NewSection("ESP")
local ESPSETTINGS = ESPTab:NewSection("ESP Settings")


ESPSECTION:NewToggle("Enable ESPs", "Enables Visual Features", function(value)
    Visuals_Toggled = value
end)
ESPSECTION:NewToggle("Player ESP", "Enables Chams For Players", function(value)
    Chams_Toggled = value
end)
ESPSECTION:NewToggle("Player ESP (NAMETAG)", "Enables A Textbox Above Everyplayer Stating Their username. Cannot Be Disabled", function(value)
    NameTags_Toggled = value
end)
ESPSECTION:NewColorPicker("Player ESP Color", "The Colour For Player Chams", Color3.fromRGB(0,0,0), function(color3)
    ChamsColor = color3
end)
ESPSECTION:NewKeybind("ThirdPerson Keybind", "Enables ThirdPerson", Enum.KeyCode.X, function()
	if not isthirdperson then
        isthirdperson = true
    else
        isthirdperson = false
    end
    
 end, function()
 end)

local Player = Other:NewSection("Player Cheats")
local Troll = Other:NewSection("Trolling")

Player:NewToggle("Collect Debris", "nil", function(value)
    CollectDebris = value
end)
Player:NewToggle("Inf Jump", "nil", function(value)
    Bhop_Toggled = value
end)
Player:NewSlider("Bhop Speed", "Inf Jump Speed", 0, 100, function(value)
    Bhop_Speed = value
 end)

Troll:NewButton("Kill All", "Kills Every Player Except You", function()
    -- Function to kill a player
local function killPlayer(player)
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.Health = 0
    end
end

-- Function to kill all players in the game except the local player
local function killAllPlayersExceptLocal()
    local localPlayer = game.Players.LocalPlayer
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer then
            killPlayer(player)
        end
    end
end

-- Bind the function to a key or UI button to trigger it
-- Example: bind to the "K" key
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.K then
        killAllPlayersExceptLocal()
    end
end)
end)

local creditsection = Credits:AddSection("Credits")

creditsection:NewButton("mrkillinghunter_", "Copy My Discord User To Your Clipboard", function()
    local copy = "mrkillinghunter_" script.parent.MouseButton1Click:Connect(function(plr) setclipboard(tostring(copy)) end)
end)
creditsection:NewButton("join The Discord Server", "Copy The Discord Invite Link To Your Clipboard", function()
    local copy = "https://discord.gg/NSwjbqHRs7" setclipboard(tostring(copy)) end)

creditsection:NewKeybind("UI Toggle Keybind", "", Enum.KeyCode.End, function()
	Library:ToggleUI()
end)
