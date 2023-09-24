

function oldnormalmessage(title, text, timee)
    task.spawn(function()
        local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://"..oldcustomnotifid;notif.Volume = 1;notif:Play();notif.Stopped:Wait();notif:Destroy()
    end)
    Notification:Notify(
        {Title = title, Description = text},
        {OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "default"}
    )
    end 
    
    function oldwarnmessage(title, text, timee)
    task.spawn(function()
        local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://"..oldcustomnotifid;notif.Volume = 2;notif:Play();notif.Stopped:Wait();notif:Destroy()
    end)
    Notification:Notify(
        {Title = title, Description = text},
        {OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "image"},
        {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
    )
    end
    function randomString()local length = math.random(10,20);local array = {};for i = 1, length do array[i] = string.char(math.random(32, 126)) end;return table.concat(array);end
    
    local PathModule = {}
    local PathfindingService = game:GetService("PathfindingService")
    local VisualizerFolder = game.Workspace:FindFirstChild("PDVisualizer")
    if VisualizerFolder == nil then
    VisualizerFolder = Instance.new("Folder", workspace)
    VisualizerFolder.Name = "PDVisualizer"
    end
    VisualizerFolder:ClearAllChildren()
    
    local VisualizeColors = {
    Normal = Color3.fromRGB(255, 139, 0),
    Jump = Color3.fromRGB(255, 0, 0),
    Finish = Color3.fromRGB(0, 255, 0)
    }
    
    function PathModule.visualize(waypoints, waypointSpacing)
    for _, waypoint in ipairs(waypoints) do
        local visualWaypointClone = Instance.new("Part")
        visualWaypointClone.Size = Vector3.new(0.3, 0.3, 0.3)
        visualWaypointClone.Anchored = true
        visualWaypointClone.CanCollide = false
        visualWaypointClone.Material = Enum.Material.Neon
        visualWaypointClone.Shape = Enum.PartType.Ball
        visualWaypointClone.Position = waypoint.Position + Vector3.new(0, 3, 0)
        visualWaypointClone.Color =
            (
                waypoint == waypoints[#waypoints] and VisualizeColors.Finish
                or (waypoint == waypoints[#waypoints-1] and VisualizeColors.Finish)
                or (waypoint == waypoints[#waypoints-2] and VisualizeColors.Finish)
                or (waypoint.Action == Enum.PathWaypointAction.Jump and VisualizeColors.Jump)
                or VisualizeColors.Normal
            )
        visualWaypointClone.Parent = VisualizerFolder
    end
    end
    function PathModule.new(char, goal, agentParameters, jumpingAllowed, offset)
    if not (char and char:IsA("Model") and char.PrimaryPart) then return end
    if not PathfindingService then PathfindingService = game:GetService("PathfindingService") end 
    
    local Path = PathfindingService:CreatePath(agentParameters or {})
    local HRP = char:FindFirstChild("HumanoidRootPart")
    local Humanoid = char:FindFirstChildWhichIsA("Humanoid")
    
    if not HRP then HRP = char.PrimaryPart end
    if jumpingAllowed == nil or typeof(jumpingAllowed) ~= "boolean" then jumpingAllowed = false end
    
    local waypoints
    
    pcall(function() HRP:SetNetworkOwner(nil) end)
    
    local Success, ErrorMessage = pcall(function()
        if offset then
            Path:ComputeAsync(HRP.Position - offset, goal)
        else
            Path:ComputeAsync(HRP.Position, goal)
        end
    end)
    
    if Success and Path.Status == Enum.PathStatus.Success then 
        waypoints = Path:GetWaypoints()
        PathModule.visualize(waypoints)
    
        for i, v in pairs(waypoints) do
            if BOBHUBLOADED == false or not v then return end
    
            if char.HumanoidRootPart.Anchored == false then
                if jumpingAllowed == true then if v.Action == Enum.PathWaypointAction.Jump then Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end
                Humanoid:MoveTo(v.Position)
                Humanoid.MoveToFinished:Wait()
            end
        end
    
        VisualizerFolder:ClearAllChildren()
        return true
    else
        return false
    end
    end
    do task.spawn(function()if hookfunction then local a;a=hookfunction(game:GetService("ContentProvider").PreloadAsync,function(b,c,d)if table.find(c,game:GetService("CoreGui"))then local e=function(e,f)if e:match("^rbxasset://")or e:match("^rbxthumb://")then return d(e,f)end end;warn("Anticheat Check Detected")return a(b,c,e)end;return a(b,c,d)end)end end)end
    
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
    local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
    local Players = game:GetService("Players")
    local inRooms = false
    local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120","JeffTheKiller","Eyes"}
    
    local entityinfo = nil
    task.spawn(function()
        if game.ReplicatedStorage:FindFirstChild("EntityInfo") then 
            entityinfo = game.ReplicatedStorage:FindFirstChild("EntityInfo") 
        else
            entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")
        end	
    end)
    
    local avoidingYvalue = 23
    local flags = {
        -- general
        light = false,
        fullbright = false,
        instapp = false,
        noseek = false,
        nogates = false,
        nopuzzle = false,
        noa90 = false,
        noskeledoors = false,
        noscreech = false,
        notimothy = false,
        getcode = false,
        roomsnolock = false,
        heartbeatwin = false,
        noseekarmsfire = false,
        avoidrushambush = false,
        autoplayagain = false,
        anticheatbypass = false,
        noclip = false,
        camfov = 70,
        speed = 0,
        walkspeedtoggle = false,
        camfovtoggle = true,
        customnotifid = "10469938989",
        oldcustomnotifid = "4590657391",
        noeyesdamage = false,
    
        -- esp
        espdoors = false,
        espkeys = false,
        espitems = false,
        espbooks = false,
        esprush = false,
        espchest = false,
        esplocker = false,
        esphumans = false,
        espgold = false,
        goldespvalue = 0,
        fakeespdoors = false,
        tracers = false,
    
        -- notifiers
        hintrush = false,
        predictentities = false,
    
        -- auras
        draweraura = false,
        itemsaura = false,
        keyaura = false,
        breakercollecter = false,
        bookcollecter = false,
        autopulllever = false,
    
        -- auto a-1000
        autorooms = false,
        autorooms_debug = false,
        autorooms_blockcontrols = false,
    }
    customnotifid = flags.customnotifid
    
    local DELFLAGS = {table.unpack(flags)}
    local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={},fakedoors={}}
    local function changeBrightness(color)
        local h, s, v = color:ToHSV()
        return Color3.fromHSV(h, s, v/2)
    end
    
    local GlobalESPFolder = game.CoreGui:FindFirstChild("ESPFolder")
    if GlobalESPFolder == nil then
        GlobalESPFolder = Instance.new("Folder", game.CoreGui)
        GlobalESPFolder.Name = "ESPFolder"
    end
    local esptableinstances = {}
    local Camera = workspace.CurrentCamera
    local WorldToViewportPoint = Camera.WorldToViewportPoint
    local WorldToViewport = function(...) return WorldToViewportPoint(Camera, ...) end
    function TracerESP(Color, instance)
        if Drawing then
            local Tracer = Instance.new("Line")
            Tracer.Visible = false
            Tracer.Color = Color
            Tracer.Thickness = 1
            Tracer.Transparency = 0.8
    
            local con = game:GetService("RunService").RenderStepped:Connect(function()
                if instance ~= nil and flags.tracers == true then		
                    local ScreenPosition, Vis = WorldToViewport(instance.Position);
                    local OPos = Camera.CFrame:pointToObjectSpace(instance.Position);
                    if ScreenPosition.Z < 0 then
                        local AT = math.atan2(OPos.Y, OPos.X) + math.pi;
                        OPos = CFrame.Angles(0, 0, AT):vectorToWorldSpace((CFrame.Angles(0, math.rad(90), 0):vectorToWorldSpace(Vector3.new(0, 0, -1))));
                    end
                    local Position = WorldToViewport(Camera.CFrame:pointToWorldSpace(OPos));
                    if Vis then
                        local TracerPosition = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                        Tracer.Visible = true
                        Tracer.From = TracerPosition
                        Tracer.To = Vector2.new(Position.X, Position.Y)
                    else
                        Tracer.Visible = false
                    end
                else
                    Tracer.Visible = false
                end
            end)
    
            local ret = {}
            ret.delete = function()
                task.spawn(function()
                    if con then con:Disconnect() end
                    Tracer:Remove()
                end)
            end
    
            instance.Destroying:Connect(function() ret.delete() end)
            return ret
        else
            local ret = {}
            ret.delete = function() end
            return ret
        end
    end
    
    function esp(what,color,core,name)
        local parts
    
        local esp_folder = GlobalESPFolder:FindFirstChild(name)
        if game.Players:FindFirstChild(name) then
            esp_folder = GlobalESPFolder:FindFirstChild("PlayerESP")
            if not esp_folder then
                esp_folder = Instance.new("Folder")
                esp_folder.Parent = GlobalESPFolder
                esp_folder.Name = "PlayerESP"
            end
        end
        if not esp_folder then
            esp_folder = Instance.new("Folder")
            esp_folder.Parent = GlobalESPFolder
            esp_folder.Name = name
        end
    
        if typeof(what) == "Instance" then
            if what:IsA("Model") then
                parts = what:GetChildren()
            elseif what:IsA("BasePart") then
                parts = {what,table.unpack(what:GetChildren())}
            end
        elseif typeof(what) == "table" then
            parts = what
        end
    
        local bill
        local boxes = {}
    
        local s,e = pcall(function()
            if typeof(parts) ~= "table" then parts = {parts} end
    
            for i,v in pairs(parts) do
                if typeof(v) == "table" then
                    for ii,vv in pairs(v) do
                        if vv:IsA("BasePart") then
                            local box = Instance.new("BoxHandleAdornment")
                            box.Size = v.Size
                            box.AlwaysOnTop = true
                            box.ZIndex = 1
                            box.AdornCullingMode = Enum.AdornCullingMode.Never
                            box.Color3 = color
                            box.Transparency = 0.7
                            box.Adornee = v
                            box.Parent = esp_folder
    
                            table.insert(boxes, box)
    
                            task.spawn(function()
                                box.Adornee.Destroying:Connect(function()
                                    box.Adornee = nil
                                    box.Visible = false
                                    box:Destroy()
                                end)
                                --while box do
                                --	if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
                                --		box.Adornee = nil
                                --		box.Visible = false
                                --		box:Destroy()
                                --	end  
                                --	task.wait()
                                --end
                            end)
                        end
                    end
                else
                    if v:IsA("BasePart") then
                        local box = Instance.new("Highlight")
                        Highlight.FillColor = Color
                         Highlight.OutlineColor = Color
                        box.Parent = esp_folder
    
                        table.insert(boxes, box)
    
                        task.spawn(function()
                            box.Destroying:Connect(function()
                                box.Visible = false
                                box:Destroy()
                            end)
                            --while box do
                            --	if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
                            ----		box.Adornee = nil
                            --		box.Visible = false
                            --		box:Destroy()
                            --	end  
                            --	task.wait()
                            --end
                        end)
                    end
                end
            end
        end)
    
        if e then
            warn(e)
            print("box esp failed")
        end
    
        if core and name then
            bill = Instance.new("BillboardGui", esp_folder)
          bill.AlwaysOnTop = true
          bill.Size = UDim2.new(0,400,0,100)
          bill.Adornee = core
          bill.MaxDistance = 2000
          --[[
          local mid = Instance.new("Frame",bill)
          mid.AnchorPoint = Vector2.new(0.5,0.5)
          mid.BackgroundColor3 = color
          mid.Size = UDim2.new(0,6,0,6)
          mid.Position = UDim2.new(0.5,0,0.5,0)
          Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)
          Instance.new("UIStroke",mid)
          ]]
    local txt = Instance.new("TextLabel",bill)
          txt.AnchorPoint = Vector2.new(0.5,0.5)
          txt.BackgroundTransparency = 1
          txt.BackgroundColor3 = color
          txt.TextColor3 = color
          txt.Size = UDim2.new(1,0,0,50)
          txt.Position = UDim2.new(0.5,0,0.5,0)
          txt.Text = name
          Instance.new("UIStroke",txt)
                            
            task.spawn(function()
                bill.Adornee.Destroying:Connect(function()
                    bill.Enabled = false
                    bill.Adornee = nil
                    --pcall(function() table.remove(boxes, table.find(boxes, bill)) end)
                    bill:Destroy() 
                end)
                --while bill do
                --	if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                --		bill.Enabled = false
                --		bill.Adornee = nil
                --		--pcall(function() table.remove(boxes, table.find(boxes, bill)) end)
                --		bill:Destroy() 
                --	end  
                --	task.wait()
                --end
            end)
        end
    
        local Tracer = nil
        if flags.tracers == true then Tracer = TracerESP(color, core) end
    
        local ret = {}
        ret.delete = function()
            task.spawn(function()
                for i,v in pairs(boxes) do
                    pcall(function()
                        table.remove(esptableinstances, table.find(esptableinstances, v.Adornee))
                    end)
                    pcall(function()
                        table.remove(esptableinstances, table.find(esptableinstances, v.Parent))
                    end)
                    v.Adornee = nil
                    v.Visible = false
                    v:Destroy()
                    task.wait()
                end
            end)
    
            if bill then
                pcall(function()
                    table.remove(esptableinstances, table.find(esptableinstances, bill.Adornee))
                end)
                pcall(function()
                    table.remove(esptableinstances, table.find(esptableinstances, bill.Parent))
                end)
                bill.Adornee = nil
                bill.Enabled = false
                bill:Destroy() 
            end
    
            if Tracer then Tracer.delete() end
        end
    
        return ret 
    end
    
local Library = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
local Window = Library:CreateWindow({
    Name = " Welcome To Hunter Library v3 -  Doors",
    LoadingTitle = "Welcome To Hunter Library v3 - Scripthub",
    LoadingSubtitle = "Loading Scripthub For DOORS",
    ConfigurationSaving = {
    Enabled = true,
    FolderName = "Hunter Library", 
    FileName = "HunterLibDoorsConfig"
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
    Title = "Loaded Script",
    Content = " Loaded Script For DOORS. Took 32ms.",
    Duration = 5,
    Image = nil,
    }
)
    
local UniversalTab = Window:CreateTab("🌐 Universal Features", nil)
local DoorsTab = Window:CreateTab("🚪 DOORS")
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
    Flag = "walkspeed",
    Callback = function(Value)
    while true do
    wait (0.5)
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
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

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
    
    
local MAINDOORS = DoorsTab:CreateSection("Main")
    
local AutoToggle1 = DoorsTab:CreateToggle({
        Name = "Auto Library Code",
        CurrentValue = false,
        Flag = "autolibcode", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(val)
            flags.getcode = val
    
            if val then
                local function deciphercode()
                    local paper = char:FindFirstChild("LibraryHintPaper")
                    local hints = plr.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")
    
                    local code = {[1]="_",[2]="_",[3]="_",[4]="_",[5]="_"}
    
                    if paper then
                        for i,v in pairs(paper:WaitForChild("UI"):GetChildren()) do
                            if v:IsA("ImageLabel") and v.Name ~= "Image" then
                                for i,img in pairs(hints:GetChildren()) do
                                    if img:IsA("ImageLabel") and img.Visible and v.ImageRectOffset == img.ImageRectOffset then
                                        local num = img:FindFirstChild("TextLabel").Text
    
                                        code[tonumber(v.Name)] = num 
                                    end
                                end
                            end
                        end 
                    end
    
                    return code
                end
    
                local apart
                local addconnect
                addconnect = char.ChildAdded:Connect(function(v)
                    if v:IsA("Tool") and v.Name == "LibraryHintPaper" then
                        task.wait()
                        local code = table.concat(deciphercode())
    
                        if code:find("_") then
                            warnmessage("ROOM 50", "You are still missing some books!", "The current code is: '".. code.."'", 7)
                        else
                            if apart == nil then
                                apart = Instance.new("Part", game.ReplicatedStorage)
                                apart.CanCollide = false
                                apart.Anchored = true
                                apart.Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
                                apart.Transparency = 1
                                normalmessage("ROOM 50", "The code is '".. code.."'.", "", 5, nil, nil, apart)
                                repeat task.wait(.1) until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value ~= 50
                                apart:Destroy()
                                apart = nil
                            end
                        end
                    end
                end)
                repeat task.wait() until not flags.getcode
                addconnect:Disconnect()
            end
        end,
})

local elevatorbreakerbox = false
local AutoToggle2 = DoorsTab:CreateToggle({
    Name = "Auto Complete Breakerbox",
    CurrentValue = false,
    Flag = "breakerboxauto", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        warnmessage("ROOM 100", "Trying to comeplete breaker box...", "Then go elevator now...", 5)
        NoBreaker = val
        while task.wait(1) do
            if not NoBreaker then
                break
            end
            EntityInfo.EBF:FireServer()
        end
    end,
})    

local NotifyChatInput = DoorsTab:CreateInput({
    Name = "Chat notification",
    PlaceholderText = "Chat Notify text",
    RemoveTextAfterFocusLost = false,
    Callback = function(caht)
        casjfg = caht
    end,
})

local NotifyToggle = DoorsTab:CreateToggle({
    Name = "Notify Entities",
    CurrentValue = false,
    Flag = "entitynotifiy", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        flags.hintrush = Value
    end,
})

local eyesspawned = false
workspace.ChildAdded:Connect(function(inst)
	task.spawn(function()
		if table.find(entitynames, inst.Name) and flags.hintrush == true then
			if inRooms == true then
				if inst.Name:gsub("Moving","") == "A60" then
					warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "12350986086", inst)
				elseif inst.Name:gsub("Moving","") == "A120" then
					warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "12351008553", inst)
				else
					task.wait(.1)
					if plr:DistanceFromCharacter(inst:GetPivot().Position) < 400 and inst:IsDescendantOf(workspace) then
						--warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "0", inst)
					end
				end
			else
                if flags.avoidrushambush == false then
                    repeat task.wait() until plr:DistanceFromCharacter(inst:GetPivot().Position) < 1000 or not inst:IsDescendantOf(workspace)
    
                    if inst:IsDescendantOf(workspace) then
                        if inst.Name:gsub("Moving","") == "Rush" then
                            warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "11102256553", inst)
                        elseif inst.Name:gsub("Moving","") == "Ambush" then
                            warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "10938726652", inst)
                        elseif inst.Name:gsub("Moving","") == "Eyes" then
                            task.spawn(function()
                                if flags.noeyesdamage == true then
                                    eyesspawned = true
                                    local con = game:GetService("RunService").RenderStepped:Connect(function()
                                        eyesspawned = true
                                        local legrot = 0
                                        local bodypitch = -75 -- legit -65
                                        local bodyrot = 0
                                        game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(legrot, bodypitch, bodyrot, false)
                                    end)
                                    inst.Destroying:Wait()
                                    con:Disconnect()
                                    eyesspawned = false
                                end
                            end)
                            warnmessage("ENTITIES", inst.Name:gsub("Moving","").." spawned.", "Don't look at it!", 10, "10865377903")
                        else
                            warnmessage("ENTITIES", inst.Name:gsub("Moving","").." is coming.", "Hide!", 0, "0", inst)
                        end
                        inst.Destroying:Wait()
                        --warnmessage("ENTITIES", "It's now completely safe to leave the hiding spot.", 7)
                            end
                    end
                end
            end
        end)

        if flags.avoidrushambush == true then
            if inst.Name == "RushMoving" or inst.Name == "AmbushMoving" then
                repeat task.wait() until plr:DistanceFromCharacter(inst:GetPivot().Position) < 400 or not inst:IsDescendantOf(workspace)
    
                if inst:IsDescendantOf(workspace) then
                    if inst.Name:gsub("Moving","") == "Rush" then
                        warnmessage("ENTITIES", "Rush Is Coming! ", "Don't Worry! You Have Godmode Enabled!", 0, "11102256553", inst)
                    elseif inst.Name:gsub("Moving","") == "Ambush" then
                        warnmessage("ENTITIES", "Ambush Is Coming! ", "Don't Worry! You Have Godmode Enabled!", 0, "10938726652", inst)
                    end
    
                    local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local oldwalkspeed = hum.WalkSpeed
                    
                    local pos = CFrame.new(
                        OldPos + Vector3.new(
                            0,
                            avoidingYvalue,
                            0
                        ) 
                    )
                    
                    local function getrecentroom(index)
                        local rooms = workspace.CurrentRooms:GetChildren() 
                        table.sort(rooms,function(a,b)
                            return tonumber(a.Name) > tonumber(b.Name) 
                        end)
    
                        return rooms[index]
                    end
                    local room = getrecentroom(2)
                    local door = room:WaitForChild("Door")
    
                    local CFrameValue = Instance.new("CFrameValue")
                    CFrameValue.Value = game.Players.LocalPlayer.Character:GetPivot()
                    CFrameValue:GetPropertyChangedSignal("Value"):connect(function()
                        --game.Players.LocalPlayer.Character:PivotTo(CFrameValue.Value)
                        game.Players.LocalPlayer.Character.Collision.CFrame = CFrameValue.Value
                    end)
                    local tween = game:GetService("TweenService"):Create(CFrameValue, TweenInfo.new(1.5), {
                        Value = pos
                    })
                    tween:Play()
    
                    local con
                    tween.Completed:connect(function()
                        CFrameValue:Destroy() 
                        con = game:GetService("RunService").RenderStepped:Connect(function()
                            --game.Players.LocalPlayer.Character:PivotTo(pos)
                            game.Players.LocalPlayer.Character.Collision.CFrame = pos
                        end)
                    end)
    
                    inst.Destroying:Wait()
                    con:Disconnect()
    
                    local CFrameValue = Instance.new("CFrameValue")
                    CFrameValue.Value = game.Players.LocalPlayer.Character:GetPivot()
                    CFrameValue:GetPropertyChangedSignal("Value"):connect(function()
                        game.Players.LocalPlayer.Character:PivotTo(CFrameValue.Value)
                    end)
                    local tween = game:GetService("TweenService"):Create(CFrameValue, TweenInfo.new(1.5), {Value = CFrame.new(OldPos)})
                    tween:Play()
                    tween.Completed:connect(function()
                        CFrameValue:Destroy() 
                        --game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    end)
                end
            end
        end
end)
    
