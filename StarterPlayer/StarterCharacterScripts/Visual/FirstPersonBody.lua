local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")

Humanoid.CameraOffset = Vector3.new(0, 0, -1)

for i, Player in pairs(Character:GetChildren()) do
	task.wait()
	if Player:IsA("BasePart") and Player.Name ~= "Head" then
		Player:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
			Player.LocalTransparencyModifier = Player.Transparency
		end)
		Player.LocalTransparencyModifier = Player.Transparency
	end
end

RunService.RenderStepped:Connect(function(step)
	local Ray = Ray.new(Character.Head.Position, ((Character.Head.CFrame + Character.Head.CFrame.LookVector * 2) - Character.Head.Position).Position.Unit)
	local ignoreList = Character:GetChildren()
	local Hit, Pos = game.Workspace:FindPartOnRayWithIgnoreList(Ray, ignoreList)

	if Hit then
		Humanoid.CameraOffset = Vector3.new(0, 0, -(Character.Head.Position - Pos).magnitude)
	else
		Humanoid.CameraOffset = Vector3.new(0, 0, -1.5)
	end
end)
