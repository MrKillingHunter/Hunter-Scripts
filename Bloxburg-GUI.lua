wt = 0.6
Workstations = game.Workspace.PizzaPlanet.BakerWorkstations

--Rename--
for i, v in pairs(Workstations:GetChildren()) do
if v.Name == "Workstation" then
v.Name = v.Name..i
end
end
--End-- We will only use Workstaion 4... it will make it so much easier

--Idendify Remotes--
number = 0
for i, v in pairs(game.ReplicatedStorage.Modules.DataManager:GetChildren()) do
if v:IsA("RemoteEvent") then
number = number + 1
if number == 10 then
FO = v--Finish Order
elseif number == 17 then
GC = v--Get Crate
elseif number == 18 then
RF = v--Refill
end
end
end
--End--

--Positions--
pos = {{1158.62, 17, 265.31}, {1168.72, 14, 262.29}, {1177.12, 17, 259.78}}
--Done Positions--

--Function For Teleporting--
function teleport(posi)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posi[1], posi[2], posi[3])
end
--Finish For Teleporting--

--Function Take Crate--
function TC()
Crate = {["Object"] = game.Workspace.PizzaPlanet.IngredientCrates.Crate}
GC:FireServer(Crate)
end
--End Of Function

--Function Refill Station--
function RS(S)
Station = {["Workstation"] = Workstations[S]}
RF:FireServer(Station)
end
--End Of Function--

--Function Finish Order
function Finish(Tp, S)
--Get Type--
if Tp == "Cheese Pizza" then
tpy = false
elseif Tp == "Pepperoni Pizza" then
tpy = "Pepperoni"
elseif Tp == "Vegetable Pizza" then
tpy = "Vegetable"
elseif Tp == "Ham Pizza" then
tpy = "Ham"
end
wait()
--End Of Types--
StationOrder = {["Order"] = {[1] = true, [2] = true, [3] = true, [4] = tpy}, ["Workstation"] = Workstations[S]}
FO:FireServer(StationOrder)
end
--End--

game.Players.LocalPlayer.Chatted:connect(function(msg)
if msg == "Stop" then
a = false
elseif msg == "Start" then
start()
end
end)

function start()
a = true
repeat
wait(wt)
teleport(pos[1])
wait(wt)
TC()
wait(wt)
teleport(pos[2])
wait(wt)
teleport(pos[3])
wait(wt)
RS("Workstation4")
wait(wt)
for i = 1, 10 do
Finish(Workstations["Workstation4"].OrderDisplay.DisplayMain.BakerGUI.Frame.TitleLabel.Text, "Workstation4")
wait(wt + 0.2)
end
teleport(pos[2])
until a == false
end
start()
