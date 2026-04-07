local Login = {}

function Login:Start(callback)

	local HttpService = game:GetService("HttpService")

	local VALID_URL = "https://raw.githubusercontent.com/NyxStrickss/Hub-/main/keys.json"

	local Player = game.Players.LocalPlayer
	local gui = Instance.new("ScreenGui", Player.PlayerGui)

	local box = Instance.new("TextBox", gui)
	box.Size = UDim2.new(0,200,0,40)
	box.Position = UDim2.new(0.5,-100,0.5,-20)
	box.PlaceholderText = "Enter Key"

	local btn = Instance.new("TextButton", gui)
	btn.Size = UDim2.new(0,200,0,40)
	btn.Position = UDim2.new(0.5,-100,0.5,30)
	btn.Text = "LOGIN"

	btn.MouseButton1Click:Connect(function()

		local success, response = pcall(function()
			return game:HttpGet(VALID_URL)
		end)

		if success then
			local data = HttpService:JSONDecode(response)

			if data[box.Text] then
				gui:Destroy()
				callback()
			else
				box.Text = "INVALID KEY"
			end
		else
			box.Text = "ERROR API"
		end

	end)

end

return Login
