local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local cam = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local can = true
local Distort = game:GetObjects("rbxassetid://12672410595")[1]
Distort.Parent = workspace
local primary_part = Distort:FindFirstChildWhichIsA("BasePart") or Distort:FindFirstChildWhichIsA("Part")
Distort.PrimaryPart = primary_part

Distort:SetPrimaryPartCFrame(chr.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))

local spawn = Instance.new("Sound")
spawn.Parent = Workspace.Distort
spawn.SoundId = "rbxassetid://9126214610"
spawn.Volume = 5
spawn:Play()

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

game.Workspace.Distort.SFX.SoundPart.Attachment:WaitForChild("Entity ").Texture = GitPNG("https://github.com/Script5039392/Png/blob/main/Picsart_25-01-17_22-05-43-970.png?raw=true", "Distort")

function GitAud(soundgit,filename)
    SoundName=tostring(SoundName)
    local url=soundgit
    local FileName = filename
    writefile(FileName..".mp3", game:HttpGet(url))
    return (getcustomasset or getsynasset)(FileName..".mp3")
end

function CustomGitSound(soundlink, vol, filename)
    local Ambience = Instance.new("Sound")
    Ambience.SoundId = GitAud(soundlink, filename)
    Ambience.Parent = workspace.Distort.SFX.SoundPart
    Ambience.Volume = 0.95
    Ambience.MaxDistance = 25
    Ambience.Pitch = 0.95
    Ambience.PlaybackSpeed = 1.5
    Ambience.Looped = true
    Ambience:Play()
end

CustomGitSound("https://github.com/Script5039392/Entities/blob/main/horror-ambience-01-66708.mp3?raw=true", 1, "DistortSound")

local function look()
    local direction = (Distort.PrimaryPart.Position - cam.CFrame.Position).unit
    local dot_product = direction:Dot(cam.CFrame.LookVector)
    return dot_product > 0.95
end

task.spawn(function()
while can == true do wait(0.08)
if not look() then
if not game.Players.LocalPlayer.Character:GetAttribute("Hiding") then
    game.Players.LocalPlayer.Character.Humanoid:TakeDamage(0.05)
    game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Distort"
end
end
end
end)

wait(math.random(3, 8))
can = false
tp = false
game.Workspace.Distort:Destroy()
if game.Players.LocalPlayer.Character.Humanoid.Health >= 60 then

caa = 0
tween = game:GetService("TweenService")
local TestMultplayer = true
if game:GetService("ReplicatedStorage"):FindFirstChild("DT") then
    print("?")
    return true
end

local Test = Instance.new("Part")
Test.Name = "DT"
Test.Parent = game:GetService("ReplicatedStorage")
Test = 1

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

local Details = {
	Description = "Look At Me",
	Title = "Lock Your Eyes.",
	Reason =  "Encounter Distort.",
	Icon = GitPNG("https://github.com/Script5039392/Png/blob/main/DistortBalge.png?raw=true", "DistortBalge")
}

local GUI = plr.PlayerGui.MainUI
local TweenService = game:GetService("TweenService");
local AchievementsHolder = GUI.AchievementsHolder.Achievement:Clone();
AchievementsHolder.Size = UDim2.new(0, 0, 0, 0);
AchievementsHolder.Frame.Position = UDim2.new(1.1, 0, 0, 0);
AchievementsHolder.Name = "LiveAchievement";
AchievementsHolder.Visible = true;
AchievementsHolder.Parent = GUI.AchievementsHolder;
AchievementsHolder.Frame.Details.Desc.Text = Details.Description
AchievementsHolder.Frame.Details.Title.Text = Details.Title
AchievementsHolder.Frame.Details.Reason.Text = Details.Reason
AchievementsHolder.Frame.ImageLabel.Image = Details.Icon
AchievementsHolder.Sound:Play();
AchievementsHolder:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true);
wait(0.8);
AchievementsHolder.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true);
TweenService:Create(AchievementsHolder.Frame.Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
	ImageTransparency = 1
}):Play();
wait(8);
AchievementsHolder.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true);
wait(0.5);
AchievementsHolder:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true);
wait(0.5);
AchievementsHolder:Destroy();

end
