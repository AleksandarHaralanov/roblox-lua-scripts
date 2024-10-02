local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer
local Humanoid = Player.Character:WaitForChild("Humanoid")

RunService.RenderStepped:Connect(function()
	local currentTime = tick()
	local BobbleX = nil
	local BobbleY = nil
	local Bobble = nil

	if Humanoid.MoveDirection.Magnitude > 0 and not Player:GetAttribute("Sprinting") and not Player:GetAttribute("Sneaking") then
		BobbleX = math.cos(currentTime * 5) * 0.5
		BobbleY = math.abs(math.sin(currentTime * 5)) * 0.5
		Bobble = Vector3.new(BobbleX, BobbleY, 0)
		Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Bobble, 0.25)
	elseif Humanoid.MoveDirection.Magnitude > 0 and Player:GetAttribute("Sprinting") then
		BobbleX = math.cos(currentTime * 15) * 0.75
		BobbleY = math.abs(math.sin(currentTime * 15)) * 0.75
		Bobble = Vector3.new(BobbleX, BobbleY, 0)
		Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Bobble, 0.25)
	elseif Humanoid.MoveDirection.Magnitude > 0 and Player:GetAttribute("Sneaking") then
		BobbleX = math.cos(currentTime * 2) * 1
		BobbleY = math.abs(math.sin(currentTime * 2)) * 1
		Bobble = Vector3.new(BobbleX, BobbleY, 0)
		Humanoid.CameraOffset = Humanoid.CameraOffset:lerp(Bobble, 0.25)
	else
		Humanoid.CameraOffset = Humanoid.CameraOffset * 0.75
	end
end)
