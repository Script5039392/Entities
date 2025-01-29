---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Darkness",
		Asset = "rbxassetid://13040634069",
		HeightOffset = 1
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
		Range = 40,
		Values = {9.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 110,
		Delay = 3,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
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
    game.Lighting.Ambient = Color3.fromRGB(255,0,0)
game:GetService("TweenService"):Create(game.Lighting, TweenInfo.new(5.5), {Ambient = Color3.fromRGB(67, 51, 56)}):Play()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    local start = Instance.new("Sound")
start.Parent = Workspace.Darkness
start.SoundId = "rbxassetid://9125713501"
start.Volume = 5
start:Play()

wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("I Comming! ",true)
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
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
		game.Players.LocalPlayer.Character.Humanoid:TakeDamage(1000)
		game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Darkness"
		        -- UI Construction
    
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

    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")

    JumpscareGui.Name = "JumpscareGui"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Background.Name = "Background"
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 999

    Face.Name = "Face"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0, 150, 0, 150)
    Face.Image = GitPNG("https://github.com/Script5039392/Png/blob/main/Darkness.jpg?raw=true", "Darkness")
    
    Background.Parent = JumpscareGui
    Face.Parent = Background
    
    task.wait(2)
    
    game.TweenService:Create(Face, TweenInfo.new(0.6), {Size = UDim2.new(0, 1850, 0, 1050), ImageTransparency = 0}):Play()
    task.wait(1)
    JumpscareGui:Destroy()
    local main_game = require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
    require(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Jumpscares.Death)(main_game)
	end
end)

---====== Run entity ======---

entity:Run()

-- Change
coroutine.wrap(function()
while true do wait(2.5)

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

local darkness = game.Workspace.Darkness:WaitForChild("DXRK-Z")
darkness.PointLight.Color = Color3.fromRGB(255, 0, 0)
darkness.PointLight.Range = 30
darkness.Static.PlaybackSpeed = 0.76
darkness.GlitchEffect.Texture = "rbxassetid://2581223252"
darkness.GlitchEffect.Drag = -4
darkness.Main.ParticleEmitter.Texture = GitPNG("https://github.com/Script5039392/Png/blob/main/Darkness.jpg?raw=true", "Darkness")
end
end)()
