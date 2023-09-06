local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local autokillenable = false
local antiafkenable = false

local Window = Rayfield:CreateWindow({
    Name = "Hunter Library (v1.1) - Undead Defense Tycoon",
    LoadingTitle = "Hunter Library (v1.1)",
    LoadingSubtitle = "Loading Script For Undead Defense Tycoon",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Hunter Library (RAYFIELD)", -- Create a custom folder for your hub/game
       FileName = "Undead Defense Tycoon"
    },
    Discord = {
       Enabled = true,
       Invite = "NSwbjqHRs7", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local Main = Window:CreateTab("Main", nil) -- Title, Image
local Player = Window:CreateTab("Player", nil)
local Cretab = Window:CreateTab("Credits", nil)

local Auras = Main:CreateSection("Auto Kill")

Rayfield:Notify({
  Title = "Hunter Library Loaded!",
  Content = "Loaded Script (v1.1) For undead Defense Tycoon, Took 19 ms",
  Duration = 5,
  Image = nil,
  Actions = { -- Notification Buttons
     
},
})

local zombieautokill = Main:CreateToggle({
  Name = "Zombie Kill Aura",
  CurrentValue = false,
  Flag = "autokillzombie", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
  Callback = function()
    autokillenable = true
    while wait() do
      if autokillenable == true then
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
      else
        autokillenable = false  
      end
    end
  end,
})

local antiafk = Main:CreateToggle({
  Name = "Anti-AFK",
  CurrentValue = false,
  Flag = "afk", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
  Callback = function(state)
    if state then
    loadstring(game:HttpGet(("https://pastebin.com/raw/fmPsPs8t"),true))()
    end
  end,
})

local smallestserver = Main:CreateButton({
  Name = "Join The Smallest Server",
  Callback = function()
    local amountoftimes = 0
    repeat
      getgenv().AutoTeleport = true --I didnt make this serverhop script, I just put it together in a gui credit to https://v3rmillion.net/showthread.php?tid=1107863
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
  end,
})

local AuraBuild = Main:CreateSection("Auto Build")

local Label = Main:CreateLabel("Coming Soon")

local Movement = Player:CreateSection("Movement")

local walkSlider = Player:CreateSlider({
  Name = "Walkspeed",
  Range = {16, 999},
  Increment = 1,
  Suffix = "Speed",
  CurrentValue = 16,
  Flag = "walkspeedslider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
  Callback = function(Wspeed)
    while true do
      wait (0.01)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Wspeed
  end
end
})

local flybind = Player:CreateKeybind({
  Name = "Fly",
  CurrentKeybind = "F",
  HoldToInteract = false,
  Flag = "fly", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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

local clipper = Player:CreateKeybind({
  Name = "Noclip",
  CurrentKeybind = "N",
  HoldToInteract = false,
  Flag = "noclip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
  Callback = function()
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
end,
})

local MenuGroup = Cretab:CreateSection("GUI")

local Button = Cretab:CreateButton({
  Name = "CLose GUI",
  Callback = function()
    Rayfield:Destroy()
  end,
})

local Credits = Cretab:CreateSection("Credits")

local Label = Cretab:CreateLabel("UIs - violinsutsuki and respective creators")
local label2 = Cretab:CreateLabel("Scripting - mrkillinghunter_")

Rayfield:LoadConfiguration()
