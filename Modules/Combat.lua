return function(UI, Modules)

	local tab = UI:CreateTab("Combat")

	UI:Toggle(tab, "Aim Assist", false, function(v)

		task.spawn(function()
			while v do
				local closest = nil
				local dist = math.huge

				for _,plr in pairs(game.Players:GetPlayers()) do
					if plr ~= game.Players.LocalPlayer and plr.Character then
						local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
						if hrp then
							local mag = (hrp.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
							if mag < dist then
								dist = mag
								closest = hrp
							end
						end
					end
				end

				if closest then
					game.Workspace.CurrentCamera.CFrame = CFrame.new(
						game.Workspace.CurrentCamera.CFrame.Position,
						closest.Position
					)
				end

				task.wait()
			end
		end)

	end)

end
