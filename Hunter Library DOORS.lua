local BOBHUB_START_TIME = os.time()
local customnotifid = "10469938989"
local oldcustomnotifid = "4590657391"
function waitframes(ii) for i = 1, ii do task.wait() end end

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")


local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

function message(text)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 3;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	task.spawn(function()
		local msg = Instance.new("Message",workspace)
		msg.Text = tostring(text)
		task.wait(5)
		msg:Destroy()
	end)
end

function normalmessage(title, text, reason, timee, image, textlabel, waitforinsttodelete)
	task.spawn(function()
		do
			local AchievementsFolder = require(game:GetService("ReplicatedStorage"):WaitForChild("Achievements"))
			if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") then
				repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI")
			end
			local MainUI =  game.Players.LocalPlayer.PlayerGui.MainUI
			local TweenService = game:GetService("TweenService")

			if title == nil or typeof(title) ~= "string" or string.len(title) == 0 then return end
			if text == nil or typeof(text) ~= "string" or string.len(text) == 0 then return end
			if reason == nil or typeof(reason) ~= "string" or string.len(reason) == 0 then reason = "" end
			if textlabel == nil or typeof(textlabel) ~= "string" then textlabel = "NOTIFICATION" end
			if timee == nil or timee == 0 or typeof(timee) ~= "number" then timee = 5 end
			if image == nil or typeof(image) ~= "string" then 
				image = "6023426923" 
			end

			local AchievementFrame = MainUI.AchievementsHolder.Achievement:Clone();
			AchievementFrame.Size = UDim2.new(0, 0, 0, 0);
			AchievementFrame.Frame.Position = UDim2.new(1.1, 0, 0, 0);
			AchievementFrame.Name = "LiveAchievement";
			AchievementFrame.Visible = true;

			AchievementFrame.Frame.TextLabel.Text = textlabel
			if textlabel == "WARNING" then AchievementFrame.Frame.TextLabel.TextColor3 = Color3.fromRGB(175, 0, 0);AchievementFrame.Frame.UIStroke.Color = Color3.fromRGB(175, 0, 0);AchievementFrame.Frame.Glow.ImageColor3 = Color3.fromRGB(175, 0, 0); end
			AchievementFrame.Frame.Details.Desc.Text = tostring(text)
			AchievementFrame.Frame.Details.Title.Text = tostring(title)
			AchievementFrame.Frame.Details.Reason.Text = tostring(reason or "")

			AchievementFrame.Frame.ImageLabel.Image = "rbxassetid://"..tostring(image or "0")

			AchievementFrame.Parent = MainUI.AchievementsHolder;
			AchievementFrame.Sound.SoundId = "rbxassetid://"..customnotifid
			if textlabel == "WARNING" then AchievementFrame.Sound.Volume = 2 else AchievementFrame.Sound.Volume = 1 end
			AchievementFrame.Sound:Play();
			if textlabel == "WARNING" then AchievementFrame:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.3, true); else AchievementFrame:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true); end
			if textlabel == "WARNING" then wait(0.3) else wait(0.8) end
			AchievementFrame.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true);
			TweenService:Create(AchievementFrame.Frame.Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				ImageTransparency = 1
			}):Play()
			if waitforinsttodelete ~= nil and typeof(waitforinsttodelete) == "Instance" then
				waitforinsttodelete.Destroying:Wait()
			else
				wait(timee)
			end
			AchievementFrame.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
			wait(0.5)
			AchievementFrame:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true)
			wait(0.5)
			AchievementFrame:Destroy()
		end
	end)
end
function warnmessage(title, text, reason, timee, image, waitforinsttodelete)
	normalmessage(title, text, reason, timee, image, "WARNING", waitforinsttodelete)
end

function confirmnotification(title, text, timee, callback)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://"..oldcustomnotifid;notif.Volume = 1;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80), Time = timee or 10, Type = "option"},
		{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = callback or function(state)end}
	)
end

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

local currentver = "0.1 EARLY RELEASE"
local gui_data = nil
local s,e = pcall(function()
	gui_data = game:HttpGet(("https://raw.githubusercontent.com/ZanoLeafVN/Hmmm/main/gui_data.json"), true)
	gui_data = game:GetService("HttpService"):JSONDecode(gui_data)
end)
if e then
	oldwarnmessage("Hunter Library v"..currentver, "Failed to get script data.", 10)
end

if BOBHUBLOADED == true then warnmessage("Hunter Library v"..currentver, "GUI already loaded!", "", 10) return end
if game.PlaceId ~= 6839171747 and game.PlaceId == 6516141723 then 
	warnmessage("Hunter Library v"..currentver, "You need to join a game to run this script.", 10) 
	confirmnotification("Hunter Library v"..currentver, "Do you want to join a game?", 15, function(state)
		if state == true then
			task.spawn(function()
				loadstring(game:HttpGet(("https://raw.githubusercontent.com/DarkSuffer/BasicallyAnDoors-EDITED/main/joinsolo.lua?" .. tostring(math.random(0, 9999999))), true))()
			end)
		end
	end)
	return
end
if game.PlaceId ~= 6839171747 and game.PlaceId ~= 6516141723 then 
	oldwarnmessage("Hunter Library v"..currentver, "You need to join DOORS to run this script.", 10) 
	return
end
if gui_data ~= nil then
	if currentver ~= gui_data.ver or gui_data.ver ~= currentver then
		warnmessage("Hunter Library v"..currentver, "You are using an outdated version of this script", "Loading latest version.", 10) 
		loadstring(game:HttpGet((gui_data.loadstring.."?" .. tostring(math.random(0, 9999999)) ),true))()
		return
	else
		currentver = tostring(gui_data.ver)
	end
end
pcall(function() getgenv().BOBHUBLOADED = true end)
normalmessage("Hunter Library v"..currentver, "Loading script...", "", 2)
if gui_data ~= nil then
	oldnormalmessage("INFO", gui_data.changelog, 20)
end

-- credits alan1508 on v3erm
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
	camfovtoggle = false,
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

