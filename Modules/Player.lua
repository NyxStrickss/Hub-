return function(UI, Modules)

	local tab = UI:CreateTab("Player")
	local plr = game.Players.LocalPlayer

	-- SPEED
	UI:Slider(tab, "Speed", 16, 100, function(val)
		if plr.Character then
			plr.Character.Humanoid.WalkSpeed = val
		end
	end)

	-- JUMP
	UI:Slider(tab, "Jump", 50, 200, function(val)
		if plr.Character then
			plr.Character.Humanoid.JumpPower = val
		end
	end)

	-- FLY
	UI:Toggle(tab, "Fly", false, function(v)
		if v then
			local bv = Instance.new("BodyVelocity", plr.Character.HumanoidRootPart)
			bv.Velocity = Vector3.new(0,50,0)
			bv.Name = "Fly"
		else
			if plr.Character.HumanoidRootPart:FindFirstChild("Fly") then
				plr.Character.HumanoidRootPart.Fly:Destroy()
			end
		end
	end)

end
