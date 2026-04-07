return function(UI, Modules)

	local page = UI:CreateTab("Radar")
	
	UI:Toggle(page,"Radar",false,function(v)
		Modules.Config.Radar = v
	end)

end
