local import = require(game:GetService("ReplicatedStorage"):WaitForChild("Shared").packages.Import)
local Roact = import "Packages/Roact"
local GenericButton = import "Components/Neumorphic/GenericButton"
local UIRadialConstraint = import "Components/UIConstraints/UIRadialConstraint"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local DemoUI = Instance.new("ScreenGui")

local Background = Instance.new("Frame")
Background.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.AnchorPoint = Vector2.new(0.5, 0.5)

local TestFrame = Instance.new("Frame")
TestFrame.Size = UDim2.new(0.85, 0, 0.85, 0)
TestFrame.AnchorPoint = Vector2.new(0.5, 0.5)
TestFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TestFrame.BackgroundTransparency = 1

local AspectRatio = Instance.new("UIAspectRatioConstraint")
AspectRatio.Parent = TestFrame

local RadialMenuButtons = {
	["Maps"] = {
		Component = GenericButton,
		Icon = "PowerOff",
		IconColor = Color3.fromHSV(0,0,1)
	},
	["Weapons"] = {
		Component = GenericButton,
		Icon = "PowerOff",
		IconColor = Color3.fromHSV(0,0,1)
	},
	["Teams"] = {
		Component = GenericButton,
		Icon = "PowerOff",
		IconColor = Color3.fromHSV(0,0,1)
	},
	["Gamemodes"] = {
		Component = GenericButton,
		Icon = "PowerOff",
		IconColor = Color3.fromHSV(0,0,1)
	},
	["Settings"] = {
		Component = GenericButton,
		Icon = "PowerOff",
		IconColor = Color3.fromHSV(0,0,1)
	},
	["Presets"] = {
		Component = GenericButton,
		Icon = "PowerOff",
		IconColor = Color3.fromHSV(0,0,1)
	},
}

local handle = Roact.mount(
	Roact.createElement(
		UIRadialConstraint,
		{
			sortOrder = Enum.SortOrder.Name,
			anchor = Vector2.new(0.5, 0.5),
			radius = 0.3,
			cellSize = Vector2.new(0.2, 0),
			elements = RadialMenuButtons,
			layer = 2,
		}
	),
	TestFrame
)

Background.Parent = DemoUI
TestFrame.Parent = DemoUI

DemoUI.Parent = PlayerGui