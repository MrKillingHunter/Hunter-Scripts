local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library%20Assets/RayHunt%20Library'))()

local Window = Library:CreateWindow({
    Name = " Welcome To Hunter Library v3 -  Break In 2",
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
    Title = "Loaded Script For breakIn2",
    Content = "Took 32ms.",
    Duration = 5,
    Image = nil,
 }
)

local UniversalTab = Window:CreateTab("🌐 Universal Features", nil)
local BreakIn2Tab = Window:CreateTab("🎭 Break In 2", nil)
local AdminTab = Window:CreateTab("⚡ Admin Scripts", nil)
local MyChoiceTab = Window:CreateTab("🟢 Hunter's Choice", nil)
local gameTab = Window:CreateTab("📜 Specific Game Scripts", nil)
local GUITAB = Window:CreateTab("📊 GUI", nil)

local UniversalScripts = UniversalTab:CreateSection("Universal Player Adjustments")

local WalkSpeedSlider = UniversalTab:CreateSlider({
    Name = "Walkspeed (DOESN'T WORK HERE)",
    Range = {16, 5000},
    Increment = 5,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "",
    Callback = function(Value)
       
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

local executorname = getexecutorname()
local player = game.Players.LocalPlayer.DisplayName

local UILabel = GUITAB:CreateLabel("User Interface Suite - Sirius")
local SCRLabel = GUITAB:CreateLabel("Scripting - mrkillinghunter_")

local namelabel = GUITAB:CreateLabel("Welcome " .. player)
local executor = GUITAB:CreateLabel("Your Executor, " .. executorname .. ", Is Supported")

Part.Size = Vector3.new(5, 1, 5)
	Part.Parent = game:GetService("Workspace")
	Part.Anchored = true
	Part.Transparency = 1

	-- Locals
	local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
	local SelectedItem = "Med Kit"
	local Damange = 5
	local namecall
	local ScriptLoaded = false
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Lighting = game:GetService("Lighting")
	local OriginalWalkspeed = LocalPlayer.Character.Humanoid.WalkSpeed
	local OriginalJumpPower = LocalPlayer.Character.Humanoid.JumpPower
	local ModifiedWalkspeed = 50
	local ModifiedJumpPower = 100
	local OriginalBrightness = Lighting.Brightness
	local OriginalFog = Lighting.FogEnd
	local OriginalShadow = Lighting.GlobalShadows
	local HailClone = game:GetService("Workspace").Hails:Clone()
	getgenv().RemoveSlipping = false
	getgenv().SemiGodmode = false

    -- Remove Slipping Handler
	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'IceSlip' and RemoveSlipping == true then
			return wait(387420489)
		end
		return old(self, unpack(args))
	end)

    -- Semi-Godmode Handler
	namecall = hookmetamethod(game, "__namecall", function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'Energy' then
			if SemiGodmode == true then
				if args[1] < 0 then
					args[1] = 0
				end
			else
				args[1] = args[1]
			end
			return namecall(self, unpack(args))
		end
		return namecall(self, ...)
	end)

	-- Tables
	local SecretEndingTable = {
		"HatCollected",
		"MaskCollected",
		"CrowbarCollected"
	}
	local ItemsTable = {
		"Armor",
		"Med Kit",
		"Key",
		"Gold Key",
		"Louise",
		"Lollipop",
		"Chips",
		"Golden Apple",
		"Pizza",
		"Gold Pizza",
		"Rainbow Pizza",
		"Rainbow Pizza Box",
		"Book",
		"Phone",
		"Cookie",
		"Apple",
		"Bloxy Cola",
		"Expired Bloxy Cola",
		"Bottle",
		"Ladder",
		"Battery"
	}

	-- Functions
	local function UnequipAllTools()
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Backpack
			end
		end
	end
	local function EquipAllTools()
		for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Character
			end
		end
	end
	local function GiveItem(Item)
		if Item == "Armor" then
			Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(LocalPlayer), 1)
		else
			Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
		end
	end
	local function Train(Ability)
		Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
	end
	local function TakeDamange(Amount)
		Events:WaitForChild("Energy"):FireServer(-Amount, false, false)
	end
	local function TeleportTo(CFrameArg)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameArg
	end
	local function HealAllPlayers()
		UnequipAllTools()
		task.wait(.2)
		GiveItem("Golden Apple")
		task.wait(.5)
		LocalPlayer.Backpack:WaitForChild("GoldenApple").Parent = LocalPlayer.Character
		task.wait(.5)
		Events:WaitForChild("HealTheNoobs"):FireServer()
	end
	local function HealYourself()
		GiveItem("Pizza")
		Events.Energy:FireServer(25, "Pizza")
	end
	local function BreakBarricades()
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
	end
	local function BreakEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
		end)
	end
	local function KillEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true) then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true), 64.8, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyBrute") then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace").BadGuyBrute, 64.8, 4)
			end
		end)
	end

	local function GetDog()
		for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
			if v.Name:match("Circle") and v.Visible == true then
				GiveItem(tostring(v.Name:gsub("Circle", "")))
				task.wait(.1)
				LocalPlayer.Backpack:WaitForChild(tostring(v.Name:gsub("Circle", ""))).Parent = LocalPlayer.Character
				TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
				task.wait(.5)
				Events:WaitForChild("CatFed"):FireServer(tostring(v.Name:gsub("Circle", "")))
			end
		end
		task.wait(2)
		for i = 1, 3 do
			TeleportTo(CFrame.new(-203.533081, 30.4500484, -790.901428, -0.0148558766, 8.85941187e-09, -0.999889672, 2.65695732e-08, 1, 8.46563175e-09, 0.999889672, -2.64408779e-08, -0.0148558766) + Vector3.new(0, 5, 0))
			task.wait(.1)
		end
	end

	local function GetAgent()
		GiveItem("Louise")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Louise").Parent = LocalPlayer.Character
		Events:WaitForChild("LouiseGive"):FireServer(2)
	end

	local function GetUncle()
		GiveItem("Key")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Key").Parent = LocalPlayer.Character
		wait(.5)
		Events.KeyEvent:FireServer()
	end
	local function ClickPete()
		fireclickdetector(game:GetService("Workspace").UnclePete.ClickDetector)
	end
	local function CollectCash()
		for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v:FindFirstChild("Weld") and v.Transparency == 1 then
				firetouchinterest(v, LocalPlayer.Character.HumanoidRootPart, 0)
			end
		end
	end
	local function GetAllOutsideItems()
		TeleportTo(CFrame.new(-199.240555, 30.0009422, -790.182739, 0.08340507, 2.48169538e-08, 0.996515751, -2.7112752e-09, 1, -2.46767993e-08, -0.996515751, -6.43658127e-10, 0.08340507))
		for i, v in pairs(game:GetService("Workspace").OutsideParts:GetChildren()) do
			fireclickdetector(v.ClickDetector)
		end
		LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(-10, 0, 0))
	end
	local function BringAllEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
		end)
	end
	local function Noclip(State)
		LocalPlayer.Character.HumanoidRootPart.CanCollide = State
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("MeshPart") then
				v.CanCollide = State
			end
		end
	end
	local function GetSecretEnding()
		for i, v in next, SecretEndingTable do
			Events.LarryEndingEvent:FireServer(v, true)
		end
	end

	local function GetGAppleBadge()
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
		task.wait(1)

		TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
		task.wait(.5)
		fireclickdetector(game:GetService("Workspace").GoldenApple.ClickDetector)
	end

	local function AntiMud(Touchable)
		for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
			if v.Name == "Mud" and v:IsA("Part") then
				if Touchable == true then
					v.CanTouch = false
				else 
					v.CanTouch = false
				end
			end
		end
	end
	local function AntiWind()
		if game:GetService("Workspace"):FindFirstChild("WavePart") then
			game:GetService("Workspace").WavePart.CanTouch = false
		end
    end

