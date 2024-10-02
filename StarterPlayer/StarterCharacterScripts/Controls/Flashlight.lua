local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Player = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local Flashlight = game:GetService("ReplicatedStorage").Flashlight:Clone()
local Sound = game.Workspace.Sounds.Flashlight
local Mouse = game.Players.LocalPlayer:GetMouse()
local TI = TweenInfo.new(0.25, Enum.EasingStyle.Sine)

Flashlight.Parent = script.Parent

UserInputService.InputBegan:Connect(function(Key)
	if Key.KeyCode == Enum.KeyCode.F then
		Player:SetAttribute("Flashlight", not Player:GetAttribute("Flashlight"))
		TweenService:Create(Flashlight.Light, TI, {Brightness = Player:GetAttribute("Flashlight") and 1 or 0}):Play()
		if Player:GetAttribute("Flashlight") then
			Sound.PlaybackSpeed = 1
		else
			Sound.PlaybackSpeed = 0.66
		end
		Sound:Play()
	end
end)

RunService.RenderStepped:Connect(function()
	Flashlight.Position = Camera.CFrame.Position
	TweenService:Create(Flashlight, TI, {CFrame = CFrame.lookAt(Flashlight.Position, Mouse.Hit.Position)}):Play()
end)
