local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")

local LoadingGui = script:WaitForChild("LoadingGui"):Clone()

repeat task.wait(0.1) until game:IsLoaded()

local Assets = game:GetDescendants()
local MaxAssets = #Assets

local Player = Players.LocalPlayer

local PlayerGui = Player:WaitForChild("PlayerGui")

LoadingGui.Parent = PlayerGui

for i, v in Assets do
	ContentProvider:PreloadAsync({v})
	LoadingGui:WaitForChild("Holder"):WaitForChild("Status").Text = i.."/"..MaxAssets
end

LoadingGui:Destroy()
