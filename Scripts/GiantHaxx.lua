local Library = loadstring(game:HttpGet("https://GrannyTheDev.github.io/Shit.lua"))()

local Window = Library:CreateWindow("GrannyHub".." - Giant Simulator")

local AutoFarm = Window:Page("AutoFarm")

local LocalPlayer = Window:Page("LocalPlayer")

local Misc = Window:Page("Misc")

local quick = loadstring(game:HttpGet('https://raw.githubusercontent.com/Belkworks/quick/master/init.lua'))();

local s = quick.Service;

local workspace = s.Workspace;
local replicatedStorage = s.ReplicatedStorage;
local currentCamera = workspace.CurrentCamera;
local players = s.Players;
local virtualUser = s.VirtualUser;
local tweenService = s.TweenService;
local runService = s.RunService;
local stepped = runService.Stepped;

local client = players.LocalPlayer;
local character = client.Character or client.CharacterAdded:Wait();
client.CharacterAdded:Connect(function(char)
    character = char;
end);

if getconnections then
    for i = 1, #getconnections(client.Idled) do
        getconnections(client.Idled)[i]:Disable();
    end;
else
    client.Idled:Connect(function()
       virtualUser:Button2Down(Vector2.new(), currentCamera.CFrame);
       wait(1);
       virtualUser:Button2Up(Vector2.new(), currentCamera.CFrame);
    end);
end;


local function tween(obj, time, ...)
    local tween = tweenService:Create(obj, TweenInfo.new(time), ...);
    tween:Play();
    tween.Completed:Connect(function() tween:Destroy() end);
	return tween;
end;

local function getNodeFolder()
    for _, f in next, workspace.Scene:GetChildren() do
        if type(tonumber(f.Name)) == 'number' then
            return f;
        end;
    end;
end;

local function getANode()
    local d, e = math.huge;
    for _, v in next, getNodeFolder():GetChildren() do
        if (v:FindFirstChild('Prefab') and #v.Prefab:GetChildren() > 0) then
            local magnitude = client:DistanceFromCharacter(v.Position);
            
            if (magnitude <= d) then
                d = magnitude;
                e = v;
            end;
        end;
    end;
    return e;
end;

local filename = "GrannyHub/GiantHaxx - 2986677229/Config.json"

getgenv().Settings = {
speed = false;
jump = false;
infyield = false;
antiafk = false;
FarmOrbs = false;
autoclicker = false;
rebirth = false;
}

function Save()
local json;
local HttpService = game:GetService("HttpService");
if (writefile) then
json = HttpService:JSONEncode(getgenv().Settings);
makefolder("GrannyHub");
makefolder("GrannyHub/GiantHaxx - 2986677229");
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
while getgenv().Settings.speed == true do
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
wait()
end
end)
end
function doRebirth()
    spawn(function()
    while getgenv().Settings.rebirth == true do
        game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.RebirthRequest:InvokeServer()
    wait()
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

function doAutoClicker()
spawn(function()
if getgenv().Settings.autoclicker == true then
game.Players.LocalPlayer.PlayerGui.ClientData.passes["6789463"].Value = true
local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;

mt.__index = function(a, b)
if tostring(a) == "6789463" and tostring(b) == "Value" then
	return true;
end
return old_index(a, b);
end
end
end)
end
  
  local FarmObs = AutoFarm:Toggle("AutoFarm Orbs", function(v)
      getgenv().Settings.FarmOrbs = v
      Save()
  end)

  local autoclicker = AutoFarm:Toggle("Unlock AutoClicker", function(v)
      getgenv().Settings.autoclicker = v
      Save()
	  if v then
	  doAutoClicker()
	  end
  end)

  local rebirth = AutoFarm:Toggle("Auto Rebirth", function(v)
    getgenv().Settings.rebirth = v
    Save()
    if v then
        doRebirth()
    end
  end)

    AutoFarm:Toggle("Auto Kill Demon King", function(v)
	getgenv().demon = v
	while true do
	if not getgenv().demon then return end
	wait()
		for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
			if v.ClassName == "Model" and v.Name == "DemonKing" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
			end
		end
	end
  end)

    AutoFarm:Toggle("Auto Kill Borock", function(v)
	getgenv().borock = v
	while true do
	if not getgenv().borock then return end
	wait()
		for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
			if v.ClassName == "Model" and v.Name == "Borock" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
			end
		end
	end
  end)

    AutoFarm:Toggle("Auto Kill Gnomes", function(v)
	getgenv().gnome = v
	while true do
	if not getgenv().gnome then return end
	wait()
		for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
			if v.ClassName == "Model" and v.Name == "Gnome" then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
			end
		end
	end
  end)

    AutoFarm:Button("Mass Upgrade Skills", function()
	  while wait(0.1) do
	  game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.MassUpgradeSkills:InvokeServer()
	  end
  end)

  AutoFarm:Button("OP Quest", function()
	for i = 50, 250 do
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.StartQuestRequest
	Event:InvokeServer()
	wait()
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.EndQuestRequest
	Event:InvokeServer()
    end
  end)

    AutoFarm:Button("Golden Eggs", function()
	for i,v in pairs(game.Workspace:GetChildren())do
		if v.Name == "Egg" then
			v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
			end
		end
  end)
  
    pcall(function() 
    if getgenv().mainLoop then
        getgenv().mainLoop:Disconnect();
    end;
end);
getgenv().mainLoop = stepped:Connect(function()
    if not character or (character and not (character:FindFirstChild('HumanoidRootPart') and character:FindFirstChild('Humanoid'))) then return end;
    
    if getgenv().Settings.FarmOrbs then
        task.spawn(function()
            replicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer();
            wait(0.65);
            replicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer();
        end);
    
        local node = getANode();
        if node then
            tween(character.HumanoidRootPart, client:DistanceFromCharacter(node.Position) / 2500, { CFrame = node.CFrame + Vector3.new(math.random(2, 5), 1, 0) }, Enum.EasingStyle.Linear);
        end;
    end;
end);
  
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
if getgenv().Settings.FarmOrbs == true then
FarmObs:ChangeState(true)
end
if getgenv().Settings.autoclicker == true then
autoclicker:ChangeState(true)
end

for i,v in pairs(getgenv().Settings) do
print(i,v)
end
