local search = nil
local ws = nil
local jp = nil
local status = nil
local jumpa = false
local mose = game.Players.LocalPlayer:GetMouse()
mose.KeyDown:connect(function(key)
    if key:byte() == 32 then
        if jumpa == true then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(3)
        end
    end
end)
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
	status = state
	end
}

Universal:Toggle{
	Name = "Infinite Jump",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
	jumpa = state
	print(jumpa)
    end
}

Universal:Button{
	Name = "Sit",
	Description = "Makes you sit",
	Callback = function() 
	local plr = game:getService("Players").LocalPlayer
    local char = plr.character
    local hum = char.Humanoid
    hum.Sit = true
	end
}

Universal:Button{
	Name = "F3x",
	Description = "F3x building tools (Client)",
	Callback = function() 
	loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
	end
}

Universal:Button{
	Name = "Teleport Tool",
	Description = "Teleports you to your mouse while holding the tool.",
	Callback = function() 
	local TpTool = Instance.new("Tool")
	TpTool.Name = "Teleport Tool"
	TpTool.RequiresHandle = false
	TpTool.Parent = game:getService("Players").LocalPlayer.Backpack
	TpTool.Activated:Connect(function()
		local Char = game:getService("Players").LocalPlayer.Character
		local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
		if not Char or not HRP then
			return warn("Failed to find HumanoidRootPart")
		end
		HRP.CFrame = CFrame.new(IYMouse.Hit.X, IYMouse.Hit.Y + 3, IYMouse.Hit.Z)
	end)
	end
}

Universal:Button{
	Name = "Credits Prompt",
	Description = "Shows a credit list",
	Callback = function()
	    GUI:Notification{
	Title = "Credits",
	Text = "@Hd19p, Creator. Infinite Yield Source, some scripts.",
	Duration = 10,
	Callback = function()
	end}
end}

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

while wait(0.05) do 
  if status == true then
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

