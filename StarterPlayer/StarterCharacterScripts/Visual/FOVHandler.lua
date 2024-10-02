local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = game:GetService("Workspace").CurrentCamera
local Player = game:GetService("Players").LocalPlayer
local Humanoid = Player.Character:WaitForChild("Humanoid")
local TI = TweenInfo.new(0.2, Enum.EasingStyle.Sine)

Camera.FieldOfView = 60

RunService.RenderStepped:Connect(function()
	if Player:GetAttribute("Run") then
		TweenService:Create(Camera, TI, {FieldOfView = 70}):Play()
	elseif Player:GetAttribute("Sneak") then
		TweenService:Create(Camera, TI, {FieldOfView = 55}):Play()
	else
		TweenService:Create(Camera, TI, {FieldOfView = 60}):Play()
	end
end)
