local damagess = true
local tweenservice = game:GetService("TweenService")

_G.baseval = 6
local model = game:GetObjects("rbxassetid://12813331519")[1].holenew
model.atta.Light.Range = 0
model.Anchored = true
model.Parent = game.Workspace
model.CFrame = game.Workspace.CurrentRooms:GetChildren()[#game.Workspace.CurrentRooms:GetChildren() - 1].Parts.Floor.CFrame + Vector3.new(0,6,0)
local anim = tweenservice:Create(model.atta.Light,TweenInfo.new(1,Enum.EasingStyle.Linear),{Range = 21})
anim:Play()
task.wait(3)
task.spawn(function()
	while damagess == true do
	    task.wait(1)
	    local _ , camera = game.Workspace.CurrentCamera:WorldToViewportPoint(model.Position)
	    if not camera then
            	game.Players.LocalPlayer.Character.Humanoid:TakeDamage(10)
                firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"You died to Hole","If you see him dont look away","You should look at him or else you die"},"Blue")
                game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Hole"
	    end
    end
end)
game.Workspace.CurrentRooms.ChildAdded:connect(function()
	damagess = false
  _G.baseval = -2
    model.Ambience:Destroy()
    model.Spawn:Destroy()
    local anim1 = tweenservice:Create(model.atta.Light,TweenInfo.new(2,Enum.EasingStyle.Linear),{Range = 0})
    anim1:Play()
    task.wait(2)
    model:Destroy()
end)