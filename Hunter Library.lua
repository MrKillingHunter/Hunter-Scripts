local games = {
    [{6839171747}] = "https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/Hunter%20Library%20Assets/Doors.lua",
    
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    else
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/MrKillingHunter/Hunter-Scripts/main/Hunter%20Library%20Assets/Universal.lua"),true))()
        break
    end
end