local repo = 'https://raw.githubusercontent.com/notpoiu/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({

    Title = 'Hunter Library v'..currentver..' | DOORS 👁️',
    Center = true,
    AutoShow = true,
    Resizable = true,
    ShowCustomCursor = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Script Features'),
    Credits = Window:AddTab('Credits'),
    ['UI Settings'] = Window:AddTab('Configs'),
}
    
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('ESP')
LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Door ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.espdoors = val

		if val then
			local function setup(room)
				task.wait(.1)
				local door = room:WaitForChild("Door"):WaitForChild("Door")

				if table.find(esptableinstances, door) then
					return
				end

				task.wait(0.1)
				local h = esp(door,Color3.fromRGB(90,255,40),door,"Door")
				table.insert(esptable.doors,h)
				table.insert(esptableinstances, door)

				door:WaitForChild("Open").Played:Connect(function()
					h.delete()
				end)

				door.AncestryChanged:Connect(function()
					h.delete()
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
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until BOBHUBLOADED == false or not flags.espdoors
			addconnect:Disconnect()

			for i,v in pairs(esptable.doors) do
				v.delete()
end 
		end
	end
})

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Key/Lever ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.espkeys = val

		if val then
			local function check(v, room)
				task.wait()
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") then
					if v.Name == "ElectricalKeyObtain" then
						local hitbox = v:FindFirstChild("Hitbox")
						local parts = hitbox:GetChildren()
						table.remove(parts,table.find(parts,v:WaitForChild("PromptHitbox")))

						local h = esp(parts,Color3.fromRGB(255,255,255),hitbox,"Electrical Key")
						table.insert(esptable.keys,h)
						table.insert(esptableinstances, v)
					end
					if v.Name == "KeyObtain" then
						local hitbox = v:FindFirstChild("Hitbox")
						local parts = hitbox:GetChildren()
						table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))

						local h = esp(parts,Color3.fromRGB(255,255,255),hitbox,"Key")
						table.insert(esptable.keys,h)
						table.insert(esptableinstances, v)
					end;if v.Name == "LeverForGate" then
						local h = esp(v,Color3.fromRGB(255,255,255),v.PrimaryPart,"Lever")
						table.insert(esptable.keys,h)
						table.insert(esptableinstances, v)
						v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()
							h.delete()
						end) 
					end
				end
			end

			local function setup(room)
				local assets = room:FindFirstChild("Assets")

				if room then
					if assets then
						assets.DescendantAdded:Connect(function(v)
							check(v, room) 
						end)
					else
						room.DescendantAdded:Connect(function(v)
							check(v, room) 
						end)
					end
				end

				if assets then
					for i,v in pairs(assets:GetChildren()) do --:GetDescendants()) do
						check(v, room)
					end 
				else
					for i,v in pairs(room:GetDescendants()) do
						check(v, room)
					end 
				end
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				setup(room)
			end

			setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

			repeat task.wait() until BOBHUBLOADED == false or not flags.espkeys
			addconnect:Disconnect()

			for i,v in pairs(esptable.keys) do
				v.delete()
			end 
		end
	end
})

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Item ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.espitems = val

		if val then
			local function check(v)
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) then
					task.wait(0.1)

					local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))
					local h = esp(part,Color3.fromRGB(160,190,255),part,v.Name)
					table.insert(esptable.items,h)
					table.insert(esptableinstances, v)				
				end
			end

			local function setup(room)
				task.wait(.1)
				local assets = room:WaitForChild("Assets")

				if assets then  
					local subaddcon
					subaddcon = assets.DescendantAdded:Connect(function(v)
						check(v) 
					end)

					for i,v in pairs(assets:GetDescendants()) do
						check(v)
					end

					task.spawn(function()
						repeat task.wait() until BOBHUBLOADED == false or not flags.espitems
						subaddcon:Disconnect()  
					end) 
				end 
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				if room:FindFirstChild("Assets") then
					setup(room) 
				end
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until BOBHUBLOADED == false or not flags.espitems
			addconnect:Disconnect()

			for i,v in pairs(esptable.items) do
				v.delete()
			end 
		end
	end
})

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Book/Breaker ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.espbooks = val

		if val then
			local function check(v,room)
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") and (v.Name == "LiveHintBook" or v.Name == "LiveBreakerPolePickup") then
					task.wait(0.1)
					local h
					if v.Name == "LiveHintBook" then
						h = esp(v,Color3.fromRGB(0,255,255),v.PrimaryPart,"Book")
					elseif v.Name == "LiveBreakerPolePickup" then
						h = esp(v,Color3.fromRGB(0,255,255),v.PrimaryPart,"Breaker")
					end

					table.insert(esptable.books,h)
					table.insert(esptableinstances, v)

					v.AncestryChanged:Connect(function()
						if not v:IsDescendantOf(room) then
							h.delete() 
						end
					end)
				end
			end

			local function setup(room)
				task.wait(.1)
				if room.Name == "50" or room.Name == "100" then
					room.DescendantAdded:Connect(function(v)
						check(v,room) 
					end)

					for i,v in pairs(room:GetDescendants()) do
						check(v,room)
					end
				end
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
				setup(room) 
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until BOBHUBLOADED == false or not flags.espbooks
			addconnect:Disconnect()

			for i,v in pairs(esptable.books) do
				v.delete()
			end 
		end
	end
})
    
    LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Entity ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.esprush = val

		if val then
			local addconnect
			addconnect = workspace.ChildAdded:Connect(function(v)
				if table.find(entitynames,v.Name) then
					task.wait(.1)
					local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
					table.insert(esptable.entity,h)
				end
			end)

			for _,v in pairs(workspace:GetChildren()) do
				if table.find(entitynames,v.Name) then
					task.wait(.1)
					local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
					table.insert(esptable.entity,h)
				end
			end

			local function setup(room)
				task.wait()
				if room.Name == "50" or room.Name == "100" then
					local figuresetup = room:WaitForChild("FigureSetup")

					if figuresetup then
						local fig = figuresetup:WaitForChild("FigureRagdoll")
						task.wait(0.1)

						local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")
						table.insert(esptable.entity,h)
					end 
				else
					local assets = room:WaitForChild("Assets")

					local function check(v)
						if v:IsA("Model") and table.find(entitynames,v.Name) then
							task.wait(0.1)

							local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")
							table.insert(esptable.entity,h)
						end
					end

					assets.DescendantAdded:Connect(function(v)
						check(v) 
					end)

					for i,v in pairs(assets:GetDescendants()) do
						check(v)
					end
				end 
			end

			local roomconnect
			roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
				setup(v) 
			end

			setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])

			repeat task.wait() until BOBHUBLOADED == false or not flags.esprush
			addconnect:Disconnect()
			roomconnect:Disconnect()

			for i,v in pairs(esptable.entity) do
				v.delete()
			end 
		end
	end
})
    
    LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Hide Spot ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.esplocker = val

		if val then
			local function check(v, room)
				task.wait()
				local valuechange = nil
				if v.Name == "Wardrobe" then
					local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"Hide Spot")
					table.insert(esptable.lockers,h) 
					table.insert(esptableinstances, v)
					valuechange = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
						if tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value) ~= room.Name then
							h.delete()
							valuechange:Disconnect()
						end
					end)
				end
			end

			local function setup(room)
				local assets = room:WaitForChild("Assets")

				if assets then
					local subaddcon
					subaddcon = assets.DescendantAdded:Connect(function(v)
						check(v, room) 
					end)

					for i,v in pairs(assets:GetDescendants()) do
						check(v, room)
					end

					task.spawn(function()
						repeat task.wait() until BOBHUBLOADED == false or not flags.esplocker
						subaddcon:Disconnect()  
					end)
				else
					local subaddcon
					subaddcon = room.DescendantAdded:Connect(function(v)
						check(v, room) 
					end)

					for i,v in pairs(room:GetDescendants()) do
						check(v, room)
					end

					task.spawn(function()
						repeat task.wait() until BOBHUBLOADED == false or not flags.esplocker
						subaddcon:Disconnect()  
					end) 
				end
			end

			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				setup(room)
			end)

			if workspace.CurrentRooms:FindFirstChild(tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-1)) then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value-1)])
			end
			setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			if workspace.CurrentRooms:FindFirstChild(tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value+1)) then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value+1)])
			end

			repeat task.wait() until BOBHUBLOADED == false or not flags.esplocker
			addconnect:Disconnect()

			for i,v in pairs(esptable.lockers) do
				v.delete()
			end 
		end
	end
})
    
    LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Chest ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.espchest = val

		if val then
			local function check(v, room)
				task.wait()
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") then
					local okvaluechange = nil
					if v.Name == "ChestBox" then
						warn(v.Name)
						local h = esp(v,Color3.fromRGB(205,120,255),v.PrimaryPart,"Chest")
						table.insert(esptable.chests,h) 
						table.insert(esptableinstances, v)
						okvaluechange = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
							if tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value) ~= room.Name then
								h.delete()
								okvaluechange:Disconnect()
							end
						end)
					elseif v.Name == "ChestBoxLocked" then
						local h = esp(v,Color3.fromRGB(255,120,205),v.PrimaryPart,"Locked Chest")
						table.insert(esptable.chests,h) 
						table.insert(esptableinstances, v)
						okvaluechange = game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
							if tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value) ~= room.Name then
								h.delete()
								okvaluechange:Disconnect()
							end
						end)
					end
				end
			end

			local function setup(room)
				task.wait(.1)
				local subaddcon
				subaddcon = room.DescendantAdded:Connect(function(v)
					check(v, room) 
				end)

				for i,v in pairs(room:GetDescendants()) do
					check(v, room)
				end

				task.spawn(function()
					repeat task.wait() until BOBHUBLOADED == false or not flags.espchest
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
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until BOBHUBLOADED == false or not flags.espchest
			addconnect:Disconnect()

			for i,v in pairs(esptable.chests) do
				v.delete()
			end
		end
	end
})
    
    LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Player ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.esphumans = val

		if val then
			local function personesp(v)
				if v:IsA("Player") then
					v.CharacterAdded:Connect(function(vc)
						local vh = vc:WaitForChild("Humanoid")
						local torso = vc:WaitForChild("UpperTorso")
						task.wait(0.1)

						local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
						table.insert(esptable.people,h) 
					end)

					if v.Character then
						local vc = v.Character
						local vh = vc:WaitForChild("Humanoid")
						local torso = vc:WaitForChild("UpperTorso")
						task.wait(0.1)

						local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
						table.insert(esptable.people,h) 
					end
				end
			end

			local addconnect
			addconnect = game.Players.PlayerAdded:Connect(function(v)
				if v ~= plr then
					personesp(v)
				end
			end)

			for i,v in pairs(game.Players:GetPlayers()) do
				if v ~= plr then
					personesp(v) 
				end
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				personesp(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until BOBHUBLOADED == false or not flags.esphumans
			addconnect:Disconnect()

			for i,v in pairs(esptable.people) do
				v.delete()
			end 
		end
	end
})
    
    LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Gold ESP',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.espgold = val

		if val then
			local function check(v)
				if table.find(esptableinstances, v) then
					return
				end

				if v:IsA("Model") then
					task.wait(0.1)
					local goldvalue = v:GetAttribute("GoldValue")

					if goldvalue and goldvalue >= (flags.goldespvalue or 5) then
						local hitbox = v:WaitForChild("Hitbox")
						local h = esp(hitbox:GetChildren(),Color3.fromRGB(255,255,0),hitbox,"GoldPile [".. tostring(goldvalue).."]")
						table.insert(esptable.gold,h)
						table.insert(esptableinstances, v)
					end
				end
			end

			local function setup(room)
				task.wait(.1)
				local assets = room:WaitForChild("Assets")

				local subaddcon
				subaddcon = assets.DescendantAdded:Connect(function(v)
					check(v) 
				end)

				for i,v in pairs(assets:GetDescendants()) do
					check(v)
					task.wait()
				end

				task.spawn(function()
					repeat task.wait() until BOBHUBLOADED == false or not flags.espchest
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
				task.wait()
			end

			if workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:FindFirstChild("Assets") then
				setup(workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)])
			end

			repeat task.wait() until BOBHUBLOADED == false or not flags.espgold
			addconnect:Disconnect()

			for i,v in pairs(esptable.gold) do
				v.delete()
			end 
		end
	end
})

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Character')
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox('Trolling')

