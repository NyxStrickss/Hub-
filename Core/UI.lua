local UI = {}

function UI:Init(Config)
	local self = {}
	
	local gui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	
	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0,500,0,350)
	main.Position = UDim2.new(0,100,0.5,-175)
	main.BackgroundColor3 = Color3.fromRGB(15,15,15)
	main.Active = true
	main.Draggable = true
	
	self.Pages = {}
	
	function self:CreateTab(name)
		local page = Instance.new("Frame", main)
		page.Size = UDim2.new(1,-20,1,-80)
		page.Position = UDim2.new(0,10,0,70)
		page.Visible = false
		
		self.Pages[name] = page
		return page
	end
	
	function self:Toggle(parent, text, default, callback)
		local t = Instance.new("TextButton", parent)
		t.Size = UDim2.new(0,180,0,30)
		t.Text = text
		
		local state = default
		
		t.MouseButton1Click:Connect(function()
			state = not state
			callback(state)
		end)
	end
	
	return self
end

return UI
