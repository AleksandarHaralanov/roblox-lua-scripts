local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ContentProvider = game:GetService("ContentProvider")
local TweenService = game:GetService("TweenService")

local LoadingGui = script.Parent
local Main = LoadingGui:WaitForChild("Main")
local Holder = Main:WaitForChild("Holder")

local TweenInfoBar = TweenInfo.new(0.2, Enum.EasingStyle.Quint)
local TweenInfoFadeOut = TweenInfo.new(1, Enum.EasingStyle.Quint)

ReplicatedFirst:RemoveDefaultLoadingScreen()

local Assets = game:GetDescendants()

for i = 1, #Assets do
	local Asset = Assets[i]
	local Percentage = math.round(i / #Assets * 100)
	ContentProvider:PreloadAsync({Asset})
	Holder.AssetsLoaded.Text = "Loading Assets ("..i.."/"..#Assets..")"
	TweenService:Create(Holder.Bar, TweenInfoBar, {Size = UDim2.fromScale(Percentage / 100, 1)}):Play()
end

TweenService:Create(Main, TweenInfoFadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(Holder, TweenInfoFadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(Holder.Bar, TweenInfoFadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(Holder.AssetsLoaded, TweenInfoFadeOut, {TextTransparency = 1}):Play()
TweenService:Create(Holder.UIStroke, TweenInfoFadeOut, {Transparency = 1}):Play()
TweenService:Create(Holder.AssetsLoaded.UIStroke, TweenInfoFadeOut, {Transparency = 1}):Play()

task.wait(1.5)

LoadingGui:Destroy()
