local plr = game:getService("Players").LocalPlayer
local backpack = plr.Backpack
local Items = backpack:getChildren()
local Tools = table.getn(Items)
local num = 0
local found = 0
while num ~= Tools do
	num = num+1
  local focus = Tools[num].Name
  if focus.Name == search then
    found = found+1
  end
end
