repeat wait() until game and game:IsLoaded()
local games = {
  [""] = { ["Link"] = "" },
	["1224212277"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/MadCity.lua"
	},
	["60100179"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/Area51Haxx.lua"
	},
	["961409234"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/BloodMoonTycoon.lua"
	},
	["3461453"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/TreasureQuest.lua"
	},
	["16170943"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/RiseoftheDead.lua"
	},
	["4484634"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/WorldZero.lua"
	},
	["606849621"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/Jailbreak.lua"
	},
	["5182200788"] = {
		["Link"] = "https://GrannyTheDev.github.io/Scripts/VehicleWeightLifting.lua"
	},
	["1953438140"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/Scripts/RoboticSimulator.lua"
	},
	["1122519450"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/Scripts/TitanSimulator.lua"
	},
    ["28382335"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/Scripts/SurvivalZombieTycoon.lua"
	},
    ["2986677229"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/Scripts/GiantHaxx.lua"
	},
	["100952125"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/Scripts/InnovationIncSpaceship.lua"
	},
	["3652625463"] = {
	    ["Link"] = "https://GrannyTheDev.github.io/Scripts/LiftingSimulator.lua"
	}
}
local pages = game:GetService"AssetService":GetGamePlacesAsync()
while wait() do
	for i, place in pairs(pages:GetCurrentPage()) do
		local gotgame = games[tostring(place.PlaceId)]
		local gotgameL = games[tostring(game.CreatorId)]
		if gotgame then
			return loadstring(game:HttpGet(gotgame.Link))()
		end
		if gotgameL then
			return loadstring(game:HttpGet(gotgameL.Link))()
		end
        if game.PlaceId == 1747207098 then
			return loadfile("DrinkHaxx.lua")()
		end
		if game.PlaceId == 6777633670 then
			return loadfile("DrinkHaxx2.lua")()
		end
	end
	if pages.IsFinished then break end
	pages:AdvanceToNextPageAsync()
end
loadstring(game:HttpGet"https://GrannyTheDev.github.io/Scripts/GameNotFound.lua")()
return true
