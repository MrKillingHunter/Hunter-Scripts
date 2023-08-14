
-- Instances:

local Bloxburg_GUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Gamepasses = Instance.new("TextButton")
local Skills = Instance.new("TextButton")
local Info = Instance.new("TextLabel")
local CLOSE = Instance.new("TextButton")
local Credit = Instance.new("TextLabel")

--Properties:

Bloxburg_GUI.Name = "Bloxburg_GUI"
Bloxburg_GUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Bloxburg_GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Bloxburg_GUI
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.500
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.925454557, 0, 0.499393195, 0)
Frame.Size = UDim2.new(0, 210, 0, 222)

Frame_2.Parent = Frame
Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BackgroundTransparency = 0.500
Frame_2.Position = UDim2.new(0.499221087, 0, 0.499458939, 0)
Frame_2.Size = UDim2.new(0, 192, 0, 202)

Gamepasses.Name = "Gamepasses"
Gamepasses.Parent = Frame_2
Gamepasses.AnchorPoint = Vector2.new(0.5, 0.5)
Gamepasses.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Gamepasses.BackgroundTransparency = 0.700
Gamepasses.BorderColor3 = Color3.fromRGB(107, 107, 107)
Gamepasses.BorderSizePixel = 4
Gamepasses.Position = UDim2.new(0.497575104, 0, 0.212871283, 0)
Gamepasses.Size = UDim2.new(0, 175, 0, 42)
Gamepasses.Font = Enum.Font.TitilliumWeb
Gamepasses.Text = "Get All Gamepasses"
Gamepasses.TextColor3 = Color3.fromRGB(255, 255, 255)
Gamepasses.TextSize = 17.000
Gamepasses.TextStrokeColor3 = Color3.fromRGB(135, 135, 135)
Gamepasses.TextTransparency = 0.200
Gamepasses.TextWrapped = true

Skills.Name = "Skills"
Skills.Parent = Frame_2
Skills.AnchorPoint = Vector2.new(0.5, 0.5)
Skills.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Skills.BackgroundTransparency = 0.700
Skills.BorderColor3 = Color3.fromRGB(107, 107, 107)
Skills.BorderSizePixel = 4
Skills.Position = UDim2.new(0.492366761, 0, 0.50000006, 0)
Skills.Size = UDim2.new(0, 175, 0, 42)
Skills.Font = Enum.Font.TitilliumWeb
Skills.Text = "Max Skills"
Skills.TextColor3 = Color3.fromRGB(255, 255, 255)
Skills.TextSize = 17.000
Skills.TextStrokeColor3 = Color3.fromRGB(135, 135, 135)
Skills.TextTransparency = 0.200
Skills.TextWrapped = true

Info.Name = "Info"
Info.Parent = Frame_2
Info.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Info.BackgroundTransparency = 0.700
Info.BorderColor3 = Color3.fromRGB(107, 107, 107)
Info.BorderSizePixel = 5
Info.Position = UDim2.new(0.0446683578, 0, 0.663366318, 0)
Info.Size = UDim2.new(0, 175, 0, 60)
Info.Font = Enum.Font.SourceSansSemibold
Info.Text = "This will give you all gamepasses but Premium doesn't work and Radio is only client sided. Everything else works fine."
Info.TextColor3 = Color3.fromRGB(145, 145, 145)
Info.TextSize = 13.000
Info.TextWrapped = true
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.TextYAlignment = Enum.TextYAlignment.Top

CLOSE.Name = "CLOSE"
CLOSE.Parent = Frame
CLOSE.AnchorPoint = Vector2.new(0.5, 0.5)
CLOSE.BackgroundColor3 = Color3.fromRGB(127, 10, 0)
CLOSE.BackgroundTransparency = 0.400
CLOSE.BorderColor3 = Color3.fromRGB(75, 0, 0)
CLOSE.BorderSizePixel = 0
CLOSE.Position = UDim2.new(0.49695614, 0, -0.0953107178, 0)
CLOSE.Size = UDim2.new(0, 209, 0, 25)
CLOSE.Font = Enum.Font.RobotoMono
CLOSE.Text = "CLOSE"
CLOSE.TextColor3 = Color3.fromRGB(255, 255, 255)
CLOSE.TextSize = 14.000

Credit.Name = "Credit"
Credit.Parent = Frame
Credit.AnchorPoint = Vector2.new(0.5, 0.5)
Credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credit.BackgroundTransparency = 1.000
Credit.Position = UDim2.new(0.371354342, 0, 1.15942347, 0)
Credit.Size = UDim2.new(0, 157, 0, 49)
Credit.Font = Enum.Font.Sarpanch
Credit.Text = "Credit to 0 x 3 7 -                Join his discord server discord.gg/cdUyBMe"
Credit.TextColor3 = Color3.fromRGB(0, 0, 0)
Credit.TextSize = 16.000
Credit.TextWrapped = true
Credit.TextXAlignment = Enum.TextXAlignment.Left
Credit.TextYAlignment = Enum.TextYAlignment.Top

-- Scripts:

local function CVYOO_fake_script() -- Gamepasses.LocalScript 
	local script = Instance.new('LocalScript', Gamepasses)

	script.Parent.MouseButton1Down:Connect(function()
		for i,v in pairs(game:service'ReplicatedStorage'.Stats[game:service'Players'.LocalPlayer.Name].Gamepasses:GetChildren()) do
			v.Value = true
		end
	end)
end
coroutine.wrap(CVYOO_fake_script)()
local function NROB_fake_script() -- Skills.LocalScript 
	local script = Instance.new('LocalScript', Skills)

	script.Parent.MouseButton1Down:Connect(function()
		for i,v in pairs(game:service'ReplicatedStorage'.Stats[game:service'Players'.LocalPlayer.Name].SkillData:GetChildren()) do
			v.Value = 10
		end
	end)
end
coroutine.wrap(NROB_fake_script)()
local function JJVV_fake_script() -- CLOSE.LocalScript 
	local script = Instance.new('LocalScript', CLOSE)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(JJVV_fake_script)()
