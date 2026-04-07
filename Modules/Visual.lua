return function(UI, Modules)

	local tab = UI:CreateTab("Visual")

	-- CROSSHAIR
	UI:Toggle(tab, "Crosshair", false, function(v)
		if v then
			local cross = Instance.new("Frame", game.CoreGui)
			cross.Name = "Crosshair"
			cross.Size = UDim2.new(0,6,0,6)
			cross.Position = UDim2.new(0.5,-3,0.5,-3)
			cross.BackgroundColor3 = Color3.fromRGB(0,255,255)
		else
			if game.CoreGui:FindFirstChild("Crosshair") then
				game.CoreGui.Crosshair:Destroy()
			end
		end
	end)

	-- ESP
	UI:Toggle(tab, "ESP Players", false, function(v)
		for _,plr in pairs(game.Players:GetPlayers()) do
			if plr ~= game.Players.LocalPlayer and plr.Character then
				local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					if v then
						local box = Instance.new("BoxHandleAdornment")
						box.Adornee = hrp
						box.Size = Vector3.new(4,6,2)
						box.Color3 = Color3.fromRGB(0,255,255)
						box.AlwaysOnTop = true
						box.Parent = game.CoreGui
					else
						for _,v in pairs(game.CoreGui:GetChildren()) do
							if v:IsA("BoxHandleAdornment") then
								v:Destroy()
							end
						end
					end
				end
			end
		end
	end)

end