local casjfg = ""

local ChatNotifyToggle = DoorsTab:CreateToggle({
    Name = "Notify Entities In Chat",
    CurrentValue = false,
    Flag = "chatnotifytoggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Chats)
    	
	    if flags.avoidrushambush == true then
            if inst.Name == "RushMoving" or inst.Name == "AmbushMoving" then
                repeat task.wait() until plr:DistanceFromCharacter(inst:GetPivot().Position) < 400 or not inst:IsDescendantOf(workspace)
    
                if inst:IsDescendantOf(workspace) then
                    if inst.Name:gsub("Moving","") == "Rush" then
                        warnmessage("ENTITIES", "Rush Is Coming! ", "Don't Worry! You Have Godmode Enabled!", 0, "11102256553", inst)
                    elseif inst.Name:gsub("Moving","") == "Ambush" then
                        warnmessage("ENTITIES", "Ambush Is Coming! ", "Don't Worry! You Have Godmode Enabled!", 0, "10938726652", inst)
                    end
    
                    local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local oldwalkspeed = hum.WalkSpeed
                    
                    local pos = CFrame.new(
                        OldPos + Vector3.new(
                            0,
                            avoidingYvalue,
                            0
                        ) 
                    )
                    
                    local function getrecentroom(index)
                        local rooms = workspace.CurrentRooms:GetChildren() 
                        table.sort(rooms,function(a,b)
                            return tonumber(a.Name) > tonumber(b.Name) 
                        end)
    
                        return rooms[index]
                    end
                    local room = getrecentroom(2)
                    local door = room:WaitForChild("Door")
    
                    local CFrameValue = Instance.new("CFrameValue")
                    CFrameValue.Value = game.Players.LocalPlayer.Character:GetPivot()
                    CFrameValue:GetPropertyChangedSignal("Value"):connect(function()
                        --game.Players.LocalPlayer.Character:PivotTo(CFrameValue.Value)
                        game.Players.LocalPlayer.Character.Collision.CFrame = CFrameValue.Value
                    end)
                    local tween = game:GetService("TweenService"):Create(CFrameValue, TweenInfo.new(1.5), {
                        Value = pos
                    })
                    tween:Play()
    
                    local con
                    tween.Completed:connect(function()
                        CFrameValue:Destroy() 
                        con = game:GetService("RunService").RenderStepped:Connect(function()
                            --game.Players.LocalPlayer.Character:PivotTo(pos)
                            game.Players.LocalPlayer.Character.Collision.CFrame = pos
                        end)
                    end)
    
                    inst.Destroying:Wait()
                    con:Disconnect()
    
                    local CFrameValue = Instance.new("CFrameValue")
                    CFrameValue.Value = game.Players.LocalPlayer.Character:GetPivot()
                    CFrameValue:GetPropertyChangedSignal("Value"):connect(function()
                        game.Players.LocalPlayer.Character:PivotTo(CFrameValue.Value)
                    end)
                    local tween = game:GetService("TweenService"):Create(CFrameValue, TweenInfo.new(1.5), {Value = CFrame.new(OldPos)})
                    tween:Play()
                    tween.Completed:connect(function()
                        CFrameValue:Destroy() 
                        --game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    end)
                end
            end
        end
end})
    
