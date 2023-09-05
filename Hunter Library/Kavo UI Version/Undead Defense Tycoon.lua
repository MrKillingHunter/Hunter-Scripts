local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
  SchemeColor  = Color3.fromRGB(48, 118, 112),
  Background   = Color3.fromRGB(15, 15, 15),
  Header       = Color3.fromRGB(15, 15, 15),
  TextColor    = Color3.fromRGB(255,255,255),
  ElementColor = Color3.fromRGB(46, 85, 83)
}

local Window = Library.CreateLib("Hunter Library (v1.1) - Undead Defense Tycoon", colors)

local Main = Window:NewTab("Main")
local Player = Window:NewTab("Player (Universal)")
local CreTab = Window:NewTab("Configs")
local autokillenable = false
local antiafk = false

local Auras = Main:NewSection("AutoFarm")
local other = Main:NewSection("Others")
local Movement = Player:NewSection("Movement")
local MenuGroup = CreTab:NewSection("GUI")
local Credits = CreTab:NewSection("Credits")

Auras:NewToggle("Zombie Kill Aura", "Auto Kills Zombie", function(state)
  if state then
    autokillenable = true
    if autokillenable == true then
    while wait() do
      wait(0.01)
      local plr = game.Players.LocalPlayer
      for i,v in pairs(workspace.Zombies:GetChildren()) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head") and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health ~= 0 then
          if not plr.Character:FindFirstChildOfClass("Tool") then
            for _,gun in pairs(plr.Backpack:GetChildren()) do
              if gun:IsA("Tool") and gun:FindFirstChild("Fire") then
                gun.Parent = plr.Character
                tool = gun
              end
            end
          else
            if plr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Fire") then
              tool = plr.Character:FindFirstChildOfClass("Tool")
            end
          end
          local yes = {}
          for i = 1,10 do
            table.insert(yes,{[1] = v.Head,[2] = v.Head.Position,[3] = Vector3.new(0,0,0),[4] = 0})
          end
          tool.Fire:FireServer(plr.Character.HumanoidRootPart.Position, tool.Handle.Muzzle.WorldPosition, {[1] = Vector3.new(0, 0, 0)}, require(tool.Config).BulletData, yes)
        end
      end
    end
  else
      autokillenable = false
  end
end
end)
Auras:NewLabel("Auto Build Coming Soon")

other:NewToggle("Anti-AFK", "Prevents the Game From Kicking You For Being Idle", function(state)
  if state then
    antiafk = true
    while wait() do
      if antiafk == true then
        wait(600)
        local VirtualUser=game:service'VirtualUser'
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
      end
    end
  else
      antiafk = false
  end
end)
other:NewButton("Join The Smallest Server", "Joins The Server With The Least Amount Of People", function()
  local amountoftimes = 0
  repeat
    getgenv().AutoTeleport = true --I didnt make this serverhop script either, I just put it together in a gui credit to https://v3rmillion.net/showthread.php?tid=1107863
    getgenv().DontTeleportTheSameNumber = true
    getgenv().CopytoClipboard = true
  
    if not game:IsLoaded() then
      print("Game is loading waiting...")
      repeat
        wait()
      until game:IsLoaded()
    end
  
    local maxplayers = math.huge
    local serversmaxplayer;
    local goodserver;
    local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
  
    function serversearch()
      for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
        if type(v) == "table" and maxplayers > v.playing then
          serversmaxplayer = v.maxPlayers
          maxplayers = v.playing
          goodserver = v.id
        end
      end
      print("Currently checking the servers with max this number of players : " .. maxplayers .. "")
    end
  
    function getservers()
      serversearch()
      for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
        if i == "nextPageCursor" then
          if gamelink:find("&cursor=") then
            local a = gamelink:find("&cursor=")
            local b = gamelink:sub(a)
            gamelink = gamelink:gsub(b, "")
          end
          gamelink = gamelink .. "&cursor=" ..v
          getservers()
        end
      end
    end
  
    getservers()
  
    print("All of the servers are searched")
    print("Server : " .. goodserver .. " Players : " .. maxplayers .. "/" .. serversmaxplayer .. "")
    if CopytoClipboard then
      setclipboard(goodserver)
    end
    if AutoTeleport then
      if DontTeleportTheSameNumber then
        if #game:GetService("Players"):GetPlayers() - 1 == maxplayers then
          return warn("It has same number of players (except you)")
        elseif goodserver == game.JobId then
          return warn("Your current server is the most empty server atm")
        end
      end
      print("AutoTeleport is enabled. Teleporting to : " .. goodserver)
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
    end
    amountoftimes = amountoftimes + 1
  until amountoftimes == 10
end)

Movement:NewSlider("Walkspeed", "Your Walkspeed Changes With This", 999, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Movement:NewKeybind("Fly", "Your Character Will Fly W/ This Toggle", Enum.KeyCode.F, function()
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
end)
Movement:NewKeybind("Noclip", "Allows You to Noclip Through Walls", Enum.KeyCode.N, function()
	local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
end)

MenuGroup:NewKeybind("UI Toggle Keybind", "", Enum.KeyCode.End, function()
	Library:ToggleUI()
end)
Credits:NewLabel("UIs - violinsutsuki and respective creators")
Credits:NewLabel("Scripting - mrkillinghunter_")
