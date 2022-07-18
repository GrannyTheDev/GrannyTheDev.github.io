local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/Shit.lua"))()

   local Gui = Library:CreateWindow("GrannyHub".." - Mad City")

   local AutoFarm = Gui:Page("AutoFarm")

   local LocalPlayer = Gui:Page("LocalPlayer")

   local Vehicle = Gui:Page("Vehicle")

   local Teleport = Gui:Page("Teleport")

   local Misc = Gui:Page("Misc")

   local Players = game.Players.LocalPlayer

local filename = "GrannyHub/MadCity - 1224212277/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
antiafk = false;
infyield = false;
carspeed = false;
walkwater = false;
autorob = false;
levelfarm = false;
infammo = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("GrannyHub");
makefolder("GrannyHub/MadCity - 1224212277");
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
        return oldnewindex(a, b, 100)
    end
    return oldnewindex(a, b, c)
end)
     
while wait() do
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
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

function doCarSpeed()
spawn(function()
if getgenv().Settings.carspeed == true then
for i,v in pairs(getgc(true)) do
if type(v) == 'table' then
if rawget(v, 'MaxSpeed') then
v.MaxSpeed=1000
end end end
end
end)
end

function doWalkWater()
spawn(function()
if getgenv().Settings.walkwater == true then
for i,v in pairs(game.Workspace.Water:GetChildren()) do
v.CanCollide = true
end
end
end)
end

function doAutoRob()
spawn(function()
if getgenv().Settings.autorob == true then
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Parent = nil
for i,v in pairs(getnilinstances()) do 
   if v.Name == "HumanoidRootPart" then
       v.Parent = game.Players.LocalPlayer.Character
   end
end
        
function RobStores()
     for _,v in pairs(game:GetService("Workspace").ObjectSelection:GetDescendants()) do 
        if v:IsA("Part") and v.Name == "SmashCash" then 
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame 
            wait()
            v.SmashCash.Event:FireServer()
        elseif v:IsA("MeshPart") and v.Name == "Cash" then 
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame 
            wait()
            v.Cash.Event:FireServer()
        elseif v:IsA("Part") and v.Name == "StealTV" then 
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame 
            wait()
            v.StealTV.Event:FireServer()
        elseif v:IsA("Part") and v.Name == "Steal" then 
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame 
            wait()
            v.Steal.Event:FireServer()
        elseif v:IsA("Part") and v.Name == "ATM" then 
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame 
            wait()
            v.ATM.Event:FireServer()
        end
     end
end



RobStores()


spawn(function()
    wait(6)
     local x = {}
     for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
     if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
     x[#x + 1] = v.id
     end
     end
     if #x > 0 then
     game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
     else 
     game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
     end
  end)
end
end)
end

function doLevelFarm()
spawn(function()
if getgenv().Settings.levelfarm == true then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Cesare0328/my-scripts/main/XP-FARM-1MIN.lua"))()
end
end)
end

function doInfAmmo()
spawn(function()
if getgenv().Settings.infammo == true then
    local function main(v)
        if v.Name == "RifleScript" or v.Name == "ShotgunScript" or v.Name == "PistolScript" or v.Name == "TazerScript" or v.Name == "PowerScript" then
            local a = getsenv(v)
            if debug.getupvalues(a.Reload) then
                debug.setupvalue(a.Reload, 3, math.huge)
            end
        end
     end
     while wait() do
     for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do main(v) end
     for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do main(v) end
    end
end
end)
end

local carspeed = Vehicle:Toggle("Vehicle Speed", function(v)
getgenv().Settings.carspeed = v
Save()
if v then
doCarSpeed()
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

local walkwater = LocalPlayer:Toggle("Walk on Water", function(v)
getgenv().Settings.walkwater = v
Save()
if v then
doWalkWater()
end
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

local autorob = AutoFarm:Toggle("Auto Rob", function(v)
getgenv().Settings.autorob = v
Save()
if v then
doAutoRob()
end
end)

local levelfarm = AutoFarm:Toggle("Level Farm", function(v)
getgenv().Settings.levelfarm = v
Save()
if v then
doLevelFarm()
end
end)

local infammo = AutoFarm:Toggle("Inf Ammo", function(v)
getgenv().Settings.infammo = v
Save()
if v then
doInfAmmo()
end
end)

Teleport:Button("Crim Base", function()
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3), {CFrame = CFrame.new(2086, 26, 426)}):Play()
    wait(6)
end)

Teleport:Label("↓All Teams↓")

Teleport:Button("Gun Shop", function()
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(8), {CFrame = CFrame.new(-1641, 43, 686)}):Play()
    wait(8)
end)

Teleport:Button("Airport", function()
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(8), {CFrame = CFrame.new(-2196, 31, -1430)}):Play()
    wait(8)
end)

Teleport:Button("Prison", function()
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(8), {CFrame = CFrame.new(-892, 67, -3132)}):Play()
    wait(8)
end)

Teleport:Label("↓Police only↓")

Teleport:Button("Police Station One", function()
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3), {CFrame = CFrame.new(-900, 69, -3069)}):Play()
    wait(6)
end)

Teleport:Button("Police Station Two", function()
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3), {CFrame = CFrame.new(-1035, 67, -3033)}):Play()
    wait(6)
end)

Teleport:Label("↓Hero only↓")

Teleport:Button("Hero Base", function()
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3), {CFrame = CFrame.new(-826, 346, 813)}):Play()
    wait(6)
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
if getgenv().Settings.carspeed == true then
carspeed:ChangeState(true)
end
if getgenv().Settings.walkwater == true then
walkwater:ChangeState(true)
end
if getgenv().Settings.autorob == true then
autorob:ChangeState(true)
end
if getgenv().Settings.levelfarm == true then
levelfarm:ChangeState(true)
end
if getgenv().Settings.infammo == true then
infammo:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end