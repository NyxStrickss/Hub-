local Login = {}

function Login:Start(callback)

	local HttpService = game:GetService("HttpService")
	local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

	-- 🔥 TU API REAL
	local API = "https://hub-a8m0.onrender.com/verify"

	-- Detecta request según executor
	local request = syn and syn.request or http_request or request

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

		local data = {
			key = box.Text,
			hwid = hwid
		}

		local response = request({
			Url = API,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode(data)
		})

		local result = HttpService:JSONDecode(response.Body)

		if result.status == "success" then
			gui:Destroy()
			callback()

		elseif result.status == "activated" then
			box.Text = "KEY ACTIVADA 🔥"

		elseif result.status == "used" then
			box.Text = "KEY EN USO ❌"

		else
			box.Text = "INVALID KEY ❌"
		end

	end)

end

return Login
