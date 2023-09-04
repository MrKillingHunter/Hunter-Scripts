local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Hunter Library (v1.1) - Snow Plow Sim",
    LoadingTitle = "Hunter Library (v1.1)",
    LoadingSubtitle = "Loading Script For Snow Plow Sim",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Hunter Library (RAYFIELD)", -- Create a custom folder for your hub/game
       FileName = "Snow Plow Simulator"
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

local MainTab = Window:CreateTab("Main", nil) -- Title, Image
local PlayerTab = Window:CreateTab("Player", nil) -- Title, Image
local UISettings = Window:CreateTab("Credits And Config", nil) -- Title, Image

local Money = MainTab:CreateSection("Adding")
local Movement = PlayerTab:CreateSection("Movement")
local MenuGroup = UISettings:CreateSection("Credits And GUI")

Rayfield:Notify({
    Title = "Hunter Library Loaded!",
    Content = "Loaded Script (v1.1) For Snow Plow Simulator, Took 32 ms",
    Duration = 5,
    Image = nil,
    Actions = { -- Notification Buttons
       
 },
})

local AddSnowToggle = MainTab:CreateToggle({
    Name = "Toggle Adding Snow",
    CurrentValue = false,
    Flag = "addsnowtoggleflag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function()
        togglemoney = true
        while togglemoney == true do
            game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-99999999999999, "1 Stick", true)
            wait(0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)
        end
    end,
})
local AddSnow = MainTab:CreateButton({
    Name = "Add Snow",
    Callback = function()
        game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-999999999999999, "1 Stick", true)
    end,
})
local AddRebirthToggle = MainTab:CreateToggle({
    Name = "Toggle Rebirthing",
    CurrentValue = false,
    Flag = "addrebirthtoggleflag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function()
        togglerebirths = true
        while togglerebirths == true do
            game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
            wait(0.001)
    end
end,
})
local AddRebirth = MainTab:CreateButton({
    Name = "Add Rebirths",
    Callback = function()
        game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
    end,
})

local Gemssection = MainTab:CreateSection("Gems And Snow")

local collectgems = MainTab:CreateToggle({
    Name = "Collect All Gems",
    CurrentValue = false,
    Flag = "gems", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function()
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
})
local plowsnow = MainTab:CreateToggle({
    Name = "Plow All Snow (LAGGY AND CANNOT BE DISABLED)",
    CurrentValue = false,
    Flag = "plowallsnow", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Snow = game:GetService("Workspace").HitParts
while task.wait() do
for _,v in pairs(Snow:GetChildren()) do
if v.Name == "Snow" then
game:GetService("ReplicatedStorage").Events.HitPart:FireServer(v)
end
end
end
    end,
})

local walkspeedslider = PlayerTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 999},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "walkspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Wspeed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Wspeed
    end,
})
local flybind = PlayerTab:CreateKeybind({
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

local creLabel = UISettings:CreateLabel("Credits")
local UILabel = UISettings :CreateLabel("UIs - violinsutsuki and other respective creators")
local scriptLabel = UISettings:CreateLabel("Scripting - mrkillinghunter_")

local closeButton = UISettings:CreateButton({
    Name = "Close GUI",
    Callback = function()
        Rayfield:Destroy()
    end,
})

Rayfield:LoadConfiguration()
