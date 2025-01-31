---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Savage Smiler",
		Asset = "rbxassetid://12645075460",
		HeightOffset = 2
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 50
		},
		Shatter = false,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 50,
		Values = {6.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 460,
		Delay = 6,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush",
		Min = 3,
		Max = 5,
		Delay = 0.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 0.01
	},
	Crucifixion = {
		Enabled = false,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding",
		Hints = {"Death", "Hints", "Go", "Here"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    game.Players.LocalPlayer:WaitForChild("PlayerGui").MainUI.MainFrame.Caption.TextColor3 = Color3.fromRGB(255, 0, 0)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Hiding Or Death",true)
    wait(3)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Running And Hide",true)
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("...",true)
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
    function GitPNG(GithubImg, ImageName)
    local url = GithubImg
    if not isfile(ImageName .. ".png") then
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)

        if success then
            writefile(ImageName .. ".png", response)
        else
            error(": " .. response)
        end
    end
    return (getcustomasset or getsynasset)(ImageName .. ".png")
end

    ---====== Load achievement giver ======---
local aaa = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
aaa({
    Title = "Smile Because You Are Dead",
    Desc = "Savage Smiler The Hell",
    Reason = "Survive The Savage Smiler",
    Image = GitPNG("https://github.com/Script5039392/Png/blob/main/Smiler_(Backrooms).jpg?raw=true", "SmilerSavageBalge")
})
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
		local main_game = require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
		require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscares.Death)(main_game)
		game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.Health - 1000
game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Ṣ̌āvãģë Šmįľéř"
	end
end)

---====== Run entity ======---

entity:Run()
