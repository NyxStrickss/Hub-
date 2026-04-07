local Login = {}

function Login:Start(callback)
	local Player = game.Players.LocalPlayer
	local TweenService = game:GetService("TweenService")

	local gui = Instance.new("ScreenGui", Player.PlayerGui)
	gui.Name = "LoginUI"

	-- 🌑 FONDO
	local bg = Instance.new("Frame", gui)
	bg.Size = UDim2.new(1,0,1,0)
	bg.BackgroundColor3 = Color3.fromRGB(10,10,10)

	-- 📦 PANEL
	local panel = Instance.new("Frame", bg)
	panel.Size = UDim2.new(0,0,0,0)
	panel.Position = UDim2.new(0.5,0,0.5,0)
	panel.AnchorPoint = Vector2.new(0.5,0.5)
	panel.BackgroundColor3 = Color3.fromRGB(20,20,20)

	Instance.new("UICorner", panel).CornerRadius = UDim.new(0,10)

	-- ✨ ANIMACIÓN
	TweenService:Create(panel, TweenInfo.new(0.4), {
		Size = UDim2.new(0,300,0,180)
	}):Play()

	-- 🏷️ TITLE
	local title = Instance.new("TextLabel", panel)
	title.Size = UDim2.new(1,0,0,40)
	title.Text = "🔐 PREMIUM LOGIN"
	title.TextColor3 = Color3.new(1,1,1)
	title.BackgroundTransparency = 1
	title.TextSize = 20

	-- ✏️ INPUT
	local box = Instance.new("TextBox", panel)
	box.Size = UDim2.new(0.8,0,0,35)
	box.Position = UDim2.new(0.1,0,0.4,0)
	box.PlaceholderText = "Enter Key..."
	box.Text = ""
	box.BackgroundColor3 = Color3.fromRGB(30,30,30)
	box.TextColor3 = Color3.new(1,1,1)

	Instance.new("UICorner", box)

	-- 🔘 BOTÓN LOGIN
	local btn = Instance.new("TextButton", panel)
	btn.Size = UDim2.new(0.8,0,0,35)
	btn.Position = UDim2.new(0.1,0,0.7,0)
	btn.Text = "LOGIN"
	btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
	btn.TextColor3 = Color3.new(1,1,1)

	Instance.new("UICorner", btn)

	-- ❌ TEXTO ERROR
	local status = Instance.new("TextLabel", panel)
	status.Size = UDim2.new(1,0,0,20)
	status.Position = UDim2.new(0,0,1,-20)
	status.Text = ""
	status.TextColor3 = Color3.fromRGB(255,80,80)
	status.BackgroundTransparency = 1
	status.TextSize = 14

	-- 🔐 VALIDACIÓN FAKE (puedes cambiar)
	local VALID_KEY = "NYXOP"

	btn.MouseButton1Click:Connect(function()
		if box.Text == VALID_KEY then
			status.Text = "Access Granted ✅"

			task.wait(0.5)

			gui:Destroy()
			callback() -- carga el hub

		else
			status.Text = "Invalid Key ❌"
		end
	end)
end

return Login
