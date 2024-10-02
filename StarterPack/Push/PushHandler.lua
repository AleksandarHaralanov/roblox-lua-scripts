dlocal Player = game:GetService("Players").LocalPlayer
local Push = script.Parent
local PlayerPush = game:GetService("ReplicatedStorage"):WaitForChild("PlayerPush")
local Mouse = Player:GetMouse()
local Sound = script.Parent.PushSound

Push.Activated:Connect(function()
	if Push:GetAttribute("Cooldown") then
		return
	else
		Push:SetAttribute("Cooldown", true)
		Sound:Play()
		if (Mouse.Target) then
			local Target = Mouse.Target.Parent

			if (Target and Target:FindFirstChild("Humanoid") and Target.Name ~= Player.Name) then
				PlayerPush:FireServer(Target)
			end
		end
		task.wait(10)
		Push:SetAttribute("Cooldown", false)
	end
end)
