---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Nightmare",
		Asset = "rbxassetid://13191021632",
		HeightOffset = 2
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = false,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 1000,
		Values = {5.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 140,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush",
		Min = 1,
		Max = 1,
		Delay = 2
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 0.001
	},
	Crucifixion = {
		Enabled = true,
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
    local Sp = Instance.new("Sound")
    local e = Instance.new("Sound")
    
	Sp.Parent = workspace.Nightmare
	e.Parent = workspace.Nightmare
	
	Sp.SoundId = "rbxassetid://5351101493"
	e.SoundId = "rbxassetid://3359047385"
	
	Sp:Play()
	e:Play()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    local Mv = Instance.new("Sound")
	Mv.Parent = workspace.Nightmare
	Mv.Name = "Moving"
	Mv.SoundId = "rbxassetid://9125714014"
	Mv.Volume = 3
	Mv:Play()
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
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
		game.Players.LocalPlayer.Character.Humanoid:TakeDamage(1000)
		game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Nightmare"
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

-- Change
coroutine.wrap(function()
while true do wait(0.5)

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

local nm = game.Workspace.Nightmare.RushNew
nm.GlitchEffect:Destroy()
nm.PlaySound:Destroy()
nm.Attachment.ParticleEmitter.Texture = GitPNG("https://github.com/Script5039392/Png/blob/main/Nightmare.png?raw=true", "Nightmare")
end
end)()

-- Create New Sound
coroutine.wrap(function()
local Static = Instance.new("Sound")
Static.Parent = workspace.Nightmare.RushNew
Static.SoundId = "rbxassetid://9077101405"
Static.Volume = 3
Static.PlaybackSpeed = 0.75
Static.MaxDistance = 250
Static.Looped = true
Static:Play()

local Static2 = Instance.new("Sound")
Static2.Parent = workspace.Nightmare.RushNew
Static2.SoundId = "rbxassetid://1244506786"
Static2.Volume = 1
Static2.MaxDistance = 350
Static2.Looped = true
Static2:Play()

end)()