if fireproximityprompt then
LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Instant Use',
    Default = false,
    Tooltip = 'Removes The E Cooldown With Interacting',

    Callback = function(val)
    flags.instapp = val

			local holdconnect
			holdconnect = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p)
				fireproximityprompt(p)
			end)

			repeat task.wait() until BOBHUBLOADED == false or not flags.instapp
			holdconnect:Disconnect()
		end
	})
else
	warnmessage("Hunter Library v"..currentver, "You need to have fireproximityprompt function for 'instant use'.", 7)
end
    
LeftGroupBox:AddToggle('MyToggle', {
    Text = 'FullBright',
    Default = false,
    Tooltip = 'Allows You To See In Dark Rooms',

    Callback = function(val)
     flags.fullbright = val

		if val then
			local oldAmbient = game:GetService("Lighting").Ambient
			local oldColorShift_Bottom = game:GetService("Lighting").ColorShift_Bottom
			local oldColorShift_Top = game:GetService("Lighting").ColorShift_Top

			local function doFullbright()
				if flags.fullbright == true then
					game:GetService("Lighting").Ambient = Color3.new(1, 1, 1)
					game:GetService("Lighting").ColorShift_Bottom = Color3.new(1, 1, 1)
					game:GetService("Lighting").ColorShift_Top = Color3.new(1, 1, 1)
				else
					game:GetService("Lighting").Ambient = oldAmbient
					game:GetService("Lighting").ColorShift_Bottom = oldColorShift_Bottom
					game:GetService("Lighting").ColorShift_Top = oldColorShift_Top
				end
			end
			doFullbright()

			local coneee = game:GetService("Lighting").LightingChanged:Connect(doFullbright)
			repeat task.wait() until BOBHUBLOADED == false or not flags.fullbright

			coneee:Disconnect()
			game:GetService("Lighting").Ambient = oldAmbient
			game:GetService("Lighting").ColorShift_Bottom = oldColorShift_Bottom
			game:GetService("Lighting").ColorShift_Top = oldColorShift_Top
		end
	end
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Speed Boost',
    Default = 0,
    Min = 0,
    Max = 25,
    Rounding = 1,
    Compact = false,

    Callback = function(val)
        flags.speed = val
		if flags.walkspeedtoggle == true then
			hum.WalkSpeed = val
		end
	end
})

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Enable Speed Boost',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.walkspeedtoggle = val
		if not val then
			hum.WalkSpeed = 16
		end
	end
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'FieldOfView',
    Default = 0,
    Min = 70,
    Max = 120,
    Rounding = 1,
    Compact = false,

    Callback = function(val)
        flags.camfov = val
	end
})

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Enable Custom Field Of View',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.camfovtoggle = val
		if not val then
			waitframes(2)
			game:GetService("Workspace").CurrentCamera.FieldOfView = 70
		end
	end
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

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Noclip',
    Default = false,
    Tooltip = 'Allows You To Noclip Through Walls',

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
		end
})

