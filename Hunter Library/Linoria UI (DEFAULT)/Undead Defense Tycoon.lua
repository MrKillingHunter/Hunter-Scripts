local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local autokillenable = false
local antiafk = false

local Window = Library:CreateWindow({

  Title = 'Hunter Library (v1.1) - Undead Defence Tycoon',
  Center = true,
  AutoShow = true,
  TabPadding = 8,
  MenuFadeTime = 0.2
})

local Tabs = {
  Main = Window:AddTab('Main'),
  Player = Window:AddTab('Player'),
  ['UI Settings'] = Window:AddTab('Configs'),
}

local Auras = Tabs.Main:AddLeftGroupbox('Auto Farm')
local AuraBuild = Tabs.Main:AddRightGroupbox('Auto Build')
local Movement = Tabs.Player:AddLeftGroupbox('Movement')
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('GUI')
local Credits = Tabs['UI Settings']:AddRightGroupbox('Credits')

AuraBuild:AddLabel('Coming Soon')

Auras:AddToggle('MyToggle', {
  Text = 'Zombie Kill Aura',
  Default = false, -- Default value (true / false)
  Tooltip = 'Automatically Kills Zombies', -- Information shown when you hover over the toggle

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
      end
    end
  end
})
Auras:AddDivider()
Auras:AddToggle('MyToggle', {
  Text = 'Anti-AFK',
  Default = false, -- Default value (true / false)
  Tooltip = 'Prevents The game For kicking You Via Idle', -- Information shown when you hover over the toggle

  Callback = function()
    while wait() do
        wait(600)
        local VirtualUser=game:service'VirtualUser'
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
      end
    end
})

local MyButton = Auras:AddButton({
  Text = 'Join Smallest Server',
  Func = function()
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
  DoubleClick = false,
  Tooltip = 'Click To Join The Server w/ Least Amount Of Ppl'
})

Movement:AddSlider('MySlider', {
  Text = 'Walkspeed',
  Default = 16,
  Min = 16,
  Max = 999,
  Rounding = 1,
  Compact = false,

  Callback = function(Wspeed)
    while true do
      wait (1)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Wspeed
    end
  end
})
Movement:AddLabel('Fly'):AddKeyPicker('KeyPicker', {
  Default = 'F', -- String as the name of the keybind (MB1, MB2 for mouse buttons)
  SyncToggleState = false,

  Mode = 'Toggle',

  Text = 'Fly',
  NoUI = false,

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
  end
})
Movement:AddLabel('Noclip'):AddKeyPicker('KeyPicker', {
  Default = 'N', -- String as the name of the keybind (MB1, MB2 for mouse buttons)
  SyncToggleState = false,

  Mode = 'Toggle',

  Text = 'Noclip',
  NoUI = false,

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
  end
})

MenuGroup:AddButton('Close GUI', function() Library:Unload() end)
local MyButton = MenuGroup:AddButton({
  Text = 'Join The Discord Server',
  Func = function()
    if setclipboard then 
      setclipboard("https://discord.gg/NSwjbqHRs7")   
  end
  end,
  DoubleClick = false,
  Tooltip = 'Copy Inivte Link'
})

MenuGroup:AddLabel('UI Toggle Keybind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'UI Toggle Keybind' })

Library.ToggleKeybind = Options.MenuKeybind

Credits:AddLabel('\n\nUIs - Violin Sutsuki and\n Other Respective Creators.\n Scripting - mrkillinghunter_')
Credits:AddLabel('')
Credits:AddLabel('')

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
SaveManager:SetFolder('Hunter Library/Undead Defense Tycoon')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