local casjfg = ""
    
local chatToggle = DoorsTab:CreateToggle({
    Name = "Notify Entities In Chat",
    CurrentValue = false,
    Flag = "chatnotidy", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Chats)
        _G.Chat = Chats

    if _G.Chat then
        local addconnect
        addconnect = workspace.ChildAdded:Connect(function(v)
            if table.find(entitynames,v.Name) then
                repeat task.wait() until plr:DistanceFromCharacter(v:GetPivot().Position) < 1000 or not v:IsDescendantOf(workspace)
                
                if v:IsDescendantOf(workspace) then

if v.Name == "RushMoving" then

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Rush!" .. casjfg)

elseif v.Name == "AmbushMoving" then

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Ambush!" .. casjfg)

elseif v.Name == "A60" then

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("A60!" .. casjfg)

elseif v.Name == "A120" then

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("A120!" .. casjfg)

elseif v.Name == "JeffTheKiller" then

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("JTK")

elseif v.Name == "Eyes" then

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Eyes!")

end

                end
            end
        end) 
        
        repeat task.wait() until not _G.Chat
        addconnect:Disconnect()
    end
    end,
 })

local AuraSection = DoorsTab:CreateSection("Auras")

local LootToggle = DoorsTab:CreateToggle({
    Name = "Loot Aura",
    CurrentValue = false,
    Flag = "lootaura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.draweraura = val

			if val then
				local function setup(room)
					local function check(v)
						task.wait()
						if v:IsA("Model") then
							--	if v.PrimaryPart then
							task.wait()
							if v.Name == "DrawerContainer" or v.Name == "RolltopContainer" then
								if v.Name == "RolltopContainer" then
									local prompt = v:WaitForChild("ActivateEventPrompt")
									local interactions = prompt:GetAttribute("Interactions")

									if not interactions then
										task.spawn(function()
											repeat task.wait(0.1)
												--pcall(function()
												local posok = false
												pcall(function()
													local posoks, posoke = pcall(function()
														posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
													end)
													if posoke then
														local part
														for _,v in pairs(v:GetChildren()) do
															local hasProperty = pcall(function() local t = v["Position"] end)
															if hasProperty then
																part = v
																break
															end
														end
														posok = (plr:DistanceFromCharacter(part.Position) <= 12)
													end
												end)
												if posok then
													fireproximityprompt(prompt)
												end
												--end)
											until prompt:GetAttribute("Interactions") or not flags.draweraura
										end)
									end
								else
                                    local knob = v:WaitForChild("Knobs")

									if knob then
										local prompt = knob:WaitForChild("ActivateEventPrompt")
										local interactions = prompt:GetAttribute("Interactions")

										if not interactions then
											task.spawn(function()
												repeat task.wait(0.1)
													--pcall(function()
													local posok = false
													pcall(function()
														local posoks, posoke = pcall(function()
															posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
														end)
														if posoke then
															local part
															for _,v in pairs(v:GetChildren()) do
																local hasProperty = pcall(function() local t = v["Position"] end)
																if hasProperty then
																	part = v
																	break
																end
															end
															posok = (plr:DistanceFromCharacter(part.Position) <= 12)
														end
													end)
													if posok then
														fireproximityprompt(prompt)
													end
													--end)
												until prompt:GetAttribute("Interactions") or not flags.draweraura
											end)
										end
									end
								end
                            elseif v.Name == "GoldPile" then
								local prompt = v:WaitForChild("LootPrompt")
								local interactions = prompt:GetAttribute("Interactions")

								if not interactions then
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt) 
											end 
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura
									end)
								end
							elseif v.Name:sub(1,8) == "ChestBox" then
								local prompt = v:WaitForChild("ActivateEventPrompt")
								local interactions = prompt:GetAttribute("Interactions")

								if not interactions then
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt)
											end
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura
									end)
								end
							elseif v.Name == "RolltopContainer" then
								local prompt = v:WaitForChild("ActivateEventPrompt")
								local interactions = prompt:GetAttribute("Interactions")

                                if not interactions then
									task.spawn(function()
										repeat task.wait(0.1)
											--pcall(function()
											local posok = false
											pcall(function()
												local posoks, posoke = pcall(function()
													posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
												end)
												if posoke then
													local part
													for _,v in pairs(v:GetChildren()) do
														local hasProperty = pcall(function() local t = v["Position"] end)
														if hasProperty then
															part = v
															break
														end
													end
													posok = (plr:DistanceFromCharacter(part.Position) <= 12)
												end
											end)
											if posok then
												fireproximityprompt(prompt)
											end
											--end)
										until prompt:GetAttribute("Interactions") or not flags.draweraura
									end)
								end
							end 
							--end
						end
					end

					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(ve)
						check(ve) 
					end)

					for _,v in pairs(room:GetDescendants()) do
						task.spawn(function()
							check(v)
						end)
					end

					task.spawn(function()
						repeat task.wait() until not flags.draweraura
						subaddcon:Disconnect() 
					end)
				end

				local addconnect
				addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
					setup(room)
				end)

				for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
					if room:FindFirstChild("Assets") then
						setup(room) 
					end
				end
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

				repeat task.wait() until not flags.draweraura
				addconnect:Disconnect()
			end
		end
    
})

