local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()
local togglemoney = false
local togglerebirths = false

local window = Flux:Window("Hunter Library", "Snow Plow Simulator (UI = END)", Color3.fromRGB(130, 80, 176), Enum.KeyCode.End)
local tab = window:Tab("Main", "")

tab:Toggle("Toggle Adding Snow", "Infinitely Adds Snow Until Toggle Is Off", function()
    togglemoney = true
        while togglemoney == true do
            game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-99999999999999, "1 Stick", true)
            wait(0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)
    end
end)
tab:Button("Add Snow", "Adds 1mil Snow", function()
    game:GetService("ReplicatedStorage").Shop.Events.BuyItem:FireServer(-999999999999999, "1 Stick", true)
end)
tab:Toggle("Toggle Rebirths", "Infinitely Adds Rebirths Until Toggle Is Off", function()
    togglerebirths = true
        while togglerebirths == true do
            game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
            wait(0.001)
    end
end)
tab:Button("Add Rebirths", "Adds 10k Rebirths", function()
    game:GetService("ReplicatedStorage").RebirthEvent:FireServer(10000)
end)
tab:Line()
tab:Button("Collect All Gems", "Collects All the Gems", function()
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
end)
tab:Button("Plow All Snow (READDISC)","This Is Very Laggy And Cannot be disabled",function()
    local Snow = game:GetService("Workspace").HitParts
while task.wait() do
for _,v in pairs(Snow:GetChildren()) do
if v.Name == "Snow" then
game:GetService("ReplicatedStorage").Events.HitPart:FireServer(v)
end
end
end
end)

local UISettings = window:Tab("Credits", "")
UISettings:Label("Credits")
UISettings:Label("UIs - violinsutsuki and other respective creators")
UISettings:Label("Scripting - mrkillinghunter_")
