local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerPush = ReplicatedStorage:WaitForChild("PlayerPush")

PlayerPush.OnServerEvent:Connect(function(Player, Target)
	if Target and Target:FindFirstChild("Humanoid") then
		local tHRP = Target:FindFirstChild("HumanoidRootPart")
		local pHRP = Player.Character:FindFirstChild("HumanoidRootPart")
		local Humanoid = Target:FindFirstChild("Humanoid")
		
		local pushDirection = (tHRP.Position - pHRP.Position).Unit
		local bodyVelocity = Instance.new("BodyVelocity", tHRP)
		
		Humanoid.Sit = true
		
		bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		bodyVelocity.Velocity = pushDirection * 10
		
		task.wait(0.5)
		
		bodyVelocity:Destroy()
		
		Humanoid.Sit = false
	end
end)