game:GetService("RunService").RenderStepped:Connect(function()
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

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'No Slow Down',
    Default = false,
    Tooltip = '',
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
  end
})

local TabBox = Tabs.Main:AddRightTabbox()

local Tab1 = TabBox:AddTab('Auto')

Tab1:AddToggle('MyToggle', {
    Text = 'Auto Library Code',
    Default = false,
    Tooltip = 'Automatically Figures Out the Library Code',

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

			repeat task.wait() until BOBHUBLOADED == false or not flags.getcode
			addconnect:Disconnect()
		end
	end
})

local elevatorbreakerbox = false
Tab1:AddToggle('MyToggle', {
Text = 'Auto Complete Breaker Box',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    warnmessage("ROOM 100", "Trying to comeplete breaker box...", "Then go elevator now...", 5)
    NoBreaker = val
    while task.wait(1) do
        if not NoBreaker then
            break
        end
        EntityInfo.EBF:FireServer()
    end
end
})

local Tab2 = TabBox:AddTab('Notify')

Tab2:AddInput('MyTextbox', {
    Default = 'Text',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter
    Text = 'Chat Notify Text',
    Tooltip = 'Chat Notify Text', -- Information shown when you hover over the textbox
    Placeholder = 'Chat Notify Text', -- placeholder text when the box is empty
    Callback = function(caht)
casjfg = caht
    end
})

Tab2:AddToggle('MyToggle', {
    Text = 'Notify Entities',
    Default = false,
    Tooltip = 'Notifies When Entities Are Coming',
    Callback = function(val)
    flags.hintrush = val
	end
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
	end--]]
end)

local casjfg = ""

Tab2:AddToggle('MyToggle', {
    Text = 'Chat Notify',
    Default = false,
    Tooltip = '',
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
	end
})

local RightGroupbox = Tabs.Main:AddRightGroupbox('Auras');
if fireproximityprompt then
RightGroupbox:AddToggle('MyToggle', {
    Text = 'Loot Aura',
    Default = false,
    Tooltip = '',

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
						repeat task.wait() until BOBHUBLOADED == false or not flags.draweraura
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

				repeat task.wait() until BOBHUBLOADED == false or not flags.draweraura
				addconnect:Disconnect()
			end
		end
})
else
oldwarnmessage("Hunter Library v"..currentver, "You need to have fireproximityprompt function for 'loot aura'.", 7)
end

RightGroupbox:AddToggle('MyToggle', {
    Text = 'Item Aura',
    Default = false,
    Tooltip = '',

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
		end
})

RightGroupbox:AddToggle('MyToggle', {
    Text = 'Lever Aura',
    Default = false,
    Tooltip = '',

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
						repeat task.wait() until BOBHUBLOADED == false or not flags.autopulllever
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

					repeat task.wait() until BOBHUBLOADED == false or not flags.autopulllever
					addconnect:Disconnect()
				end
			end
		end
	})

RightGroupbox:AddToggle('MyToggle', {
    Text = 'Book Aura',
    Default = false,
    Tooltip = '',

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

					repeat task.wait() until BOBHUBLOADED == false or not flags.bookcollecter
					addconnect:Disconnect()
				end
			end
		end
	})
	
	RightGroupbox:AddToggle('MyToggle', {
    Text = 'Breaker Aura',
    Default = false,
    Tooltip = '',

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
						repeat task.wait() until BOBHUBLOADED == false or not flags.breakercollecter
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

					repeat task.wait() until BOBHUBLOADED == false or not flags.breakercollecter
					addconnect:Disconnect()
				end
			end
		end
	})