local ItemAuraToggle = DoorsTab:CreateToggle({
    Name = "Item Aura",
    CurrentValue = false,
    Flag = "itemaura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.itemsaura = val

        if val then
            local function setup(room)
                local function check(v)
                    task.wait()
                    if v:IsA("Model") then
                        --	if v.PrimaryPart then
                        task.wait()
                        if v.Name == "PickupItem" then
                            if game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 51 or game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 52 then
                                return
                            end

                            local prompt = v:WaitForChild("ModulePrompt")
                            local okcanckl = 0
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    --pcall(function()
                                    local posok = false
                                    pcall(function()
                                        local posoks, posoke = pcall(function()
                                            posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
                                        end)
                                        if posoke then
                                            local part
                                            for _,v in pairs(v:GetChildren()) do
                                                local hasProperty = pcall(function() local t = v["Position"] end)
                                                if hasProperty then
                                                    part = v
                                                    break
                                                end
                                            end
                                            posok = (plr:DistanceFromCharacter(part.Position) <= 12)
                                        end
                                    end)
                                    if posok then
                                        fireproximityprompt(prompt) 
                                        okcanckl += 1
                                    end
                                    --end)
                                until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.itemsaura or okcanckl > 20
                            end)
                        elseif v:GetAttribute("Pickup") or v:GetAttribute("PropType") then
                            if game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 51 or game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 52 then
                                return
                            end

                            local prompt = v:WaitForChild("ModulePrompt", 2)
                            if prompt == nil then
                                prompt = v:FindFirstChildWhichIsA("ProximityPrompt")
                                if prompt == nil then
                                    for _,vvvvv in pairs(v:GetDescendants()) do
                                        if vvvvv:IsA("ProximityPrompt") then
                                            prompt = vvvvv
                                            break
                                        end
                                    end
                                end
                            end

                            task.spawn(function()
                                repeat task.wait(0.1)
                                    --pcall(function()
                                    local posok = false
                                    pcall(function()
                                        local posoks, posoke = pcall(function()
                                            posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
                                        end)
                                        if posoke then
                                            local part
                                            for _,v in pairs(v:GetChildren()) do
                                                local hasProperty = pcall(function() local t = v["Position"] end)
                                                if hasProperty then
                                                    part = v
                                                    break
                                                end
                                            end
                                            posok = (plr:DistanceFromCharacter(part.Position) <= 12)
                                        end
                                    end)
                                    if posok then
                                        fireproximityprompt(prompt) 
                                    end
                                    --end)
                                until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.itemsaura
                            end)
                            elseif v.Name == "Green_Herb" then
                            local plant = v:WaitForChild("Plant")

                            if plant then
                                local prompt = plant:WaitForChild("HerbPrompt")
                                local okcanckl = 0
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        --pcall(function()
                                        local posok = false
                                        pcall(function()
                                            local posoks, posoke = pcall(function()
                                                posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
                                            end)
                                            if posoke then
                                                local part
                                                for _,v in pairs(v:GetChildren()) do
                                                    local hasProperty = pcall(function() local t = v["Position"] end)
                                                    if hasProperty then
                                                        part = v
                                                        break
                                                    end
                                                end
                                                posok = (plr:DistanceFromCharacter(part.Position) <= 12)
                                            end
                                        end)
                                        if posok then
                                            fireproximityprompt(prompt) 
                                            okcanckl += 1
                                        end 
                                        --end)
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura or okcanckl > 35
                                end)
                            end
                        elseif v.Name == "KeyObtain" or v.Name == "ElectricalKeyObtain" then
                            local prompt = v:WaitForChild("ModulePrompt")
                            local interactions = prompt:GetAttribute("Interactions")

                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        --pcall(function()
                                        local posok = false
                                        pcall(function()
                                            local posoks, posoke = pcall(function()
                                                posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
                                            end)
                                            if posoke then
                                                local part
                                                for _,v in pairs(v:GetChildren()) do
                                                    local hasProperty = pcall(function() local t = v["Position"] end)
                                                    if hasProperty then
                                                        part = v
                                                        break
                                                    end
                                                end
                                                posok = (plr:DistanceFromCharacter(part.Position) <= 12)
                                            end
                                        end)
                                        if posok then
                                            fireproximityprompt(prompt) 
                                        end
                                        --end)
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura
                                end)
                            end
                        elseif v.Name == "RolltopContainer" then
                            local prompt = v:WaitForChild("ActivateEventPrompt")
                            local interactions = prompt:GetAttribute("Interactions")

                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        --pcall(function()
                                        local posok = false
                                        pcall(function()
                                            local posoks, posoke = pcall(function()
                                                posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
                                            end)
                                            if posoke then
                                                local part
                                                for _,v in pairs(v:GetChildren()) do
                                                    local hasProperty = pcall(function() local t = v["Position"] end)
                                                    if hasProperty then
                                                        part = v
                                                        break
                                                    end
                                                end
                                                posok = (plr:DistanceFromCharacter(part.Position) <= 12)
                                            end
                                        end)
                                        if posok then
                                            fireproximityprompt(prompt)
                                        end
                                        --end)
                                    until prompt:GetAttribute("Interactions") or not flags.itemsaura
                                end)
                            end
                        end 
                        --end
                    end
                end

                local subaddcon
                subaddcon = room.DescendantAdded:Connect(function(ve)
                    check(ve) 
                end)

                for _,v in pairs(room:GetDescendants()) do
                    task.spawn(function()
                        check(v)
                    end)
                end

                task.spawn(function()
                    repeat task.wait() until BOBHUBLOADED == false or not flags.itemsaura
                    subaddcon:Disconnect() 
                end)
            end

            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)

            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end
            setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

            repeat task.wait() until BOBHUBLOADED == false or not flags.itemsaura
            addconnect:Disconnect()
        end

    end,
})

