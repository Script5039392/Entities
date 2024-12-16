local damages = true
local tweenservice = game:GetService("TweenService")

game.Workspace.CurrentRooms:GetChildren()[#game.Workspace.CurrentRooms:GetChildren() - 1]:SetAttribute("Ambient",Color3.new(0.627451, 0.352941, 0.054902))
_G.baseval = 6
local model = game:GetObjects("rbxassetid://12712500267")[1].holenew
model.atta.Light.Range = 0
model.Anchored = true
model.Parent = game.Workspace
model.CFrame = game.Workspace.CurrentRooms:GetChildren()[#game.Workspace.CurrentRooms:GetChildren() - 1].Parts.Floor.CFrame + Vector3.new(0,7,0)
model.Ambience:Play()
model.Spawn:Play()
task.wait(3)
task.spawn(function()
	while damages == true do
	    task.wait(0.3)
        local ray = game.Workspace:Raycast(model.Position,game.Players.LocalPlayer.Character.HumanoidRootPart.Position - model.Position)
        if ray.Instance.Parent == game.Players.LocalPlayer.Character or ray.Instance.Parent.Parent == game.Players.LocalPlayer.Character then
            warn("parent")
            local light = Instance.new("PointLight",game.Players.LocalPlayer.Character.HumanoidRootPart)
            light.Color = Color3.fromRGB(255, 64, 0)
            light.Brightness = 5
            light.Range = 20
            local anim = game:GetService("TweenService"):Create(light,TweenInfo.new(0.3,Enum.EasingStyle.Linear),{Range = 0})
            local anim2 = game:GetService("TweenService"):Create(light,TweenInfo.new(0.3,Enum.EasingStyle.Linear),{Brightness = 0})
            anim:Play()
            anim2:Play()
            game.Players.LocalPlayer.Character.Humanoid:TakeDamage(5)
            game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Flame"
        end
    end
end)

task.wait(math.random(5, 20))

damages = false
_G.baseval = -2
model.Position = Vector3.new(0,10000000000,0)
model:Destroy()

task.wait(2)

if game.Players.LocalPlayer.Character.Humanoid.Health > 50 then
caa = 0
tween = game:GetService("TweenService")
local TestMultplayer = true
if game:GetService("ReplicatedStorage"):FindFirstChild("FLAME") then
    print("?")
    return true
end

local Test = Instance.new("Part")
Test.Name = "FLAME"
Test.Parent = game:GetService("ReplicatedStorage")
Test = 1
---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Im Feel Fire.",
    Desc = "One Wrong Step And You Will Die.",
    Reason = "Encounter Flame.",
    Image = "http://www.roblox.com/asset/?id=111338418814509"
})
end
