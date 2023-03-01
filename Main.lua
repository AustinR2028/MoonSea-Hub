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
	Callback = function(text) end
}

Counter:Button{
	Name = "Remove Tool Decal",
	Description = "Remove the icon over an item to reveal the name",
	Callback = function()
	    local plr = game:getService("Players").LocalPlayer
		local backpack = plr.Backpack
		local Items = backpack:getChildren()
		local Tools = table.getn(Items)
		local num = 0
		while num ~= Tools do
			num = num+1
			local focus = Tools[num].TextureId
			focus = nil
		end
	    end
}
