	local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/Shit.lua"))()

	local Gui = Library:CreateWindow("GrannyHub -".." Area51Haxx")

	local LocalPlayer = Gui:Page("LocalPlayer")
  
  local Teleport = Gui:Page("Teleport")

	local Guns = Gui:Page("Guns")

	local Misc = Gui:Page("Misc")

	local Coodinates = {
    Location = {
			["Spawn"] = CFrame.new(352, 511, 374),
			["ZombieMorph"] = CFrame.new(401, 513, 392),
			["Leaderboard"] = CFrame.new(303, 511, 370),
			["PackAPunch"] = CFrame.new(275, 323, 788),
			["Teleporter"] = CFrame.new(116, 315, 48),
			["Leaderboard"] = CFrame.new(303, 511, 376)
		},
		World = {
			["MainMenu"] = 155382109,
			["ClassicMode"] = 2092166489,
			["KillerMode"] = 2092167559,
			["JuggernautMode"] = 4678052190,
			["EndlessSurvival"] = 2675280735,
			["BossRushMode"] = 6054929905,
			["Area51Storming"] = 3508248007,
			["KillHouse"] = 4631179692
		}
	}

function tp(pos)
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

local filename = "GrannyHub/Area51Haxx - 155382109/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
gunmods = false;
shiftlock = false;
equipmorph = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("GrannyHub");
makefolder("GrannyHub/Area51Haxx - 155382109");
writefile(filename, json);
end
end

function Load()
local HttpService = game:GetService("HttpService")
if (readfile and isfile and isfile(filename)) then
getgenv().Settings = HttpService:JSONDecode(readfile(filename));
end
end

function doSpeed()
spawn(function()
if getgenv().Settings.speed == true then
        local gmt = getrawmetatable(game)
		setreadonly(gmt, false)
		local oldindex = gmt.__index
		gmt.__index = newcclosure(function(self,b)
			if b == "WalkSpeed" then
				return 16
			end
			return oldindex(self,b)
		end)

		while wait() do
			game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
		end

		getgenv().walkspeed = 100

		local oldnewindex
		oldnewindex = hookmetamethod(game, "__newindex", function(a, b, c)
			if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" then
				return oldnewindex(a, b, getgenv().walkspeed)
			end
			return oldnewindex(a, b, c)
		end)
end
end)
end

function doJump()
spawn(function()
if getgenv().Settings.jump == true then
game:GetService("UserInputService").JumpRequest:connect(function()
game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
end)
end
end)
end

function doInfYield()
spawn(function()
if getgenv().Settings.infyield == true then
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end
end)
end

function doAntiAfk()
spawn(function()
if getgenv().Settings.antiafk == true then
loadstring(game:HttpGet('https://pastebin.com/raw/KHZ8pYx9'))()
end
end)
end

function doShiftLock()
spawn(function()
if getgenv().Settings.shiftlock == true then
game:GetService('Players').LocalPlayer.DevEnableMouseLock = true
end
end)
end

function doEquipMorph()
	spawn(function()
	while getgenv().Settings.equipmorph == true do
		firetouchinterest(game:GetService("Workspace").AREA51.Outside.Hangar.Right["Zombie Morph"].TheButton, game.Players.LocalPlayer.Character.Head, 1)
		wait(0.1)
		firetouchinterest(game:GetService("Workspace").AREA51.Outside.Hangar.Right["Zombie Morph"].TheButton, game.Players.LocalPlayer.Character.Head, 0)
	wait(0.1)
	end
	end)
	end

function doGunMods()
spawn(function()
while getgenv().Settings.gunmods == true do
		for i,v in pairs(getgc(true)) do
			if type(v) == 'table' then
				if rawget(v, 'stored_ammo') then
					v.ammo=math.huge
					v.stored_ammo=math.huge
					v.is_auto=true
					v.shoot_wait=0
					v.bullet_count=10
					v.inaccuracy=0
				end end end
wait(1)
end
end)
end

local speed = LocalPlayer:Toggle("WalkSpeed", function(v)
getgenv().Settings.speed = v
Save()
if v then
doSpeed()
end
end)

local jump = LocalPlayer:Toggle("Infinite Jump", function(v)
getgenv().Settings.jump = v
Save()
if v then
doJump()
end
end)

local shiftlock = LocalPlayer:Toggle("Shift Lock", function(v)
getgenv().Settings.shiftlock = v
Save()
if v then
doShiftLock()
end
end)

local equipmorph = LocalPlayer:Toggle("Equip Zombie Morph", function(v)
getgenv().Settings.equipmorph = v
Save()
if v then
doEquipMorph()
end
end)

Guns:Button("Get Guns", function()
		    for _,v in pairs(game:GetService("Workspace").Weapons:GetChildren()) do
			    firetouchinterest(v.Hitbox, game.Players.LocalPlayer.Character.Head, 1)
			    wait()
			    firetouchinterest(v.Hitbox, game.Players.LocalPlayer.Character.Head, 0)
	        end
	end)

	local gunmods = Guns:Toggle("Mod Guns", function(v)
getgenv().Settings.gunmods = v
Save()
if v then
doGunMods()
end
end)

Teleport:Button("Teleport to Spawn", function()
    tp(Coodinates.Location.Spawn)
  end)

Teleport:Button("Teleport to Zombie Morph", function()
    tp(Coodinates.Location.ZombieMorph)
  end)

Teleport:Button("Teleport to the Leaderboard", function()
    tp(Coodinates.Location.Leaderboard)
  end)

Teleport:Button("Teleport to PackAPunch", function()
    tp(Coodinates.Location.PackAPunch)
  end)

Teleport:Button("Teleport to the Teleporter", function()
    tp(Coodinates.Location.Teleporter)
  end)

  Teleport:Button("Teleport to the Leaderboard", function()
    tp(Coodinates.Location.Leaderboard)
  end)

local NoclipBtn = LocalPlayer:Toggle("Noclip", function(v)
    local Workspace = game:GetService("Workspace")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local Plr = Players.LocalPlayer
    
                if v == true then
    Stepped = game:GetService("RunService").Stepped:Connect(function()
                    for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                    v.CanCollide = false
                    end end end)
                elseif v == false then
                    Stepped:Disconnect()
    end
    end)

    NoclipBtn:Keybind(Enum.KeyCode.LeftAlt)

Misc:Button("Rejoin", function()
     game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

local infyield = Misc:Toggle("Infinite Yield", function(v)
getgenv().Settings.infyield = v
Save()
if v then
doInfYield()
end
end)

local antiafk = Misc:Toggle("Anti Afk", function(v)
getgenv().Settings.antiafk = v
Save()
if v then
doAntiAfk()
end
end)

Load()
if getgenv().Settings.speed == true then
speed:ChangeState(true)
end
if getgenv().Settings.jump == true then
jump:ChangeState(true)
end
if getgenv().Settings.infyield == true then
infyield:ChangeState(true)
end
if getgenv().Settings.antiafk == true then
antiafk:ChangeState(true)
end
if getgenv().Settings.gunmods == true then
gunmods:ChangeState(true)
end
if getgenv().Settings.shiftlock == true then
shiftlock:ChangeState(true)
end
if getgenv().Settings.equipmorph == true then
equipmorph:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end