local RightGroupbox1 = Tabs.Main:AddRightGroupbox('Avoiding');

local RightGroupbox2 = Tabs.Main:AddRightGroupbox('Entity Remover');

local RightGroupbox3 = Tabs.Main:AddRightGroupbox('Miscellaneous');

local MyButton = RightGroupbox1:AddButton({
    Text = 'Enable GodMode',
    Func = function()
task.wait(0.3)
    if _G.God == nil then
_G.God = true
local Collision = game.Players.LocalPlayer.Character.Collision
    Collision.Position = Collision.Position - Vector3.new(0,9.8,0)
    firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent, "GodMode is Enabled...")
task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://6897623656";notif.Volume = 2;notif:Play();notif.Stopped:Wait();notif:Destroy()
		end)
end
end,
    DoubleClick = false,
    Tooltip = ''
})

local MyButton = RightGroupbox1:AddButton({
    Text = 'Disable GodMode',
    Func = function()
task.wait(0.3)
    if _G.God == nil then
_G.God = true
local Collision = game.Players.LocalPlayer.Character.Collision
    Collision.Position = Collision.Position + Vector3.new(0,9.8,0)
    firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent, "GodMode is Disabled...")
task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://6897623656";notif.Volume = 2;notif:Play();notif.Stopped:Wait();notif:Destroy()
		end)
end
end,
    DoubleClick = false,
    Tooltip = ''
})
local MyButton = LeftGroupBox2:AddButton({
    Text = 'Waste Others Items',
    Func = function()
        for _,Player in pairs(Players:GetPlayers()) do
            local function WasteItem(Item)
                if Item.Parent ~= Character and Item.Parent.Parent ~= LocalPlayer then
                    if ((Item.Name == "Lighter" or Item.Name == "Flashlight") and Item:GetAttribute("Enabled") == false) or Item.Name == "Vitamins" then
                        Item.Remote:FireServer()
                    end
                end
            end
            for _,Item in pairs(Player.Backpack:GetChildren()) do
                WasteItem(Item)
            end
            for _,Item in pairs(Player.Character:GetChildren()) do
                WasteItem(Item)
            end
        end
end,
    DoubleClick = false,
    Tooltip = ''
})
LeftGroupBox2:AddToggle('MyToggle', {
    Text = 'Spam Motor Replication',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    if val then
        SpoofMotor = game:GetService("RunService").Heartbeat:Connect(function()
            game.ReplicatedStorage.EntityInfo.MotorReplication:FireServer(math.random(1,100000),math.random(1,100000),math.random(1,100000),false)
        end)
    else
        SpoofMotor:Disconnect()
    end
	end
})

RightGroupbox2:AddToggle('MyToggle', {
    Text = 'No Anti Cheat',
    Default = true,
    Tooltip = 'RECCOMMENDED',

    Callback = function(BypassSpeedss)
_G.BypassSpeeds = BypassSpeedss
while _G.BypassSpeeds do wait(0.2)
    pcall(function()
game.Players.LocalPlayer.Character.Collision.Size = Vector3.new(2, 2, 2)
wait(0.2)
game.Players.LocalPlayer.Character.Collision.Size = Vector3.new(3, 4.5, 3)
    end)
end
	end
})

RightGroupbox2:AddToggle('MyToggle', {
    Text = 'No Seek Chase',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.noseek = val

		if val then
			local addconnect
			addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
				local trigger = room:WaitForChild("TriggerEventCollision",2)

				if trigger then
					trigger:Destroy() 
				end
			end)

			repeat task.wait() until BOBHUBLOADED == false or not flags.noseek
			addconnect:Disconnect()
		end
	end
})

    game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
	task.wait(.1)
	for _,descendant in pairs(game:GetService("Workspace").CurrentRooms:GetDescendants()) do
		if descendant.Name == "Seek_Arm" or descendant.Name == "ChandelierObstruction" then
			descendant.Parent = nil
			descendant:Destroy()
		end
	end
end)

local ScreechModule = plr.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("Screech")
RightGroupbox2:AddToggle('MyToggle', {
    Text = 'No Screech',
    Default = false,
    Tooltip = '',

    Callback = function(val)
flags.noscreech = val
end
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if flags.noscreech then
        game:GetService("ReplicatedStorage").Entities.Screech:destroy()
        end
        end)
        end)


RightGroupbox2:AddToggle('MyToggle', {
    Text = 'No Timothy [NoJumpScare]',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    DisableTimothy = val
    end
})

local old
	old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args = {...}
		local method = getnamecallmethod()

		if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and flags.heartbeatwin == true then
			args[2] = true
			return old(self,unpack(args))
		end

		return old(self,...)
	end))

