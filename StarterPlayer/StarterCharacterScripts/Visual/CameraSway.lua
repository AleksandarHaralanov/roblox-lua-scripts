local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = game:GetService("Workspace").CurrentCamera
local Turn = 0

local Lerp = function(a, b, t)
	return a + (b - a) * t
end;

RunService:BindToRenderStep("CameraSway", Enum.RenderPriority.Camera.Value + 1, function(DeltaTime)
	local MouseDelta = UserInputService:GetMouseDelta()

	Turn = Lerp(Turn, math.clamp(MouseDelta.X, -6, 6), (6 * DeltaTime))

	Camera.CFrame = Camera.CFrame * CFrame.Angles(0, 0, math.rad(Turn))
end)
