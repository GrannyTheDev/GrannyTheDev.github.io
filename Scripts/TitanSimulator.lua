local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Titan Simulator")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local filename = "GrannyHub/TitanSimulator - 1122519450/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
rebirth = false;
punch = false;
swing =  false;
equippunch = false;
equipsword = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("GrannyHub");
makefolder("GrannyHub/TitanSimulator - 1122519450");
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
local oldnewindex
oldnewindex = hookmetamethod(game, "__newindex", function(a, b, c)
if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" then
return oldnewindex(a, b, 800)
end
return oldnewindex(a, b, c)
end)
while wait() do
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 800
        end
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

function doRebirth()
spawn(function()
while getgenv().Settings.rebirth == true do
game.ReplicatedStorage.RemoteEventContainer.Rebirth:FireServer()
wait(0.1)
end
end)
end

function doPunch()
spawn(function()
while getgenv().Settings.punch == true do
game.Players.LocalPlayer.Character:WaitForChild("Punch"):Activate()
wait()
end
end)
end

function doSwing()
spawn(function()
while getgenv().Settings.swing == true do
game.Players.LocalPlayer.Character:WaitForChild("Demon Sword"):Activate()
wait()
end
end)
end

function doEquipPunch()
spawn(function()
while getgenv().Settings.equippunch == true do
    local Players = game:GetService("Players")
		local player = Players:FindFirstChildOfClass("Player")
		if player and player.Character then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local tool = Players.LocalPlayer.Backpack:FindFirstChild("Punch")
				if tool then
					humanoid:EquipTool(tool)
				end
			end
		end
wait()
end
end)
end

function doEquipSword()
spawn(function()
while getgenv().Settings.equipsword == true do
    local Players = game:GetService("Players")
		local player = Players:FindFirstChildOfClass("Player")
		if player and player.Character then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local tool = Players.LocalPlayer.Backpack:FindFirstChild("Demon Sword")
				if tool then
					humanoid:EquipTool(tool)
				end
			end
		end
wait()
end
end)
end

local rebirth = AutoFarm:Toggle("Auto Rebirth", function(v)
getgenv().Settings.rebirth = v
Save()
if v then
doRebirth()
end
end)

local punch = AutoFarm:Toggle("Auto Punch", function(v)
getgenv().Settings.punch = v
Save()
if v then
doPunch()
end
end)

local swing = AutoFarm:Toggle("Auto DemonSword", function(v)
getgenv().Settings.swing = v
Save()
if v then
doSwing()
end
end)

local equippunch = AutoFarm:Toggle("Auto Equip Punch", function(v)
getgenv().Settings.equippunch = v
Save()
if v then
doEquipPunch()
end
end)

local equipsword = AutoFarm:Toggle("Auto Equip Demon Sword", function(v)
getgenv().Settings.equipsword = v
Save()
if v then
doEquipSword()
end
end)

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

LocalPlayer:Toggle("Noclip", function(v)
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer

			if v then
Stepped = game:GetService("RunService").Stepped:Connect(function()
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end)
			else
				Stepped:Disconnect()
end
end)

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
if getgenv().Settings.rebirth == true then
rebirth:ChangeState(true)
end
if getgenv().Settings.punch == true then
punch:ChangeState(true)
end
if getgenv().Settings.swing == true then
swing:ChangeState(true)
end
if getgenv().Settings.equippunch == true then
equippunch:ChangeState(true)
end
if getgenv().Settings.equipsword == true then
equipsword:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
  print(i,v)
end