local LeverAuraToggle = DoorsTab:CreateToggle({
    Name = "Lever Aura",
    CurrentValue = false,
    Flag = "leveraura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.autopulllever = val

        if val then
            local function setup(room)
                local function check(v)
                    --if v:IsA("Model") then
                    --	if v.PrimaryPart then
                    if v.Name == "LeverForGate" then
                        local prompt = v:WaitForChild("ActivateEventPrompt")

                        local okcanckl = 0
                        pcall(function() v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function() okcanckl = 100 end) end)
                        task.spawn(function()
                            repeat task.wait(0.1)
                                local posok = false
                                pcall(function()
                                    local posoks, posoke = pcall(function()
                                        posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
                                    end)
                                    if posoke then
                                        local part
                                        for _,v in pairs(v:GetChildren()) do
                                            local hasProperty = pcall(function() local t = v["Position"] end)
                                            if hasProperty then
                                                part = v
                                                break
                                            end
                                        end
                                        posok = (plr:DistanceFromCharacter(part.Position) <= 12)
                                    end
                                end)
                                if posok then
                                    fireproximityprompt(prompt) 
                                    okcanckl += 1
                                end
                            until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.autopulllever or okcanckl > 50
                        end)
                    end
                    --	end
                    --endd

                end

                local subaddcon
                subaddcon = room.DescendantAdded:Connect(function(v)
                    check(v) 
                end)

                for i,v in pairs(room:GetDescendants()) do
                    check(v)
                end

                task.spawn(function()
                    repeat task.wait() until not flags.autopulllever
                    subaddcon:Disconnect() 
                end)
            end

            if flags.autopulllever == true then
                local addconnect
                addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                    setup(room)
                end)

                for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                    if room:FindFirstChild("Assets") then
                        setup(room) 
                    end
                end
                --	if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
                setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
                --	end

                repeat task.wait() until not flags.autopulllever
                addconnect:Disconnect()
            end
        end

    end,
})