RightGroupbox2:AddToggle('MyToggle', {
    Text = 'No Eyes Damage',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.noeyesdamage = val
	end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Backpack = LocalPlayer.Backpack
local Humanoid = Character:WaitForChild("Humanoid")
local AvatarIcon = Players:GetUserThumbnailAsync(LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)
local MainUI = LocalPlayer.PlayerGui.MainUI
local Main_Game = MainUI.Initiator.Main_Game
local Modules = Main_Game.RemoteListener.Modules
local ScreechSafeRooms = {}
local PrimaryPart = Character.PrimaryPart
local CurrentRooms = workspace.CurrentRooms
local EntityInfo = ReplicatedStorage.EntityInfo
local ClientModules = ReplicatedStorage.ClientModules
local DeathHint = EntityInfo.DeathHint
local CamLock = EntityInfo.CamLock
local MotorReplication = EntityInfo.MotorReplication
local EntityModules = ClientModules.EntityModules
local ItemESP = false
local EntityESP = false
local OtherESP = false
local EyesOnMap = false
local InstantInteract = false
local IncreasedDistance = false
local InteractNoclip = false
local EnableInteractions = false
local DisableDupe = false
local DisableSeek = false
local NoDark = false
local Noclip = false
local DisableTimothy = false
local DisableA90 = false
local NoclipNext = false
local IsExiting = false
local RemoveDeathHint = false
local ClosetExitFix = false
local NoBreaker = false
local DisableEyes = false
local DisableGlitch = false
local DisableSnare = false
local WasteItems = false
local ScreechModule
local CustomScreechModule
local TimothyModule
local CustomTimothyModule
local A90Module
local CustomA90Module
local DoorRange
local SpoofMotor
local ESP_Items = {KeyObtain={"Key",1.5},LiveHintBook={"Book",1.5},Lighter={"Lighter",1.5},Lockpick={"Lockpicks",1.5},Vitamins={"Vitamins",1.5},Crucifix={"Crucifix",1.5},CrucifixWall={"Crucifix",1.5},SkeletonKey={"Skeleton Key",1.5},Flashlight={"Flashlight",1.5},Candle={"Candle",1.5},LiveBreakerPolePickup={"Fuse",1.5},Shears={"Shears",1.5},Battery={"Battery",1.5},PickupItem={"Paper",1.5},ElectricalKeyObtain={"Electrical Key",1.5},Shakelight={"Shakelight",1.5},Scanner={"iPad",1.5}}
local ESP_Entities = {RushMoving={"Rush",5},AmbushMoving={"Ambush",5},FigureRagdoll={"Figure",7},FigureLibrary={"Figure",7},SeekMoving={"Seek",5.5},Screech={"Screech",2},Eyes={"Eyes",4},Snare={"Snare",2},A60={"A-60",10},A120={"A-120",10}}
local ESP_Other = {Door={"Door",5},LeverForGate={"Lever",3},GoldPile={"Gold",0.5},Bandage={"Bandage",0.5}}
local MainFrame = MainUI.MainFrame
local GameData = ReplicatedStorage.GameData
local LatestRoom = GameData.LatestRoom
local Floor = GameData.Floor
local OldEnabled = {}
local Module_Events = require(ClientModules.Module_Events)
local ShatterFunction = Module_Events.shatter
local HideTick = tick()
local GlitchModule = EntityModules.Glitch
local CustomGlitchModule = GlitchModule:Clone()

CustomGlitchModule.Name = "CustomGlitch"
CustomGlitchModule.Parent = GlitchModule.Parent
GlitchModule:Destroy()
EntityInfo.UseEnemyModule.OnClientEvent:Connect(function(Entity,x,...)
    if Entity == "Glitch" then
        if not DisableGlitch then
            require(CustomGlitchModule).stuff(require(Main_Game),table.unpack({...}))
        end
    end
end)
DeathHint.OnClientEvent:Connect(function()
    if RemoveDeathHint then
        task.wait()
        firesignal(DeathHint.OnClientEvent,{},"Blue")
    end
end)
for _,Player in pairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer then
        ESP_Other[Player.Name] = {Player.DisplayName,4}
    end
end
local function ReplacePainting(Painting,NewImage,NewTitle)
    Painting:WaitForChild("Canvas").SurfaceGui.ImageLabel.Image = NewImage
    Painting.Canvas.SurfaceGui.ImageLabel.BackgroundTransparency = 1
    Painting.Canvas.SurfaceGui.ImageLabel.ImageTransparency = 0
    Painting.Canvas.SurfaceGui.ImageLabel.ImageColor3 = Color3.new(1,1,1)
    local NewPrompt = Painting:WaitForChild("InteractPrompt"):Clone()
    Painting.InteractPrompt:Destroy()
    NewPrompt.Parent = Painting
    NewPrompt.Triggered:Connect(function()
        require(Main_Game).caption("This painting is titled \"" .. NewTitle .. "\".")
    end)
end
local function ApplyCustoms(DontYield)
    task.wait(DontYield and 0 or 1)
    ScreechModule = Modules:WaitForChild("Screech")
    TimothyModule = Modules.SpiderJumpscare
    A90Module = Modules.A90
    CustomScreechModule = ScreechModule:Clone()
    CustomTimothyModule = TimothyModule:Clone()
    CustomA90Module = A90Module:Clone() 
    CustomScreechModule.Name = "CustomScreech"
    CustomTimothyModule.Name = "CustomTimothy"
    CustomA90Module.Name = "CustomA90"
    CustomScreechModule.Parent = ScreechModule.Parent
    CustomTimothyModule.Parent = TimothyModule.Parent
    CustomA90Module.Parent = A90Module.Parent
    ScreechModule:Destroy()
    TimothyModule:Destroy()
    A90Module:Destroy()
end
local function ApplySettings(Object)
    task.spawn(function()
        task.wait()
        if (ESP_Items[Object.Name] or ESP_Entities[Object.Name] or ESP_Other[Object.Name]) and Object.ClassName == "Model" then
            if Object:FindFirstChild("RushNew") then
                if not Object.RushNew:WaitForChild("PlaySound").Playing then return end
            end
            local Color = ESP_Items[Object.Name] and Color3.new(1,1) or ESP_Entities[Object.Name] and Color3.new(1) or Color3.new(0,1,1)
            if Object.Name == "RushMoving" or Object.Name == "AmbushMoving" or Object.Name == "Eyes" or Object.Name == "A60" or Object.Name == "A120" then
                for i = 1, 100 do
                    if Object:FindFirstChildOfClass("Part") then
                        break
                    end
                    if i == 100 then
                        return
                    end
                end
                Object:FindFirstChildOfClass("Part").Transparency = 0.99
                Instance.new("Humanoid",Object)
            end
            local function ApplyHighlight(IsValid,Bool)
                if IsValid then
                    if Bool then
                        local TXT = IsValid[1]
                        if IsValid[1] == "Door" then
                            local RoomName
                            if Floor.Value == "Rooms" then
                                RoomName = ""
                            else
                                workspace.CurrentRooms:WaitForChild(tonumber(Object.Parent.Name) + 1,math.huge)
                                if not OtherESP then return end
                                local OldString = workspace.CurrentRooms[tonumber(Object.Parent.Name) + 1]:GetAttribute("OriginalName"):sub(7,99)
                                local NewString = ""
                                for i = 1, #OldString do
                                    if i == 1 then
                                        NewString = NewString .. OldString:sub(i,i)
                                        continue
                                    end
                                    if OldString:sub(i,i) == OldString:sub(i,i):upper() and OldString:sub(i-1,i-1) ~= "_" then
                                        NewString = NewString .. " "
                                    end
                                    if OldString:sub(i,i) ~= "_" then
                                        NewString = NewString .. OldString:sub(i,i)
                                    end
                                end
                                RoomName = " (" .. NewString .. ")"
                            end
                            TXT = "Door " .. (Floor.Value == "Rooms" and "A-" or "") .. tonumber(Object.Parent.Name) + 1 .. RoomName
                        end
                        if IsValid[1] == "Gold" then
                            TXT = Object:GetAttribute("GoldValue") .. " Gold"
                        end
                        local UI = Instance.new("BillboardGui",Object)
                        UI.Size = UDim2.new(0,1000,0,30)
                        UI.AlwaysOnTop = true
                        UI.StudsOffset = Vector3.new(0,IsValid[2],0)
                        local Label = Instance.new("TextLabel",UI)
                        Label.Size = UDim2.new(1,0,1,0)
                        Label.BackgroundTransparency = 1
                        Label.TextScaled = true
                        Label.Text = TXT
                        Label.TextColor3 = Color
                        Label.FontFace = Font.new("rbxasset://fonts/families/Oswald.json")
                        Label.TextStrokeTransparency = 0
                        Label.TextStrokeColor3 = Color3.new(Color.R/2,Color.G/2,Color.B/2)
                    elseif Object:FindFirstChild("BillboardGui") then
                        Object.BillboardGui:Destroy()
                    end
                    local Target = Object
                    if IsValid[1] == "Door" and Object.Parent.Name ~= "49" and Object.Parent.Name ~= "50" then
                        Target = Object:WaitForChild("Door")
                    end
                    if Bool then
                        local Highlight = Instance.new("Highlight",Target)
                        Highlight.FillColor = Color
                        Highlight.OutlineColor = Color
                    elseif Target:FindFirstChild("Highlight") then
                        Target.Highlight:Destroy()
                    end
                end
            end
            ApplyHighlight(ESP_Items[Object.Name],ItemESP)
            ApplyHighlight(ESP_Entities[Object.Name],EntityESP)
            ApplyHighlight(ESP_Other[Object.Name],OtherESP)
        end
        if Object:IsA("ProximityPrompt") then
            if InstantInteract then
                Object.HoldDuration = -Object.HoldDuration
            end
            if IncreasedDistance and Object.Parent and Object.Parent.Name ~= "Shears" then
                Object.MaxActivationDistance *= IncreasedDistance and 2 or 0.5
            end
            if InteractNoclip then
                Object.RequiresLineOfSight = not InteractNoclip
            end
            if EnableInteractions then
                if Object.Enabled then
                    table.insert(OldEnabled,Object)
                end
                Object.Enabled = true
            end
            Object:GetPropertyChangedSignal("Enabled"):Connect(function()
                if EnableInteractions then
                    Object.Enabled = true
                end
            end)
        end
        if Object.Name == "DoorFake" then
            Object:WaitForChild("Hidden").CanTouch = not DisableDupe
            if Object:FindFirstChild("LockPart") then
                Object.LockPart:WaitForChild("UnlockPrompt", 1).Enabled = not DisableDupe
            end
            Object.Door.Color = DisableDupe and Color3.new(0.5,0,0) or Color3.fromRGB(129,111,100)
            Object.Door.SignPart.Color = DisableDupe and Color3.new(0.5,0,0) or Color3.fromRGB(129,111,100)
            for _,DoorNumber in pairs({Object.Sign.Stinker,Object.Sign.Stinker.Highlight,Object.Sign.Stinker.Shadow}) do
                DoorNumber.Text = DisableDupe and "DUPE" or string.format("%0.4i",LatestRoom.Value)
            end
        end
        if Object.Parent and Object.Parent.Name == "TriggerEventCollision" then
            Object.CanCollide = not DisableSeek
            Object.CanTouch = not DisableSeek
        end
        if Object.Name == "Shears" and Object.Parent.Name == "LootItem" then
            if not Object:FindFirstChild("FakeShears") then
                local FakePrompt = Object.ModulePrompt:Clone()
                Object.ModulePrompt.Enabled = false
                FakePrompt.Parent = Object
                FakePrompt.MaxActivationDistance = 13.1
                FakePrompt.Name = "FakePrompt"
                FakePrompt.Triggered:Connect(function()
                    if (Object.Main.Position - PrimaryPart.Position).magnitude < 12 then
                        fireproximityprompt(Object.ModulePrompt)
                        return
                    end
                    local NoclipOn = Noclip
                    Noclip = false
                    repeat
                        Character:PivotTo(Object.Main.CFrame + Vector3.new(0,5,0))
                        fireproximityprompt(Object.ModulePrompt)
                        Character.PrimaryPart.Velocity = Vector3.new()
                        task.wait()
                    until Character:FindFirstChild("Shears")
                    Character:PivotTo(PrimaryPart.CFrame + Vector3.new(0,7,0))
                    Noclip = NoclipOn
                end)
            end
        end
        if Object.Name == "Eyes" then
            EyesOnMap = true
            if DisableEyes then
                MotorReplication:FireServer(0,-120,0,false)
            end
        end
        if Object.Name == "Snare" then
            Object.Hitbox.CanTouch = not DisableSnare
        end
    end)
end
local function ApplyCharacter(DontYield)
    task.wait(DontYield and 0 or 1)
    Character:GetAttributeChangedSignal("Hiding"):Connect(function()
        HideTick = tick()
        repeat task.wait() until not PrimaryPart.Anchored
        Character.Collision.CanCollide = not Noclip
        PrimaryPart.CanCollide = not Noclip
        return
    end)
    Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
        if NoDark then
            Lighting.Ambient = Color3.fromRGB(67, 51, 56)
        end
    end)
    Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(ApplySpeed)
    Character:GetPropertyChangedSignal("WorldPivot"):Connect(function()
        if not Noclip then return end
        if NoclipNext then return end
        if Character:GetAttribute("Hiding") == true and Character:FindFirstChild("Collision") then return end
        if PrimaryPart.Anchored then return end
        if tick() - HideTick < 1 then return end
        NoclipNext = true
        task.wait(0.1)
        Character:PivotTo(CFrame.new(Humanoid.MoveDirection * 100000 * -1))
        Character:GetPropertyChangedSignal("WorldPivot"):Wait()
        task.wait(0.1)
        NoclipNext = false
    end)
    Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
        if ClosetExitFix and Character:FindFirstChild("Collision") and Character:GetAttribute("Hiding") == true and tick() - HideTick > 1 then
            CamLock:FireServer()
        end
    end)
    Main_Game.PromptService.Highlight:Destroy()
