local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()

local UI = Venyx.new("Getting Started")

local Page = UI:addPage("Main")

local Section = Page:addSection("Section")

Section:addButton({
    title = "Click Me!",
    callback = function()
        print("Clicked!")
    end
})