local BookAuraToggle = DoorsTab:CreateToggle({
    Name = "Book Aura",
    CurrentValue = false,
    Flag = "bookaura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.bookcollecter = val

        if val then
            local function setup(room)
                local function check(v)
                    if v:IsA("Model") then
                        --if v.PrimaryPart then
                        if v.Name == "LiveHintBook" then
                            local prompt = v:WaitForChild("ActivateEventPrompt")

                            local okcanckl = 0
								task.spawn(function()
									repeat task.wait(0.1)
										local posok = false
										pcall(function()
											local posoks, posoke = pcall(function()
												posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
											end)
											if posoke then
												local part
												for _,v in pairs(v:GetChildren()) do
													local hasProperty = pcall(function() local t = v["Position"] end)
													if hasProperty then
														part = v
														break
													end
												end
												posok = (plr:DistanceFromCharacter(part.Position) <= 12)
											end
										end)
                                        if posok then
											fireproximityprompt(prompt) 
											okcanckl += 1
										end
									until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.bookcollecter or okcanckl > 50
								end)
                            end
							--end
						end

					end

					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(v)
						check(v) 
					end)
                    for i,v in pairs(room:GetDescendants()) do
						check(v)
					end

					task.spawn(function()
						repeat task.wait() until BOBHUBLOADED == false or not flags.bookcollecter
						subaddcon:Disconnect() 
					end)
				end

				repeat task.wait()if flags.bookcollecter == false then break end until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50

				if flags.bookcollecter == true then
					local addconnect
					addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
						setup(room)
					end)
                    for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
						if room:FindFirstChild("Assets") then
							setup(room) 
						end
					end
					--	if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
					setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
					--	end

					repeat task.wait() until not flags.bookcollecter
					addconnect:Disconnect()
				end
			end
    end,
})