end
ApplyCharacter(true)
ApplyCustoms(true)
LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    Character:WaitForChild("Collision").CanCollide = not Noclip
    PrimaryPart = Character.PrimaryPart
    PrimaryPart.CanCollide = not Noclip
    MainUI = LocalPlayer.PlayerGui.MainUI
    Main_Game = MainUI.Initiator.Main_Game
    MainFrame = MainUI.MainFrame
    ApplySpeed(true)
    ApplyCustoms()
    ApplyCharacter()
end)
workspace.DescendantAdded:Connect(ApplySettings)
workspace.ChildRemoved:Connect(function(Object)
    if Object.Name == "Eyes" then
        if not workspace:FindFirstChild("Eyes") then
            EyesOnMap = false
        end
    end
end)
EntityInfo.Screech.OnClientEvent:Connect(function()
    if not table.find(ScreechSafeRooms, tostring(LocalPlayer:GetAttribute("CurrentRoom"))) and CurrentRooms[LocalPlayer:GetAttribute("CurrentRoom")]:GetAttribute("Ambient") == Color3.new() then
        require(CustomScreechModule)(require(Main_Game))
    else
        EntityInfo.Screech:FireServer(true)
    end
end)
EntityInfo.SpiderJumpscare.OnClientEvent:Connect(function(...)
    local Args = {...}
    if not DisableTimothy then
        task.spawn(function()
            require(CustomTimothyModule)(table.unpack(Args))
        end)
    end
end)
	

