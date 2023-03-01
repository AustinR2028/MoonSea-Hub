local search = nil
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "MoonSea Hub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Serika,
    Link = "https://github.com/deeeity/mercury-lib"
}

local Counter = GUI:Tab{
	Name = "Item Counter",
	Icon = "rbxassetid://8569322835"
}

Counter:Textbox{
	Name = "Counted Item",
	Description = "The item you want to count, Exact name in your toolbar",
	Callback = function(text) search = text end
}

Counter:Button{
	Name = "Remove Tool Decal",
	Description = "Remove the icon over an item to reveal the name",
	Callback = function() 
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AustinR2028/MoonSea-Hub/main/Buttons/sub.lua"))()
	end
}

Counter:Button{
	Name = "Count Tool Instances",
	Description = "Remove the icon over an item to reveal the name, May not work",
	Callback = function() 
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AustinR2028/MoonSea-Hub/main/Buttons/counter.lua"))()
	end
}
