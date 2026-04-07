return function(UI, Modules)

	local tab = UI:CreateTab("Misc")

	-- REJOIN
	UI:Toggle(tab, "Rejoin", false, function()
		game:GetService("TeleportService"):Teleport(game.PlaceId)
	end)

	-- FPS BOOST
	UI:Toggle(tab, "FPS Boost", false, function(v)
		if v then
			for _,v in pairs(game:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Material = Enum.Material.SmoothPlastic
				end
			end
		end
	end)

end