RightGroupbox2:AddToggle('MyToggle', {
    Text = 'Bypass Halt',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    _G.NoHalt = val
    end
})
	
RightGroupbox2:AddToggle('MyToggle', {
    Text = 'Disable Seek Arms & Fire',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.noseekarmsfire = val
	end
})
        
RightGroupbox2:AddToggle('MyToggle', {
    Text = 'Always Win Heartbeat Minigame',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.heartbeatwin = val
		end
})

RightGroupbox2:AddToggle('MyToggle', {
    Text = 'Anti-Dupe',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    _G.Fake_Hitbox = val

        while wait() and _G.Fake_Hitbox == true do
            for i, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "Closet" then
                    local Hitbox = v:FindFirstChild("Hitbox")
            
                    Hitbox.CanTouch = false
                end
            end
        end
    end
})
								
RightGroupbox2:AddToggle('MyToggle', {
    Text = 'Anti-Glitch',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    DisableGlitch = val
end
})

RightGroupbox2:AddToggle('Enable', {
    Text = 'Anti-Snare',
    Default = false,

    Callback = function(Value)
        _G.Snare_Hitbox = Value

        while wait() and _G.Snare_Hitbox == true do
            for i, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "Snare" then
                    local Hitbox = v:FindFirstChild("Hitbox")
            
                    Hitbox.CanTouch = false
                end
            end
        end
    end
})
	
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.NoHalt then
        game:GetService("ReplicatedStorage").ClientModules.EntityModules.Shade:remove()
        end
        end)
        end)
        
RightGroupbox3:AddToggle('MyToggle', {
    Text = 'Remove Gate',
    Default = false,
    Tooltip = '',

    Callback = function(val)
    flags.nogates = val

		if val then
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

			repeat task.wait() until BOBHUBLOADED == false or not flags.nogates
			addconnect:Disconnect()
		end
	end
})

RightGroupbox3:AddToggle('MyToggle', {
    Text = 'A-000 Door No Locks',
    Default = false,
    Tooltip = '',

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

			repeat task.wait() until BOBHUBLOADED == false or not flags.roomsnolock
			addconnect:Disconnect()
		end
	end
})
    
    RightGroupbox3:AddToggle('MyToggle', {
    Text = 'Remove Skeleton Door',
    Default = false,
    Tooltip = '',

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

			repeat task.wait() until BOBHUBLOADED == false or not flags.noskeledoors
			addconnect:Disconnect()
		end
	end
})

RightGroupbox3:AddToggle('MyToggle', {
    Text = 'Remove Puzzle Door',
    Default = false,
    Tooltip = '',

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

			repeat task.wait() until BOBHUBLOADED == false or not flags.nopuzzle
			addconnect:Disconnect()
		end
	end
})

local LeftGroupBox4 = Tabs.Credits:AddLeftGroupbox('Credits')

LeftGroupBox4:AddLabel('Scripter :')
LeftGroupBox4:AddLabel('Hunter And Yieviro92 (BIG SHOUTOUT)')

LeftGroupBox4:AddLabel('Youtube')

local MyButton = LeftGroupBox4:AddButton({
    Text = 'yieviro92',
    Func = function()
        if setclipboard then 
            setclipboard("youtube.com/@yieviro92creepy")   
        end
    end,
    DoubleClick = false,
    Tooltip = ''
})

local MyButton = LeftGroupBox4:AddButton({
    Text = 'Hunter',
    Func = function()
        if setclipboard then 
            setclipboard("https://youtube.com/@SirotanAndEthan")   
        end
    end,
    DoubleClick = false,
    Tooltip = ''
})

LeftGroupBox4:AddLabel('Discord')

local MyButton = LeftGroupBox4:AddButton({
    Text = 'yieviro92',
    Func = function()
        if setclipboard then 
            setclipboard("yieviro92")   
        end
    end,
    DoubleClick = false,
    Tooltip = ''
})

local MyButton = LeftGroupBox4:AddButton({
    Text = 'Hunter',
    Func = function()
        if setclipboard then 
            setclipboard("mrkillinghunter_")   
        end
    end,
    DoubleClick = false,
    Tooltip = ''
})



Library:SetWatermarkVisibility(true)

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

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('UI Settings')

local MyButton = LeftGroupBox4:AddButton({
    Text = 'Hunter',
    Func = function()
        if setclipboard then 
            setclipboard("mrkillinghunter_")   
        end
    end,
    DoubleClick = false,
    Tooltip = ''
})

MenuGroup:AddLabel('UI Toggle Keybind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'UI Toggle Keybind' })
	
Library.ToggleKeybind = Options.MenuKeybind

-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

ThemeManager:SetFolder('Hunter Library')
SaveManager:SetFolder('Hunter Library/specific-game')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()
