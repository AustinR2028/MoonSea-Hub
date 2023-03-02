local search = nil
local ws = nil
local jp = nil
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "MoonSea Hub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Serika,
    Link = "https://github.com/deeeity/mercury-lib"
}

local Universal = GUI:Tab{
	Name = "Universal",
	Icon = "rbxassetid://12653882397"
}

Universal:Slider{
	Name = "Speed",
	Default = 16,
	Min = 16,
	Max = 300,
	Callback = function(value) 
	  ws = value
	end
}

Universal:Slider{
	Name = "Jump",
	Default = 50,
	Min = 50,
	Max = 500,
	Callback = function(value) 
	  jp = value
	end
}

Universal:Toggle{
	Name = "Boosts Enabled",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
	print(state)
	if state == true then
	  local plr = game:getService("Players").LocalPlayer
	  local char = plr.character
	  local hum = char.Humanoid
	  hum.WalkSpeed = ws
	  hum.JumpPower = jp
	else 
	  local plr = game:getService("Players").LocalPlayer
	  local char = plr.character
	  local hum = char.Humanoid
	  hum.WalkSpeed = 16
	  hum.JumpPower = 50
	end
	end
}

local Counter = GUI:Tab{
	Name = "Item Counter",
	Icon = "rbxassetid://12653847171"
}

Counter:Textbox{
	Name = "Counted Item",
	Description = "The item you want to count, Exact name in your toolbar",
	Callback = function(text) search = text end
}

Counter:Button{
	Name = "Remove Tool Decal",
	Description = "Remove the icon over an item to reveal the name, May not work",
	Callback = function() 
	local plr = game:getService("Players").LocalPlayer
	local backpack = plr.Backpack
	local Items = backpack:getChildren()
	local Tools = table.getn(Items)
	local num = 0
	while num ~= Tools do
	num = num+1
 	 local focus = Items[num].TextureId
	  focus = nil
	end
	end
}

Counter:Button{
	Name = "Count Tool Instances",
	Description = "Counts the item under counted item",
	Callback = function() 
	local plr = game:getService("Players").LocalPlayer
	local backpack = plr.Backpack
	local Items = backpack:getChildren()
	local Tools = table.getn(Items)
	local num = 0
	local found = 0
	while num ~= Tools do
 	 num = num+1
	  local focus = Items[num].Name
	  if focus == search then
 	   found = found+1
 	 end
	end
	print(found)
	end
}