local BreakerAuraToggle = DoorsTab:CreateToggle({
    Name = "Breaker Aura",
    CurrentValue = false,
    Flag = "breakeraura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.breakercollecter = val

        if val then
            local function setup(room)
                local function check(v)
                    if v:IsA("Model") then
                        --if v.PrimaryPart then
                        if v.Name == "LiveBreakerPolePickup" then
                            local prompt = v:WaitForChild("ActivateEventPrompt")

                            local okcanckl = 0
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    local posok = false
                                    pcall(function()
                                        local posoks, posoke = pcall(function()
                                            posok = (plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12)
                                        end)
                                        if posoke then
                                            local part
                                            for _,v in pairs(v:GetChildren()) do
                                                local hasProperty = pcall(function() local t = v["Position"] end)
                                                if hasProperty then
                                                    part = v
                                                    break
                                                end
                                            end
                                            posok = (plr:DistanceFromCharacter(part.Position) <= 12)
                                        end
                                    end)

                                    if posok then
                                        fireproximityprompt(prompt) 
                                        okcanckl += 1
                                    end
                                until not v:IsDescendantOf(workspace) or not prompt:IsDescendantOf(workspace) or not flags.breakercollecter or okcanckl > 50
                            end)
                            
                        end
                        --end
                    end

                end

                local subaddcon
                subaddcon = room.DescendantAdded:Connect(function(v)
                    check(v) 
                end)

                for i,v in pairs(room:GetDescendants()) do
                    check(v)
                end

                task.spawn(function()
                    repeat task.wait() until not flags.breakercollecter
                    subaddcon:Disconnect() 
                end)
            end

            repeat task.wait()if flags.breakercollecter == false then break end until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 100

            if flags.breakercollecter == true then
                local addconnect
                addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                    setup(room)
                end)

                for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                    if room:FindFirstChild("Assets") then
                        setup(room) 
                    end
                end
                --	if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
                setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
                --	end

                repeat task.wait() until not flags.breakercollecter
                addconnect:Disconnect()
            end
        end
    end,
})

local MiscSection = DoorsTab:CreateSection("Misc")

local GateButton = DoorsTab:CreateButton({
    Name = "Remove Gates",
    Callback = function()
        while true do
            wait (0.5)
            spawn(function()
                for _,room in pairs(workspace.CurrentRooms:GetChildren()) do
                    local gate = room:WaitForChild("Gate",2)
    
                    if gate then
                        local door = gate:WaitForChild("ThingToOpen",2)
    
                        if door then
                            door:Destroy() 
                        end
                    end
                end
            end)
    
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                local gate = room:WaitForChild("Gate",2)
    
                if gate then
                    local door = gate:WaitForChild("ThingToOpen",2)
    
                    if door then
                        door:Destroy() 
                    end
                end
            end)
    
            spawn(function()
                local gate = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Gate",2)
                if gate then
                    local door = gate:WaitForChild("ThingToOpen",2)
                    if door then
                        door:Destroy() 
                    end
                end
            end)
            repeat task.wait() until not flags.nogates
            addconnect:Disconnect()
        end
        
    end,
})

local a000nolocksToggle = DoorsTab:CreateToggle({
    Name = "A-000 No Locks",
    CurrentValue = false,
    Flag = "noa00locks", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.roomsnolock = val

		if val then
			local function check(room)
				local door = room:WaitForChild("RoomsDoor_Entrance",2)

				if door then
					local prompt = door:WaitForChild("Door"):WaitForChild("EnterPrompt")
					prompt.Enabled = true
				end 
			end
            local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				check(room)
			end)

			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				check(v)
			end

			spawn(function()
				check(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end)

			repeat task.wait() until not flags.roomsnolock
			addconnect:Disconnect()
		end
    end,
})

