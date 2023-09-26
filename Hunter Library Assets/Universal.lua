local Library = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Library:CreateWindow({
    Name = " Welcome To Hunter Library v3 -  Universal",
    LoadingTitle = "Welcome To Hunter Library v3 - Scripthub",
    LoadingSubtitle = "Loading Universal Scripthub",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Hunter Library", 
       FileName = "HunterLibConfig"
    },
    Discord = {
       Enabled = true,
       Invite = "7XZeetX9J7", 
       RememberJoins = true 
    },
    KeySystem = true, 
    KeySettings = {
       Title = "Hunter Library v3 - Scripthub",
       Subtitle = "Key System",
       Note = "Join The Discord Server (Hunter Z) For Keys.",
       FileName = "hlv3key", 
       SaveKey = true, 
       GrabKeyFromSite = false, 
       Key = {"1c534bcd57975758ac96b2ab7ad140fa", "Yast2stlfl7humedRapAnlrlwachuwus", "90c1fe0b6ffdee60e0ef16748f182c43", "47f6d52106168a6aefaa79adbfeb88e7", "c7bee16405563549f585ec675b056326"}
    }
})

Library:Notify({
    Title = "Loaded Universal Script",
    Content = "Took 32ms.",
    Duration = 5,
    Image = nil,
 }
)

local UniversalTab = Window:CreateTab("🌐 Universal Features", nil)
local AdminTab = Window:CreateTab("⚡ Admin Scripts", nil)
local MyChoiceTab = Window:CreateTab("🟢 Hunter's Choice", nil)
local gameTab = Window:CreateTab("📜 Specific Game Scripts", nil)
local GUITAB = Window:CreateTab("📊 GUI", nil)

local UniversalScripts = UniversalTab:CreateSection("Universal Player Adjustments")

local WalkSpeedSlider = UniversalTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 5000},
    Increment = 5,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "",
    Callback = function(Value)
       
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
     
        end   
        
    end,
})

local JumpPowerTextBox = UniversalTab:CreateInput({
    Name = "Jump Power",
    PlaceholderText = "100",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Text
    end,
})

local infjumpButton = UniversalTab:CreateButton({
   Name = "Enable/Disable Infinite Jump",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
Library:Notify({
    Title = "Infinite Jump Ready",
    Content = "Hunter Library - Infinite Jump",
    Duration = 2,
    Image = nil,
 }
)
	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local FlyBind = UniversalTab:CreateKeybind({
    Name = "Fly",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "flykeybind",
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
    end,
})

local ESPButton = UniversalTab:CreateButton({
    Name = "Activate ESP",
    Callback = function()
    while true do
        local Players = game:GetService("Players"):GetChildren()
        local RunService = game:GetService("RunService")
        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
            end
        end
        
        game.Players.PlayerAdded:Connect(function(player)
            repeat wait() until player.Character
            if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = player.Character
                highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.Name = "Highlight"
            end
        end)
        
        game.Players.PlayerRemoving:Connect(function(playerRemoved)
            playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
        end)
        
        RunService.Heartbeat:Connect(function()
            for i, v in pairs(Players) do
                repeat wait() until v.Character
                if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    local highlightClone = highlight:Clone()
                    highlightClone.Adornee = v.Character
                    highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                    highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlightClone.Name = "Highlight"
                    task.wait()
                end
        end
        end)
    end
    end,
})

local AdminScripts = AdminTab:CreateSection("Universal Admin Scripts")

local IYButton = AdminTab:CreateButton({
    Name = "Infinite Yield - FE Universal Admin",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"),true))()
    end,
})

local CMDXButton = AdminTab:CreateButton({
    Name = "CMD X - The Terminal of Commands",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"),true))()
    end,
})

local RevizButton = AdminTab:CreateButton({
    Name = "Reviz - FE Admin",
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/Caniwq2N"),true))()
    end,    
})

local MyChoiceSection = MyChoiceTab:CreateSection("Part Universal / Universal Scripts")

local HydroHubButton = MyChoiceTab:CreateButton({
    Name = "Hydro Hub - Part Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/checkm4te8/Exploit-Scripts/main/HydroHub/Loader.lua", true))() 
    end,
})

local MSHubButton = MyChoiceTab:CreateButton({
    Name = "MSHUB - Part Universal 10/10",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua", true))() 
    end,
})
local VynixuButton = MyChoiceTab:CreateButton({
    Name = "Vynixu - Part Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua", true))() 
    end,
})
local SiriusButton = MyChoiceTab:CreateButton({
    Name = "Sirus - Universal",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9c713d33d088aa364a38d738290ed707.lua"))()
    end,
})

local NonUNiSection = MyChoiceTab:CreateSection("Other Non Universal Scripts")

local SnowPlowButton = MyChoiceTab:CreateButton({
    Name = "idfk snow plow sim hack By Untoast for Snow Plow Sim",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Untoast/Snow-Plow-Simulator-script/main/Snow%20Plow%20Simulator%20Script.lua"))()
    end,
})

local BobhubButton = MyChoiceTab:CreateButton({
    Name = "Blackking X Bobhub For DOORS by a00pkidd And KingHub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZanoLeafVN/Blackking-x-BobHub/main/77_8PVUQMXI.lua"))()
    end,
})

local SpecificScripts = gameTab:CreateSection("Scripts For Specific games")

local SnowPlowButton2 = gameTab:CreateButton({
    Name = "idfk snow plow sim hack By Untoast for Snow Plow Sim",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Untoast/Snow-Plow-Simulator-script/main/Snow%20Plow%20Simulator%20Script.lua"))()
    end,
})

local BXBobhubButton = gameTab:CreateButton({
    Name = "Blackking X Bobhub For DOORS by a00pkidd And KingHub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZanoLeafVN/Blackking-x-BobHub/main/77_8PVUQMXI.lua"))()
    end,
})

local vothn = gameTab:CreateButton({
    Name = "Voth - Squid Game",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vasivee/Voth/main/SquidGames.lua"))()
    end,
})

local pearl = gameTab:CreateButton({
    Name = "Pearl Hub - Sharkbite 2",
    Callback = function()
        loadstring(game:HttpGet('https://ppearl.vercel.app'))()
    end,
})

local NL = gameTab:CreateButton({
    Name = "Blacktrap - Ninja Legends",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/S4nZz/bt_project/main/Games/BlacktrapScript.txt'))()
    end,
})

local Destroy = GUITAB:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Library:Destroy()
    end,
})

local CreditsSection = GUITAB:CreateSection("Credits")

local UILabel = GUITAB:CreateLabel("User Interface Suite - Sirius")
local SCRLabel = GUITAB:CreateLabel("Scripting - mrkillinghunter_")


