local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yuzixser-Script/Function/main/Vynixus_SpawnV2.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Barrage",
		Asset = "rbxassetid://13396010379",
		HeightOffset = 1
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 5
		},
		Shatter = false,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 50,
		Values = {6.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 120,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush",
		Min = 1,
		Max = 5,
		Delay = 2.5
	},
	Damage = {
		Enabled = true,
		Range = 90,
		Amount = 0.01
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = true,
		Break = true
	},
	Death = {
		Type = "Curious",
		Hints = {"You die to Barrage", "...", "...", "..."},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    game.Workspace.CurrentRooms:GetChildren()[#game.Workspace.CurrentRooms:GetChildren() - 1]:SetAttribute("Ambient",Color3.new(1, 1, 0))
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
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
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
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
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "A Barrage Of Attacks",
    Desc = "Watch out, me and the boys coming through!",
    Reason = "Survive Barrage and its Clones.",
    Image = GitPNG("https://github.com/Script5039392/Png/blob/main/Barrage_Badge.png?raw=true", "smilerbalge")
})
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(1000)
		game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Barrage"
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()

-- Faces 
coroutine.wrap(function()

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

game.Workspace.Barrage.RushNew.Attachment.ParticleEmitter.Texture = GitPNG("https://github.com/Script5039392/Png/blob/main/Barrage_V3.png?raw=true", "Barrage")

end)()