local skeletonToggle = DoorsTab:CreateToggle({
    Name = "Remove Skeleton Door",
    CurrentValue = false,
    Flag = "skeletondoor", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.noskeledoors = val

		if val then
			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				local door = room:WaitForChild("Wax_Door",2)

				if door then
					door:Destroy() 
				end
			end)

			spawn(function()
				local door = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Wax_Door",2)
				if door then
					door:Destroy() 
				end 
			end)

			repeat task.wait() until not flags.noskeledoors
			addconnect:Disconnect()
		end
    end,
})

local puzledoorToggle = DoorsTab:CreateToggle({
    Name = "Remove Puzzle Doors",
    CurrentValue = false,
    Flag = "puzzledoor", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.nopuzzle = val

		if val then
			spawn(function()
				for _,room in pairs(workspace.CurrentRooms:GetChildren()) do
					local assets = room:WaitForChild("Assets")
					local paintings = assets:WaitForChild("Paintings",2)

					if paintings then
						local door = paintings:WaitForChild("MovingDoor",2)

						if door then
							door:Destroy() 
						end 
					end
				end
			end)
            local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				local assets = room:WaitForChild("Assets")
				local paintings = assets:WaitForChild("Paintings",2)

				if paintings then
					local door = paintings:WaitForChild("MovingDoor",2)

					if door then
						door:Destroy() 
					end 
				end
			end)
            spawn(function()
				local assets = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets")
				local paintings = assets:WaitForChild("Paintings",2)
				if paintings then
					local door = paintings:WaitForChild("MovingDoor",2)
					if door then
						door:Destroy() 
					end 
				end
			end)

			repeat task.wait() until not flags.nopuzzle
			addconnect:Disconnect()
		end
    end,
})

if fireproximityprompt then
    local instantinterToggle = DoorsTab:CreateToggle({
        Name = "Instant Interact",
        CurrentValue = false,
        Flag = "noewait", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(val)
            flags.instapp = val

			local holdconnect
			holdconnect = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p)
				fireproximityprompt(p)
			end)

			repeat task.wait() until not flags.instapp
			holdconnect:Disconnect()
        end,
     })
    else
        warnmessage("Hunter Library v3", "You need to have fireproximityprompt function for 'instant use'.", 7)
end

local fovSlider = DoorsTab:CreateSlider({
    Name = "Field Of View",
    Range = {70, 120},
    Increment = 10,
    Suffix = "FOV",
    CurrentValue = 0,
    Flag = "fov",
    Callback = function(val)
        flags.camfov = (val)
    end,
})

task.spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
	if flags.walkspeedtoggle == true then
			if hum.WalkSpeed < flags.speed then
				hum.WalkSpeed = flags.speed
			end
		end
		if flags.camfovtoggle == true then
			if flags.tracers == false then
				pcall(function()
					game:GetService("Workspace").CurrentCamera.FieldOfView = flags.camfov
				end)
			else
				if syn or PROTOSMASHER_LOADED then
					pcall(function()
						game:GetService("Workspace").CurrentCamera.FieldOfView = flags.camfov
					end)
				end
			end
		end
	end)
end)

local Player = DoorsTab:CreateSection("Player")

local NoclipToggle = DoorsTab:CreateToggle({
    Name = "Noclip [NO BYPASS]",
    CurrentValue = false,
    Flag = "NoclipToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(val)
        flags.noclip = val

        if val then
            local Nocliprun =  nil
            Nocliprun = game:GetService("RunService").Stepped:Connect(function()
                if game.Players.LocalPlayer.Character ~= nil then
                    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            pcall(function()
                                v.CanCollide = false
                            end)
                        end
                    end
                end
                if flags.noclip == false then
                    if Nocliprun then Nocliprun:Disconnect() end
                end
            end)
        end
    end,
})game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.SlowDownnnonononoo then
local one = false

game.Players.LocalPlayer.Character.Head.Massless = one
game.Players.LocalPlayer.Character.LeftFoot.Massless = one
game.Players.LocalPlayer.Character.LeftHand.Massless = one
game.Players.LocalPlayer.Character.LeftLowerArm.Massless = one
game.Players.LocalPlayer.Character.LeftLowerLeg.Massless = one
game.Players.LocalPlayer.Character.LeftUpperArm.Massless = one
game.Players.LocalPlayer.Character.LeftUpperLeg.Massless = one
game.Players.LocalPlayer.Character.LowerTorso.Massless = one
game.Players.LocalPlayer.Character.RightFoot.Massless = one
game.Players.LocalPlayer.Character.RightHand.Massless = one
game.Players.LocalPlayer.Character.RightLowerArm.Massless = one
game.Players.LocalPlayer.Character.RightLowerLeg.Massless = one
game.Players.LocalPlayer.Character.RightUpperArm.Massless = one
game.Players.LocalPlayer.Character.RightUpperLeg.Massless = one
game.Players.LocalPlayer.Character.UpperTorso.Massless = one
        end
    end)
end)

local noslowToggle = DoorsTab:CreateToggle({
    Name = "No Slow Down",
    CurrentValue = false,
    Flag = "slowdowm", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(lowDownnnonononoo)
        _G.SlowDownnnonononoo = lowDownnnonononoo

if _G.SlowDownnnonononoo == false then
local one = true

game.Players.LocalPlayer.Character.Head.Massless = one
game.Players.LocalPlayer.Character.LeftFoot.Massless = one
game.Players.LocalPlayer.Character.LeftHand.Massless = one
game.Players.LocalPlayer.Character.LeftLowerArm.Massless = one
game.Players.LocalPlayer.Character.LeftLowerLeg.Massless = one
game.Players.LocalPlayer.Character.LeftUpperArm.Massless = one
game.Players.LocalPlayer.Character.LeftUpperLeg.Massless = one
game.Players.LocalPlayer.Character.LowerTorso.Massless = one
game.Players.LocalPlayer.Character.RightFoot.Massless = one
game.Players.LocalPlayer.Character.RightHand.Massless = one
game.Players.LocalPlayer.Character.RightLowerArm.Massless = one
game.Players.LocalPlayer.Character.RightLowerLeg.Massless = one
game.Players.LocalPlayer.Character.RightUpperArm.Massless = one
game.Players.LocalPlayer.Character.RightUpperLeg.Massless = one
game.Players.LocalPlayer.Character.UpperTorso.Massless = one
end
    end,
})

