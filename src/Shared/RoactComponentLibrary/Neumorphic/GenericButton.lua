local import = require(game.ReplicatedStorage.Shared.packages.Import)

local Roact = import "Packages/Roact"
local Components = import "Components"
local MaterialUI = import "Shared/assets/MaterialUI"

local GenericButton = Roact.Component:extend("GenericButton")

local Folder = MaterialUI.Neumorphic.Buttons["Hexagon v2"]

local function shade(props)
	local search = props.search or Folder
	local elements = props.elements or {}

	for inst, value in pairs(search) do
		if type(value)==type("") then
			elements[inst] = Roact.createElement(
				"ImageLabel",
				{
					Name=inst,
					Image=value,
					Size=UDim2.new(1,0,1,0),
					BackgroundTransparency = 1
				}
			)
		elseif type(value)==type({}) then
			local n = Roact.createElement(
				"Folder",
				{Name=inst},
				{
					Shading = shade({search=value,elements={}})
				}
			)
			elements[inst] = n
		end
	end

	return Roact.createFragment(elements)
end

function GenericButton:init()
	self:setState({
		Icon = self.props.icon,
		Color = self.props.iconColor,
		Layer = self.props.layer,
	})
end

function GenericButton:render()
	return Roact.createElement(
		"ImageButton",
		{
			Name = "GenericButton",
			Position = self.props.pos,
			Size = self.props.size,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1
		},
		{
			Shading = Roact.createElement(shade),
			Icon = Roact.createElement(
				require(Components.Icons[self.state.Icon]),
				{
					size = UDim2.new(1, 0, 1, 0),
					iconColor = self.state.Color,
					layer = self.state.Layer + 1
				}
			),
			UIAspectRatioConstraint = Roact.createElement("UIAspectRatioConstraint")
		}
	)
end

return GenericButton