local OPSection = BreakIn2Tab:CreateSection("Overpowered Stuff")

local note = BreakIn2Tab:CreateParagraph({Title = "Note:", Content = "Getting/Spamming Multiple Of 1 Type Of Items May Cause The Item To Break And Be Unuseable/Unequippable.\nIt Is Recommended To Only Grab 1 Item At Once, Especially If Its An Item Everyone Can Use."})

local Dropdown = BreakIn2Tab:CreateDropdown({
    Name = "Item Selector",
    Options = {"Armor", "Med Kit", "Key", "Get Key", "Louise", "Lollipop", "Chips", "Golden Apple", "Pizza", "Gold Pizza", "Rainbow Pizza", "Rainbow Pizza Box", "Book", "Phone", "Cookie", "Apple", "Bloxy Cola", "Expired Bloxy Cola", "Bottle", "Ladder", "Battery"},
    CurrentOption = {"Med Kit"},
    MultipleOptions = false,
    Flag = "item", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value == 'Book' or Value == 'Phone' then
            warn("Phone And Book Won't Work Without The Gamepass!")
        end
        SelectedItem = Value
    end,
})

local Button = BreakIn2Tab:CreateButton({
    Name = "Get Item",
    Callback = function()
        GiveItem(SelectedItem)
    end,
})

local Button = BreakIn2Tab:CreateButton({
    Name = "Train Strength",
    Callback = function()
        Train("Strength")
    end,
 })

local Button = BreakIn2Tab:CreateButton({
    Name = "Train Speed",
    Callback = function()
        Train("Speed")
    end,
})

local Button = BreakIn2Tab:CreateButton({
    Name = "Heal Yourself",
    Callback = function()
        for i = 1, 10 do
            HealYourself()
        end
    end,
})

local Button = BreakIn2Tab:CreateButton({
    Name = "Heal All",
    Callback = function()
        HealAllPlayers()
    end,
})

local Toggle = BreakIn2Tab:CreateToggle({
    Name = "Part-Godmode",
    CurrentValue = false,
    Flag = "godmode", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        getgenv().SemiGodmode = Value
    end,
})

local Toggle = BreakIn2Tab:CreateToggle({
    Name = "Anti-Slip",
    CurrentValue = false,
    Flag = "godmode", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        getgenv().SemiGodmode = Value
    end,
})

BreakIn2Tab:CreateButton({
    Name = "Unlock Secret Ending",
    Callback = function()
        GetSecretEnding()
    end
})
