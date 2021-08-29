local import = require(game.ReplicatedStorage.Shared.packages.Import)

local ICON_NAME = "PowerOff"

local Roact = import "Packages/Roact"
local MaterialUI = import "Shared/assets/MaterialUI"

local PowerOff = Roact.Component:extend("Icon")

local Folder = MaterialUI[".icons"][ICON_NAME]
local Icon = Folder[".icon"]

local function shade(props)
	local shading = {}
	for name, image in pairs(Folder) do
		if name ~= ".icon" then
			shading[name] = Roact.createElement(
				"ImageLabel",
				{
					Name = name,
					Image = image,
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1
				}
			)
		end
	end
	return Roact.createFragment(shading)
end

function PowerOff:init()

end

function PowerOff:render()
	return Roact.createElement(
		"ImageLabel",
		{
			Image=Icon,
			Size=self.props.size,
			BackgroundTransparency = 1,
			ImageColor3 = self.props.iconColor,
			ZIndex=self.props.layer
		},
		{
			Shading = Roact.createElement(shade)
		}
	)
end

return PowerOff