local UserInputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer
local Humanoid = Player.Character:WaitForChild("Humanoid")
local Sound = game.Workspace.Sounds.Sneak

UserInputService.InputBegan:Connect(function(Input)
	if Input.KeyCode == Enum.KeyCode.LeftControl then
		Humanoid.WalkSpeed = 4
		Sound:Play()
		Player:SetAttribute("Sneak", true)
	end
end)

UserInputService.InputEnded:Connect(function(Input)
	if Input.KeyCode == Enum.KeyCode.LeftControl then
		Humanoid.WalkSpeed = 8
		Player:SetAttribute("Sneak", false)
	end
end)
