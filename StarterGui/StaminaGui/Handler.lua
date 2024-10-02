local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")

local StaminaGui = script.Parent
local Holder = StaminaGui:WaitForChild("Holder")
local Bar = Holder:WaitForChild("Bar")

local Stamina = script.Stamina
local Held = false
local TI = TweenInfo.new(0.01, Enum.EasingStyle.Quint)

UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
	if not GameProcessedEvent then
		if Input.KeyCode == Enum.KeyCode.LeftShift then
			Held = true
		end
	end
end)

UserInputService.InputEnded:Connect(function(Input, GameProcessedEvent)
	if not GameProcessedEvent then
		if Input.KeyCode == Enum.KeyCode.LeftShift then
			Held = false
			Humanoid.WalkSpeed = 8
			Player:SetAttribute("Run", false)
		end
	end
end)

local function UpdateGui(newValue)
	if newValue < 0 then
		newValue = 0
	elseif newValue > 100 then
		newValue = 100
	end
	Stamina.Value = newValue
	TweenService:Create(Bar, TI, {Size = UDim2.new(newValue / 100, 0, 1, 0)}):Play()
end

script.Exhaustion.Event:Connect(function()
	Held = false
	Humanoid.WalkSpeed = 8
	Player:SetAttribute("Run", false)
	task.wait(1)
	Stamina.Value = 0.01
end)

local lastUpdate = tick()

RunService.Heartbeat:Connect(function(deltaTime)
	local currentTime = tick()
	local deltaTime = currentTime - lastUpdate
	if Stamina.Value <= 0 then
		script.Exhaustion:Fire()
	else
		if Held and Humanoid.MoveDirection.Magnitude ~= 0 then
			Humanoid.WalkSpeed = 16
			Player:SetAttribute("Run", true)
			UpdateGui(Stamina.Value - 15 * deltaTime)
		else
			UpdateGui(Stamina.Value + 2 * deltaTime)
		end
	end
	lastUpdate = currentTime
end)

