local UI = {}

function UI:Init(Config)
	local self = {}

	local Player = game.Players.LocalPlayer
	local TweenService = game:GetService("TweenService")
	local Lighting = game:GetService("Lighting")

	-- 🌫️ BLUR
	local blur = Instance.new("BlurEffect", Lighting)
	blur.Size = 0

	-- 🎮 GUI
	local gui = Instance.new("ScreenGui", Player.PlayerGui)
	gui.Name = "UltraPremiumUI"

	-- 🌑 MAIN
	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0,0,0,0)
	main.Position = UDim2.new(0.5,0,0.5,0)
	main.AnchorPoint = Vector2.new(0.5,0.5)
	main.BackgroundColor3 = Color3.fromRGB(15,15,15)
	main.Active = true
	main.Draggable = true

	Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

	-- ✨ OPEN ANIMATION
	TweenService:Create(main, TweenInfo.new(0.4), {
		Size = UDim2.new(0,540,0,380)
	}):Play()

	TweenService:Create(blur, TweenInfo.new(0.4), {
		Size = 20
	}):Play()

	-- 🌈 RGB LINE
	local topLine = Instance.new("Frame", main)
	topLine.Size = UDim2.new(1,0,0,3)
	topLine.BackgroundColor3 = Color3.fromRGB(255,0,0)

	task.spawn(function()
		while true do
			for i = 0,1,0.01 do
				topLine.BackgroundColor3 = Color3.fromHSV(i,1,1)
				task.wait()
			end
		end
	end)

	-- 🏷️ TITLE
	local title = Instance.new("TextLabel", main)
	title.Size = UDim2.new(1,0,0,40)
	title.Text = "💀 ULTRA HUB"
	title.TextColor3 = Color3.new(1,1,1)
	title.BackgroundTransparency = 1
	title.TextSize = 22
	local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(255,60,60)
close.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner", close)

close.MouseButton1Click:Connect(function()
	main:Destroy()
end)

	-- 📑 SIDEBAR
	local sidebar = Instance.new("Frame", main)
	sidebar.Size = UDim2.new(0,150,1,-40)
	sidebar.Position = UDim2.new(0,0,0,40)
	sidebar.BackgroundColor3 = Color3.fromRGB(20,20,20)

	Instance.new("UICorner", sidebar)

	local tabLayout = Instance.new("UIListLayout", sidebar)
	tabLayout.Padding = UDim.new(0,6)

	-- 📦 CONTENT
	local content = Instance.new("Frame", main)
	content.Size = UDim2.new(1,-160,1,-50)
	content.Position = UDim2.new(0,160,0,45)
	content.BackgroundTransparency = 1

	self.Pages = {}

	-- 🔘 TAB
	function self:CreateTab(name)
		local button = Instance.new("TextButton", sidebar)
		button.Size = UDim2.new(1,-10,0,32)
		button.Text = name
		button.BackgroundColor3 = Color3.fromRGB(30,30,30)
		button.TextColor3 = Color3.new(1,1,1)

		Instance.new("UICorner", button)

		local page = Instance.new("Frame", content)
		page.Size = UDim2.new(1,0,1,0)
		page.Visible = false
		page.BackgroundTransparency = 1

		local layout = Instance.new("UIListLayout", page)
		layout.Padding = UDim.new(0,10)

		self.Pages[name] = page

		button.MouseButton1Click:Connect(function()
			for _,p in pairs(self.Pages) do p.Visible = false end

			page.Visible = true
			page.Position = UDim2.new(0,50,0,0)
			page.BackgroundTransparency = 1

			TweenService:Create(page, TweenInfo.new(0.3), {
				Position = UDim2.new(0,0,0,0)
			}):Play()
		end)

		return page
	end

	-- 🔘 TOGGLE PRO
	function self:Toggle(parent, text, default, callback)
		local frame = Instance.new("Frame", parent)
		frame.Size = UDim2.new(1,0,0,34)
		frame.BackgroundColor3 = Color3.fromRGB(25,25,25)

		Instance.new("UICorner", frame)

		local label = Instance.new("TextLabel", frame)
		label.Size = UDim2.new(0.7,0,1,0)
		label.Text = text
		label.TextColor3 = Color3.new(1,1,1)
		label.BackgroundTransparency = 1

		local toggle = Instance.new("Frame", frame)
		toggle.Size = UDim2.new(0,40,0,20)
		toggle.Position = UDim2.new(1,-50,0.5,-10)
		toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)

		Instance.new("UICorner", toggle)

		local dot = Instance.new("Frame", toggle)
		dot.Size = UDim2.new(0,18,0,18)
		dot.Position = UDim2.new(0,1,0,1)
		dot.BackgroundColor3 = Color3.new(1,1,1)

		Instance.new("UICorner", dot)

		local state = default

		local function update()
			if state then
				TweenService:Create(dot, TweenInfo.new(0.2), {
					Position = UDim2.new(1,-19,0,1)
				}):Play()
				toggle.BackgroundColor3 = Color3.fromRGB(0,170,255)
			else
				TweenService:Create(dot, TweenInfo.new(0.2), {
					Position = UDim2.new(0,1,0,1)
				}):Play()
				toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)
			end
		end

		update()

		frame.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 then
				state = not state
				update()
				callback(state)
			end
		end)
	end

	return self
end

return UI
